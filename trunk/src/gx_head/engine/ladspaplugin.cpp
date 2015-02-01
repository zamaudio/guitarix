/*
 * Copyright (C) 2012 Andreas Degert, Hermann Meyer
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include <dlfcn.h>
#include <ladspa.h>

#include "engine.h"

using gx_system::JsonException;
using gx_system::JsonParser;
using gx_system::to_string;
using Glib::ustring;

namespace gx_engine {

/****************************************************************
 ** class LadspaDsp
 */

class LadspaDsp: public PluginDef {
private:
    static void init(unsigned int samplingFreq, PluginDef *plugin);
    static void mono_process(int count, float *input, float *output, PluginDef *plugin);
    static void stereo_process(int count, float *input1, float *input2, float *output1, float *output2, PluginDef *plugin);
    static int activate(bool start, PluginDef *plugin);
    static int registerparam(const ParamReg& reg);
    static int uiloader(const UiBuilder& builder, int form);
    static void del_instance(PluginDef *plugin);
    //
    const LADSPA_Descriptor *desc;
    void *handle;
    LADSPA_Handle instance;
    LADSPA_Data *ports;
    Glib::ustring name_str;
    const plugdesc *pd;
    bool is_activated;
    void connect(int tp, int i, float *v);
    inline void cleanup();
    void set_shortname();
    float dry_wet;
    std::string idd;
    inline void mono_dry_wet(int count, float *input0, float *input1, float *output0);
    inline void stereo_dry_wet(int count, float *input0, float *input1, float *input2, float *input3, float *output0, float *output1);
    std::string make_id(const paradesc& p);
    LadspaDsp(const plugdesc *plug, void *handle_, const LADSPA_Descriptor *desc_, bool mono);
    ~LadspaDsp();
public:
    static LadspaDsp *create(const plugdesc *plug);
    void set_plugdesc(const plugdesc* pd_);
};

LadspaDsp *LadspaDsp::create(const plugdesc *plug) {
    void *handle;
    handle = dlopen(plug->path.c_str(), RTLD_LOCAL|RTLD_NOW);
    if (!handle) {
	gx_print_error("ladspaloader",ustring::compose(_("Cannot open plugin: %1 [%2]"), plug->path, dlerror()));
	return NULL;
    }
    LADSPA_Descriptor_Function ladspa_descriptor = (LADSPA_Descriptor_Function)dlsym(handle, "ladspa_descriptor");
    const char *dlsym_error = dlerror();
    if (dlsym_error) {
	gx_print_error("ladspaloader",ustring::compose(_("Cannot load symbol 'ladspa_descriptor': %1"), dlsym_error));
	dlclose(handle);
	handle = 0;
	return NULL;
    }
    const LADSPA_Descriptor *desc = ladspa_descriptor(plug->index);
    if (!desc || desc->UniqueID != plug->UniqueID) {
	for (int i = 0; ; i++) {
	    desc = ladspa_descriptor(i);
	    if (!desc) {
		break;
	    }
	    if (desc->UniqueID == plug->UniqueID) {
		break;
	    }
	}
    }
    if (!desc) {
	gx_print_error("ladspaloader",ustring::compose(_("Cannot load ladspa descriptor #%1 from %2"), plug->index, plug->path));
	dlclose(handle);
	handle = 0;
	return NULL;
    }
    if (desc->UniqueID == 4069 || desc->UniqueID == 4070) {
	gx_print_error("ladspaloader",_("ladspa_guitarix not loaded"));
	dlclose(handle);
	handle = 0;
	return NULL;
    }
    int num_inputs = 0;
    int num_outputs = 0;
    for (unsigned int i = 0; i < desc->PortCount; ++i) {
	if (LADSPA_IS_PORT_AUDIO(desc->PortDescriptors[i])) {
	    if (LADSPA_IS_PORT_INPUT(desc->PortDescriptors[i])) {
		num_inputs += 1;
	    } else { // LADSPA_IS_PORT_OUTPUT(desc->PortDescriptors[i])
		num_outputs += 1;
	    }
	}
    }
    bool mono;
    if (num_inputs == 1 && num_outputs == 1) {
	mono = true;
    } else if (num_inputs == 2 && num_outputs == 2) {
	mono = false;
    } else {
	gx_print_error(
	    "ladspaloader",ustring::compose(
		_("cannot use ladspa plugin %1 with %2 inputs and %3 outputs"),
		desc->Label, num_inputs, num_outputs));
	dlclose(handle);
	handle = 0;
	return NULL;
    }
    return new LadspaDsp(plug, handle, desc, mono);
}

LadspaDsp::LadspaDsp(const plugdesc *plug, void *handle_, const LADSPA_Descriptor *desc_, bool mono)
    : PluginDef(), desc(desc_), handle(handle_), instance(),
      ports(new LADSPA_Data[desc->PortCount]), name_str(), pd(plug), is_activated(false) {
    version = PLUGINDEF_VERSION;
    id = pd->id_str.c_str();
    category = pd->category.c_str();
    description = desc->Name;
    name = desc->Name;
    set_shortname();
    set_samplerate = init;
    if (mono) {
	mono_audio = mono_process;
    } else {
	stereo_audio = stereo_process;
    }
    activate_plugin = activate;
    register_params = registerparam;
    load_ui = uiloader;
    delete_instance = del_instance;
}

inline void LadspaDsp::cleanup() {
    if (instance) {
	if (pd->quirks & need_activate) {
	    activate(true, this);
	}
	activate(false, this);
	if (!(pd->quirks & no_cleanup)) {
	    desc->cleanup(instance);
	}
	instance = 0;
    }
}

void paradesc::readJSON(gx_system::JsonParser& jp) {
    jp.next(gx_system::JsonParser::begin_object);
    while (jp.peek() != gx_system::JsonParser::end_object) {
	jp.next(gx_system::JsonParser::value_key);
	if (jp.read_kv("index", index) ||
	    jp.read_kv("name", name) ||
	    jp.read_kv("dflt", dflt) ||
	    jp.read_kv("low", low) ||
	    jp.read_kv("up", up) ||
	    jp.read_kv("step", step) ||
	    jp.read_kv("tp", tp) ||
	    jp.read_kv("newrow", newrow) ||
	    jp.read_kv("has_caption", has_caption)) {
	} else if (jp.current_value() == "values") {
	    std::vector<std::string> v;
	    jp.next(gx_system::JsonParser::begin_array);
	    while (jp.peek() != gx_system::JsonParser::end_array) {
		jp.next(gx_system::JsonParser::value_string);
		v.push_back(jp.current_value());
	    }
	    jp.next(gx_system::JsonParser::end_array);
	    set_valuelist(v);
	} else {
	    assert(false);
	}
    }
    jp.next(gx_system::JsonParser::end_object);
}

void paradesc::writeJSON(gx_system::JsonWriter& jw) {
    jw.begin_object();
    jw.write_kv("index", index);
    jw.write_kv("name", name);
    jw.write_kv("dflt", dflt);
    jw.write_kv("low", low);
    jw.write_kv("up", up);
    jw.write_kv("step", step);
    jw.write_kv("tp", tp);
    jw.write_kv("newrow", newrow);
    jw.write_kv("has_caption", has_caption);
    if (values) {
	jw.write_key("values");
	jw.begin_array();
	for (value_pair *p = values; p->value_id; p++) {
	    jw.begin_array();
	    jw.write(p->value_id);
	    jw.write(p->value_label);
	    jw.end_array();
	}
	jw.end_array();
    }
    jw.end_object();
}

void plugdesc::readJSON(gx_system::JsonParser& jp) {
    jp.next(gx_system::JsonParser::begin_object);
    while (jp.peek() != gx_system::JsonParser::end_object) {
	jp.next(gx_system::JsonParser::value_key);
	if (jp.read_kv("path", path) ||
	    jp.read_kv("index", index) ||
	    jp.read_kv("UniqueID", UniqueID) ||
	    jp.read_kv("Label", Label) ||
	    jp.read_kv("shortname", shortname) ||
	    jp.read_kv("category", category) ||
	    jp.read_kv("quirks", quirks) ||
	    jp.read_kv("add_wet_dry", add_wet_dry) ||
	    jp.read_kv("master_idx", master_idx) ||
	    jp.read_kv("master_label", master_label) ||
	    jp.read_kv("id_str", id_str)) {
	} else if (jp.current_value() == "names") {
	    jp.next(gx_system::JsonParser::begin_array);
	    while (jp.peek() != gx_system::JsonParser::end_array) {
		paradesc *p = new paradesc();
		p->readJSON(jp);
		names.push_back(p);
	    }
	    jp.next(gx_system::JsonParser::end_array);
	} else {
	    assert(false);
	}
    }
    jp.next(gx_system::JsonParser::end_object);
}

void plugdesc::writeJSON(gx_system::JsonWriter& jw) {
    jw.begin_object();
    jw.write_kv("path", path);
    jw.write_kv("index", index);
    jw.write_kv("UniqueID", static_cast<unsigned int>(UniqueID));
    jw.write_kv("Label", Label);
    jw.write_kv("shortname", shortname);
    jw.write_kv("category", category);
    jw.write_kv("quirks", quirks);
    jw.write_kv("add_wet_dry", add_wet_dry);
    jw.write_kv("master_idx", master_idx);
    jw.write_kv("master_label", master_label);
    jw.write_kv("id_str", id_str);
    jw.write_key("names");
    jw.begin_array();
    for (std::vector<paradesc*>::iterator i = names.begin(); i != names.end(); ++i) {
	(*i)->writeJSON(jw);
    }
    jw.end_array();
    jw.end_object();
}

plugdesc::~plugdesc() {
    for (std::vector<paradesc*>::const_iterator it = names.begin(); it != names.end(); ++it) {
	delete *it;
    }
}

LadspaDsp::~LadspaDsp() {
    cleanup();
    if (handle && !(pd->quirks & no_cleanup)) {
	dlclose(handle);
    }
    delete[] ports;
}

int LadspaDsp::activate(bool start, PluginDef *plugin) {
    LadspaDsp& self = *static_cast<LadspaDsp*>(plugin);
    if (start == self.is_activated) {
	return 0;
    }
    self.is_activated = start;
    if (start) {
	if (self.desc->activate) {
	    self.desc->activate(self.instance);
	}
    } else {
	if (self.desc->deactivate) {
	    self.desc->deactivate(self.instance);
	}
    }
    return 0;
}

void LadspaDsp::connect(int tp, int i, float *v) {
    for (unsigned int n = 0; n < desc->PortCount; ++n) {
	if (!LADSPA_IS_PORT_AUDIO(desc->PortDescriptors[n])) {
	    continue;
	}
	if (desc->PortDescriptors[n] & tp) {
	    if (i == 0) {
		desc->connect_port(instance, n, v);
		return;
	    }
	    i -= 1;
	}
    }
    gx_print_error("ladspaloader", _("audio port not found"));
}

void LadspaDsp::set_plugdesc(const plugdesc* pd_) {
    pd = pd_;
    id = pd->id_str.c_str();
    category = pd->category.c_str();
    set_shortname();
}

void LadspaDsp::set_shortname() {
    if (!pd->shortname.empty()) {
	shortname = pd->shortname.c_str();
    } else {
	name_str = desc->Name;
	if (name_str.size() > 15) {
	    name_str.erase(15);
	}
	shortname = name_str.c_str();
    }
}

void LadspaDsp::init(unsigned int samplingFreq, PluginDef *plugin) {
    LadspaDsp& self = *static_cast<LadspaDsp*>(plugin);
    self.cleanup();
    if (samplingFreq == 0) {
	return;
    }
    self.instance = self.desc->instantiate(self.desc, samplingFreq);
    int n = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	self.desc->connect_port(self.instance, (*it)->index, &self.ports[(*it)->index]);
    }
}

inline void LadspaDsp::mono_dry_wet(int count, float *input0, float *input1, float *output0)
{
	double 	fSlow0 = (0.01 * dry_wet);
	double 	fSlow1 = (1 - fSlow0);
	for (int i=0; i<count; i++) {
		output0[i] = ((fSlow0 * (double)input1[i]) + (fSlow1 * (double)input0[i]));
	}
}

void LadspaDsp::mono_process(int count, float *input, float *output, PluginDef *plugin) {
    LadspaDsp& self = *static_cast<LadspaDsp*>(plugin);
    assert(self.is_activated);
    if (self.pd->add_wet_dry) {
    float wet_out[count];
    self.connect(LADSPA_PORT_INPUT, 0, input);
    self.connect(LADSPA_PORT_OUTPUT, 0, wet_out);
    self.desc->run(self.instance, count);
    self.mono_dry_wet(count, input, wet_out, output);
    } else {
    self.connect(LADSPA_PORT_INPUT, 0, input);
    self.connect(LADSPA_PORT_OUTPUT, 0, output);
    self.desc->run(self.instance, count);
    }
}

inline void LadspaDsp::stereo_dry_wet(int count, float *input0, float *input1, float *input2, float *input3, float *output0, float *output1)
{
	double 	fSlow0 = (0.01 * dry_wet);
	double 	fSlow1 = (1 - fSlow0);
	for (int i=0; i<count; i++) {
		output0[i] = ((fSlow0 * (double)input2[i]) + (fSlow1 * (double)input0[i]));
		output1[i] = ((fSlow0 * (double)input3[i]) + (fSlow1 * (double)input1[i]));
	}
}

void LadspaDsp::stereo_process(int count, float *input1, float *input2, float *output1, float *output2, PluginDef *plugin) {
    LadspaDsp& self = *static_cast<LadspaDsp*>(plugin);
    assert(self.is_activated);
    if (self.pd->add_wet_dry) {
    float wet_out1[count];
    float wet_out2[count];
    self.connect(LADSPA_PORT_INPUT, 0, input1);
    self.connect(LADSPA_PORT_INPUT, 1, input2);
    self.connect(LADSPA_PORT_OUTPUT, 0, wet_out1);
    self.connect(LADSPA_PORT_OUTPUT, 1, wet_out2);
    self.desc->run(self.instance, count);
    self.stereo_dry_wet(count, input1, input2, wet_out1, wet_out2, output1, output2);
    } else {
    self.connect(LADSPA_PORT_INPUT, 0, input1);
    self.connect(LADSPA_PORT_INPUT, 1, input2);
    self.connect(LADSPA_PORT_OUTPUT, 0, output1);
    self.connect(LADSPA_PORT_OUTPUT, 1, output2);
    self.desc->run(self.instance, count);
    }
}

static Glib::ustring TrimLabel(const char *label, int cnt_in_row) {
    const size_t minlen = 60  / cnt_in_row - 1;
    const size_t maxlen = minlen + 10;
    const size_t cutlen = (maxlen + minlen) / 2;
    Glib::ustring pn(label);
    size_t rem = pn.find_first_of("([");
    if(rem != Glib::ustring::npos) {
	pn.erase(rem);
    }
    while ((rem = pn.find_last_of(" ")) == pn.size()-1) {
	pn.erase(rem);
    }
    rem = 0;
    size_t rem1 = 0;
    size_t lastpos = 0;
    while (true) {
	rem1 = pn.find_first_of(" ", rem1);
	if (rem1 == Glib::ustring::npos) {
	    rem1 = pn.size();
	}
	while (rem1 > rem + minlen) {
	    if (lastpos > rem) {
		rem = lastpos;
		pn.replace(lastpos, 1, 1, '\n');
	    } else if (rem1 < rem + maxlen) {
		if (rem1 == pn.size()) {
		    break;
		}
		rem = rem1;
		pn.replace(rem1, 1, 1, '\n');
	    } else {
		rem += cutlen;
		pn.insert(rem, "\n");
	    }
	    rem += 1;
	}
	lastpos = rem1;
	rem1 += 1;
	if (rem1 >= pn.size()) {
	    break;
	}
    }
    return pn;
}

std::string LadspaDsp::make_id(const paradesc& p) {
    return pd->id_str + "." + to_string(p.index);
}

int LadspaDsp::registerparam(const ParamReg& reg) {
    LadspaDsp& self = *static_cast<LadspaDsp*>(reg.plugin);
    int n = 0;
    int cnt_in_row = 0;
    int left = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	paradesc *d = *it;
	if (d->tp != tp_none) {
	    left -= 1;
	    if (left < 0) {
		cnt_in_row = 1;
		std::vector<paradesc*>::const_iterator it2 = it+1;
		while (it2 != self.pd->names.end() && !(*it2)->newrow) {
		    if ((*it2)->tp != tp_none) {
			++cnt_in_row;
		    }
		    ++it2;
		}
		left = cnt_in_row;
	    }
	}
	const char *nm = self.desc->PortNames[d->index];
	Glib::ustring snm(d->name);
	if (snm.empty() && d->tp != tp_none) {
	    snm = TrimLabel(nm, cnt_in_row);
	}
	if (d->tp == tp_enum) {
	    reg.registerEnumVar(self.make_id(*d).c_str(), snm.c_str(), "S", nm, d->values, &self.ports[d->index],
				d->dflt, d->low, d->up, d->step);
	} else {
	    const char *tp = 0;
	    switch (d->tp) {
	    case tp_none:           tp = "S";  break;
	    case tp_int:            tp = "S";  break;
	    case tp_scale:          tp = "S";  break;
	    case tp_scale_log:      tp = "SL"; break;
	    case tp_toggle:         tp = "B";  break;
	    case tp_display:        tp = "SO"; break;
	    case tp_display_toggle: tp = "BO"; break;
	    default: assert(false);
	    }
	    reg.registerVar(self.make_id(*d).c_str(), snm.c_str(), tp, nm, &self.ports[d->index],
			    d->dflt, d->low, d->up, d->step);
	}
    }
    self.idd = self.pd->id_str + ".dry_wet";
    reg.registerVar(self.idd.c_str(),"","S","dry/wet",&self.dry_wet, 100, 0, 100, 1);
    return 0;
}

int LadspaDsp::uiloader(const UiBuilder& b, int form) {
    if (!(form & UI_FORM_STACK)) {
	return -1;
    }
    LadspaDsp& self = *static_cast<LadspaDsp*>(b.plugin);
    b.openHorizontalhideBox("");
    if (self.pd->master_idx >= 0) {
	int n = 0;
	for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	    if ((n)==self.pd->master_idx) {
		switch ((*it)->tp) {
		case tp_enum:
		    b.create_selector_no_caption(self.make_id(*self.pd->names[self.pd->master_idx]).c_str());
		    break;
		default:
		    const char *p = self.pd->master_label.c_str();
		    if (!*p) {
			p = "";
		    }
		    b.create_master_slider(self.make_id(*self.pd->names[self.pd->master_idx]).c_str(), p);
		    break;
		}
	    }
	}
    }
    b.closeBox();
    b.openVerticalBox("");
    b.openHorizontalBox("");
    int n = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	if ((*it)->newrow) {
	    b.closeBox();
	    b.openHorizontalBox("");
	}
	const char *p = self.desc->PortNames[(*it)->index];
	std::string id = self.make_id(**it);
	switch ((*it)->tp) {
	case tp_scale:
	case tp_scale_log:
	    if (!(*it)->has_caption) {
		p = "";
	    }
	    b.create_small_rackknob(id.c_str(), p);
	    break;
	case tp_toggle:
	    if ((*it)->has_caption) {
		b.create_switch("switch",id.c_str(), p);
	    } else {
		b.create_switch_no_caption("switchit",id.c_str());
	    }
	    break;
	case tp_display:
	    if (!(*it)->has_caption) {
		p = "";
	    }
	    b.create_port_display(id.c_str(), p);
	    break;
	case tp_display_toggle:
	    if ((*it)->has_caption) {
		b.create_switch("led",id.c_str(), p);
	    } else {
		b.create_switch_no_caption("led",id.c_str());
	    }
	    break;
	case tp_int:
	    b.create_spin_value(id.c_str(), p);
	    break;
	case tp_enum:
	    if ((*it)->has_caption) {
		b.create_selector(id.c_str(), p);
	    } else {
		b.create_selector_no_caption(id.c_str());
	    }
	    break;
	case tp_none:
	    break;
	default:
	    assert(false);
	}
    }
    if (self.pd->add_wet_dry) {
	b.create_small_rackknob(self.idd.c_str(), "dry/wet");
    }
    b.closeBox();
    b.closeBox();
    return 0;
}

void LadspaDsp::del_instance(PluginDef *plugin) {
    delete static_cast<LadspaDsp*>(plugin);
}


/****************************************************************
 ** class Lv2Dsp
 */

class Lv2Dsp: public PluginDef {
private:
    static void init(unsigned int samplingFreq, PluginDef *plugin);
    static void mono_process(int count, float *input, float *output, PluginDef *plugin);
    static void stereo_process(int count, float *input1, float *input2, float *output1, float *output2, PluginDef *plugin);
    static int activate(bool start, PluginDef *plugin);
    static int registerparam(const ParamReg& reg);
    static int uiloader(const UiBuilder& builder, int form);
    static void del_instance(PluginDef *plugin);
    //
    const LadspaLoader& loader;
    const LilvPlugin* plugin;
    LilvNode* name_node;
    LilvInstance* instance;
    LADSPA_Data *ports;
    Glib::ustring name_str;
    const plugdesc *pd;
    bool is_activated;
    void connect(const LilvNode* tp, int i, float *v);
    inline void cleanup();
    void set_shortname();
    float dry_wet;
    std::string idd;
    inline void mono_dry_wet(int count, float *input0, float *input1, float *output0);
    inline void stereo_dry_wet(int count, float *input0, float *input1, float *input2, float *input3, float *output0, float *output1);
    std::string make_id(const paradesc& p);
    Lv2Dsp(const plugdesc *plug, const LilvPlugin* plugin_, const LadspaLoader& loader_, bool mono);
    ~Lv2Dsp();
public:
    static Lv2Dsp *create(const plugdesc *plug, const LadspaLoader& loader);
    void set_plugdesc(const plugdesc* pd_);
};

Lv2Dsp *Lv2Dsp::create(const plugdesc *plug, const LadspaLoader& loader) {
    LilvNode* plugin_uri = lilv_new_uri(loader.world, plug->path.c_str());
    const LilvPlugin* plugin = lilv_plugins_get_by_uri(loader.lv2_plugins, plugin_uri);
    lilv_node_free(plugin_uri);
    if (!plugin) {
	gx_print_error("lv2loader",ustring::compose(_("Cannot open LV2 plugin: %1"), plug->path));
	return NULL;
    }

    int num_inputs = lilv_plugin_get_num_ports_of_class(plugin, loader.lv2_AudioPort, loader.lv2_InputPort, 0);
    int num_outputs = lilv_plugin_get_num_ports_of_class(plugin, loader.lv2_AudioPort, loader.lv2_OutputPort, 0);
    bool mono;
    if (num_inputs == 1 && num_outputs == 1) {
	mono = true;
    } else if (num_inputs == 2 && num_outputs == 2) {
	mono = false;
    } else {
	LilvNode *nm = lilv_plugin_get_name(plugin);
	gx_print_error(
	    "lv2loader",ustring::compose(
		_("cannot use LV2 plugin %1 with %2 inputs and %3 outputs"),
		lilv_node_as_string(nm), num_inputs, num_outputs));
	lilv_node_free(nm);
	return NULL;
    }
    return new Lv2Dsp(plug, plugin, loader, mono);
}

Lv2Dsp::Lv2Dsp(const plugdesc *plug, const LilvPlugin* plugin_, const LadspaLoader& loader_, bool mono)
    : PluginDef(), loader(loader_), plugin(plugin_), name_node(lilv_plugin_get_name(plugin_)), instance(),
      ports(new LADSPA_Data[lilv_plugin_get_num_ports(plugin_)]), name_str(), pd(plug), is_activated(false) {
    version = PLUGINDEF_VERSION;
    id = pd->id_str.c_str();
    category = pd->category.c_str();
    description = lilv_node_as_string(name_node);
    name = lilv_node_as_string(name_node);
    set_shortname();
    set_samplerate = init;
    if (mono) {
	mono_audio = mono_process;
    } else {
	stereo_audio = stereo_process;
    }
    activate_plugin = activate;
    register_params = registerparam;
    load_ui = uiloader;
    delete_instance = del_instance;
}

inline void Lv2Dsp::cleanup() {
    if (instance) {
	if (pd->quirks & need_activate) {
	    activate(true, this);
	}
	activate(false, this);
	if (!(pd->quirks & no_cleanup)) {
	    lilv_instance_free(instance);
	}
	instance = 0;
    }
}

Lv2Dsp::~Lv2Dsp() {
    cleanup();
    delete[] ports;
    lilv_node_free(name_node);
}

int Lv2Dsp::activate(bool start, PluginDef *plugin) {
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(plugin);
    if (start == self.is_activated) {
	return 0;
    }
    self.is_activated = start;
    if (start) {
	lilv_instance_activate(self.instance);
    } else {
	lilv_instance_deactivate(self.instance);
    }
    return 0;
}

void Lv2Dsp::connect(const LilvNode* tp, int i, float *v) {
    unsigned int num_ports = lilv_plugin_get_num_ports(plugin);
    for (unsigned int n = 0; n < num_ports; ++n) {
	const LilvPort* port = lilv_plugin_get_port_by_index(plugin, n);
	if (!lilv_port_is_a(plugin, port, loader.lv2_AudioPort)) {
	    continue;
	}
	if (lilv_port_is_a(plugin, port, tp)) {
	    if (i == 0) {
		lilv_instance_connect_port(instance, n, v);
		return;
	    }
	    i -= 1;
	}
    }
    gx_print_error("lv2loader", _("audio port not found"));
}

void Lv2Dsp::set_plugdesc(const plugdesc* pd_) {
    pd = pd_;
    id = pd->id_str.c_str();
    category = pd->category.c_str();
    set_shortname();
}

void Lv2Dsp::set_shortname() {
    if (!pd->shortname.empty()) {
	shortname = pd->shortname.c_str();
    } else {
	name_str = lilv_node_as_string(name_node);
	if (name_str.size() > 15) {
	    name_str.erase(15);
	}
	shortname = name_str.c_str();
    }
}

void Lv2Dsp::init(unsigned int samplingFreq, PluginDef *pldef) {
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(pldef);
    self.cleanup();
    if (samplingFreq == 0) {
	return;
    }
    self.instance = lilv_plugin_instantiate(self.plugin, samplingFreq, 0);
    int n = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	lilv_instance_connect_port(self.instance, (*it)->index, &self.ports[(*it)->index]);
    }
}

inline void Lv2Dsp::mono_dry_wet(int count, float *input0, float *input1, float *output0)
{
	double 	fSlow0 = (0.01 * dry_wet);
	double 	fSlow1 = (1 - fSlow0);
	for (int i=0; i<count; i++) {
		output0[i] = ((fSlow0 * (double)input1[i]) + (fSlow1 * (double)input0[i]));
	}
}

void Lv2Dsp::mono_process(int count, float *input, float *output, PluginDef *plugin) {
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(plugin);
    assert(self.is_activated);
    if (self.pd->add_wet_dry) {
	float wet_out[count];
	self.connect(self.loader.lv2_InputPort, 0, input);
	self.connect(self.loader.lv2_OutputPort, 0, wet_out);
	lilv_instance_run(self.instance, count);
	self.mono_dry_wet(count, input, wet_out, output);
    } else {
	self.connect(self.loader.lv2_InputPort, 0, input);
	self.connect(self.loader.lv2_OutputPort, 0, output);
	lilv_instance_run(self.instance, count);
    }
}

inline void Lv2Dsp::stereo_dry_wet(int count, float *input0, float *input1, float *input2, float *input3, float *output0, float *output1)
{
	double 	fSlow0 = (0.01 * dry_wet);
	double 	fSlow1 = (1 - fSlow0);
	for (int i=0; i<count; i++) {
		output0[i] = ((fSlow0 * (double)input2[i]) + (fSlow1 * (double)input0[i]));
		output1[i] = ((fSlow0 * (double)input3[i]) + (fSlow1 * (double)input1[i]));
	}
}

void Lv2Dsp::stereo_process(int count, float *input1, float *input2, float *output1, float *output2, PluginDef *plugin) {
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(plugin);
    assert(self.is_activated);
    if (self.pd->add_wet_dry) {
	float wet_out1[count];
	float wet_out2[count];
	self.connect(self.loader.lv2_InputPort, 0, input1);
	self.connect(self.loader.lv2_InputPort, 1, input2);
	self.connect(self.loader.lv2_OutputPort, 0, wet_out1);
	self.connect(self.loader.lv2_OutputPort, 1, wet_out2);
	lilv_instance_run(self.instance, count);
	self.stereo_dry_wet(count, input1, input2, wet_out1, wet_out2, output1, output2);
    } else {
	self.connect(self.loader.lv2_InputPort, 0, input1);
	self.connect(self.loader.lv2_InputPort, 1, input2);
	self.connect(self.loader.lv2_OutputPort, 0, output1);
	self.connect(self.loader.lv2_OutputPort, 1, output2);
	lilv_instance_run(self.instance, count);
    }
}

std::string Lv2Dsp::make_id(const paradesc& p) {
    return pd->id_str + "." + to_string(p.index);
}

int Lv2Dsp::registerparam(const ParamReg& reg) {
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(reg.plugin);
    int n = 0;
    int cnt_in_row = 0;
    int left = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	paradesc *d = *it;
	if (d->tp != tp_none) {
	    left -= 1;
	    if (left < 0) {
		cnt_in_row = 1;
		std::vector<paradesc*>::const_iterator it2 = it+1;
		while (it2 != self.pd->names.end() && !(*it2)->newrow) {
		    if ((*it2)->tp != tp_none) {
			++cnt_in_row;
		    }
		    ++it2;
		}
		left = cnt_in_row;
	    }
	}
	const LilvPort* port = lilv_plugin_get_port_by_index(self.plugin, d->index);
	LilvNode* nm_node = lilv_port_get_name(self.plugin, port);
	const char *nm = lilv_node_as_string(nm_node);
	Glib::ustring snm(d->name);
	if (snm.empty() && d->tp != tp_none) {
	    snm = TrimLabel(nm, cnt_in_row);
	}
	if (d->tp == tp_enum) {
	    reg.registerEnumVar(self.make_id(*d).c_str(), snm.c_str(), "S", nm, d->values, &self.ports[d->index],
				d->dflt, d->low, d->up, d->step);
	} else {
	    const char *tp = 0;
	    switch (d->tp) {
	    case tp_none:           tp = "S";  break;
	    case tp_int:            tp = "S";  break;
	    case tp_scale:          tp = "S";  break;
	    case tp_scale_log:      tp = "SL"; break;
	    case tp_toggle:         tp = "B";  break;
	    case tp_display:        tp = "SO"; break;
	    case tp_display_toggle: tp = "BO"; break;
	    default: assert(false);
	    }
	    reg.registerVar(self.make_id(*d).c_str(), snm.c_str(), tp, nm, &self.ports[d->index],
			    d->dflt, d->low, d->up, d->step);
	}
	lilv_node_free(nm_node);
    }
    self.idd = self.pd->id_str + ".dry_wet";
    reg.registerVar(self.idd.c_str(),"","S","dry/wet",&self.dry_wet, 100, 0, 100, 1);
    return 0;
}

int Lv2Dsp::uiloader(const UiBuilder& b, int form) {
    if (!(form & UI_FORM_STACK)) {
	return -1;
    }
    Lv2Dsp& self = *static_cast<Lv2Dsp*>(b.plugin);
    b.openHorizontalhideBox("");
    if (self.pd->master_idx >= 0) {
	int n = 0;
	for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	    if ((n)==self.pd->master_idx) {
		switch ((*it)->tp) {
		case tp_enum:
		    b.create_selector_no_caption(self.make_id(*self.pd->names[self.pd->master_idx]).c_str());
		    break;
		default:
		    const char *p = self.pd->master_label.c_str();
		    if (!*p) {
			p = "";
		    }
		    b.create_master_slider(self.make_id(*self.pd->names[self.pd->master_idx]).c_str(), p);
		    break;
		}
	    }
	}
    }
    b.closeBox();
    b.openVerticalBox("");
    b.openHorizontalBox("");
    int n = 0;
    for (std::vector<paradesc*>::const_iterator it = self.pd->names.begin(); it != self.pd->names.end(); ++it, ++n) {
	if ((*it)->newrow) {
	    b.closeBox();
	    b.openHorizontalBox("");
	}
	const LilvPort* port = lilv_plugin_get_port_by_index(self.plugin, (*it)->index);
	LilvNode* nm_node = lilv_port_get_name(self.plugin, port);
	const char *p = lilv_node_as_string(nm_node);
	std::string id = self.make_id(**it);
	switch ((*it)->tp) {
	case tp_scale:
	case tp_scale_log:
	    if (!(*it)->has_caption) {
		p = "";
	    }
	    b.create_small_rackknob(id.c_str(), p);
	    break;
	case tp_toggle:
	    if ((*it)->has_caption) {
		b.create_switch("switch",id.c_str(), p);
	    } else {
		b.create_switch_no_caption("switchit",id.c_str());
	    }
	    break;
	case tp_display:
	    if (!(*it)->has_caption) {
		p = "";
	    }
	    b.create_port_display(id.c_str(), p);
	    break;
	case tp_display_toggle:
	    if ((*it)->has_caption) {
		b.create_switch("led",id.c_str(), p);
	    } else {
		b.create_switch_no_caption("led",id.c_str());
	    }
	    break;
	case tp_int:
	    b.create_spin_value(id.c_str(), p);
	    break;
	case tp_enum:
	    if ((*it)->has_caption) {
		b.create_selector(id.c_str(), p);
	    } else {
		b.create_selector_no_caption(id.c_str());
	    }
	    break;
	case tp_none:
	    break;
	default:
	    assert(false);
	}
	lilv_node_free(nm_node);
    }
    if (self.pd->add_wet_dry) {
	b.create_small_rackknob(self.idd.c_str(), "dry/wet");
    }
    b.closeBox();
    b.closeBox();
    return 0;
}

void Lv2Dsp::del_instance(PluginDef *plugin) {
    delete static_cast<Lv2Dsp*>(plugin);
}


/****************************************************************
 ** class LadspaLoader
 */

PluginDef *LadspaLoader::create(const plugdesc *p) {
    if (p->quirks & is_lv2) {
	return Lv2Dsp::create(p, *this);
    } else {
	return LadspaDsp::create(p);
    }
}

LadspaLoader::LadspaLoader(const gx_system::CmdlineOptions& options_)
    : options(options_),
      plugins(),
      world(lilv_world_new()),
      lv2_plugins(),
      lv2_AudioPort(lilv_new_uri(world, LV2_CORE__AudioPort)),
      lv2_ControlPort(lilv_new_uri(world, LV2_CORE__ControlPort)),
      lv2_InputPort(lilv_new_uri(world, LV2_CORE__InputPort)),
      lv2_OutputPort(lilv_new_uri(world, LV2_CORE__OutputPort)) {
    lilv_world_load_all(world);
    lv2_plugins = lilv_world_get_all_plugins(world);
    load(plugins);
}

LadspaLoader::~LadspaLoader() {
    for (pluginarray::iterator i = plugins.begin(); i != plugins.end(); ++i) {
	delete *i;
    }
    lilv_node_free(lv2_OutputPort);
    lilv_node_free(lv2_InputPort);
    lilv_node_free(lv2_ControlPort);
    lilv_node_free(lv2_AudioPort);
    lilv_world_free(world);
}

bool LadspaLoader::load(pluginarray& ml) {
    try {
	read_module_list(ml);
    } catch (JsonException &e) {
	gx_print_error("ladspaloader",ustring::compose(_("Exception in LADSPA list reader: %1"), e.what()));
	return false;
    }
    return true;
}

void LadspaLoader::change_plugins(pluginarray& new_plugins) {
    for (pluginarray::iterator i = plugins.begin(); i != plugins.end(); ++i) {
	delete *i;
    }
    plugins = new_plugins;
}

void LadspaLoader::set_plugins(pluginarray& new_plugins) {
    //for (pluginarray::iterator i = plugins.begin(); i != plugins.end(); ++i) {
	//delete *i;
    //}
    plugins = new_plugins;
}

LadspaLoader::pluginarray::iterator LadspaLoader::find(plugdesc *desc) {
    for (pluginarray::iterator i = begin(); i != end(); ++i) {
	if (desc->quirks & is_lv2) {
	    if ((*i)->path == desc->path) {
		return i;
	    }
	} else {
	    if ((*i)->UniqueID == desc->UniqueID) {
		return i;
	    }
	}
    }
    return end();
}

void LadspaLoader::update_instance(PluginDef *pdef, plugdesc *pdesc) {
    if (pdesc->quirks & is_lv2) {
	static_cast<Lv2Dsp*>(pdef)->set_plugdesc(pdesc);
    } else {
	static_cast<LadspaDsp*>(pdef)->set_plugdesc(pdesc);
    }
}

paradesc::~paradesc() {
    for (value_pair *p = values; p->value_id; ++p) {
	g_free(const_cast<char*>(p->value_id));
    }
    delete[] values;
}

void paradesc::set_valuelist(const std::vector<std::string>& v) {
    values = new value_pair[v.size()+1];
    int n = 0;
    for (std::vector<std::string>::const_iterator i = v.begin(); i != v.end(); ++i, ++n) {
	const char *p = g_strdup(i->c_str());
	values[n].value_id = p;
	values[n].value_label = p;
    }
    values[n].value_id = 0;
    values[n].value_label = 0;
}

void LadspaLoader::read_module_config(const std::string& filename, plugdesc *p) {
    std::ifstream ifs(filename.c_str());
    if (ifs.fail()) {
	gx_print_error("ladspaloader", ustring::compose(_("can't open %1"), filename));
        return;
    }
    gx_system::JsonParser jp(&ifs);
    jp.next(gx_system::JsonParser::begin_array);
    jp.next(gx_system::JsonParser::value_number);
    jp.current_value_int(); // int version
    jp.next(gx_system::JsonParser::value_string);
    p->shortname = jp.current_value();
    jp.next(gx_system::JsonParser::value_string);
    p->category = jp.current_value();
    jp.next(gx_system::JsonParser::value_number);
    p->master_idx = jp.current_value_int();
    jp.next(gx_system::JsonParser::value_string);
    p->master_label = jp.current_value();
    jp.next(gx_system::JsonParser::value_number);
    p->quirks = jp.current_value_int();
    jp.next(gx_system::JsonParser::value_number);
    p->add_wet_dry= jp.current_value_int();
    jp.next(gx_system::JsonParser::begin_array);
    while (jp.peek() != gx_system::JsonParser::end_array) {
	paradesc *para = new paradesc;
	jp.next(gx_system::JsonParser::begin_array);
	jp.next(gx_system::JsonParser::value_number);
	para->index = jp.current_value_int();
	jp.skip_object(); // meta data
	jp.next(gx_system::JsonParser::value_string);
	para->name = jp.current_value();
	jp.next(gx_system::JsonParser::value_number); // use_sr
	jp.next(gx_system::JsonParser::value_number);
	para->dflt = jp.current_value_float();
	jp.next(gx_system::JsonParser::value_number);
	para->low = jp.current_value_float();
	jp.next(gx_system::JsonParser::value_number);
	para->up = jp.current_value_float();
	jp.next(gx_system::JsonParser::value_number);
	para->step = jp.current_value_float();
	jp.next(gx_system::JsonParser::value_number);
	para->tp = static_cast<widget_type>(jp.current_value_int()); //FIXME (check valid)
	jp.next(gx_system::JsonParser::value_number);
	para->newrow = jp.current_value_int();
	jp.next(gx_system::JsonParser::value_number);
	para->has_caption = jp.current_value_int();
	jp.next(gx_system::JsonParser::begin_array);
	std::vector<std::string> v;
	while (jp.peek() != gx_system::JsonParser::end_array) {
	    jp.next(gx_system::JsonParser::value_string);
	    v.push_back(jp.current_value());
	}
	jp.next(gx_system::JsonParser::end_array);
	para->set_valuelist(v);
	jp.next(gx_system::JsonParser::end_array);
	p->names.push_back(para);
    }
    jp.next(gx_system::JsonParser::end_array);
    jp.close();
    ifs.close();
}

void LadspaLoader::read_module_list(pluginarray& ml) {
    std::ifstream ifs(options.get_user_filepath("ladspa_defs.js").c_str());
    if (ifs.fail()) {
        return;
    }
    gx_system::JsonParser jp(&ifs);
    jp.next(gx_system::JsonParser::begin_array);
    while (jp.peek() != gx_system::JsonParser::end_array) {
	jp.next(gx_system::JsonParser::begin_array);
	jp.next(gx_system::JsonParser::value_string);
	plugdesc *p = new plugdesc;
	p->path = jp.current_value();
	jp.next(gx_system::JsonParser::value_number);
	int idx = jp.current_value_int();
	if (idx < 0) {
	    p->quirks |= is_lv2;
	}
	p->index = idx;
	jp.next(gx_system::JsonParser::value_number);
	p->UniqueID = jp.current_value_int();
	jp.next(gx_system::JsonParser::value_string);
	p->Label = jp.current_value();
	jp.next(gx_system::JsonParser::end_array);
	std::string s;
	if (idx < 0) {
	    s = gx_system::encode_filename(p->path) + ".js";
	} else {
	    s = get_ladspa_filename(p->UniqueID);
	}
	std::string fname = options.get_plugin_filepath(s);
	if (access(fname.c_str(), F_OK) != 0) {
	    fname = options.get_factory_filepath(s);
	    if (access(fname.c_str(), F_OK) != 0) {
		fname = "";
	    }
	}
	if (!fname.empty()) {
	    try {
		read_module_config(fname, p);
	    } catch (JsonException &e) {
		gx_print_error("ladspaloader",ustring::compose(_("read error in file %1: %2"), s, e.what()));
	    }
	}
	if (p->quirks & is_lv2) {
	    p->id_str = "lv2_" + gx_system::encode_filename(p->path);
	} else {
	    p->id_str = "ladspa_" + to_string(p->UniqueID);
	}
	ml.push_back(p);
    }
    jp.close();
    ifs.close();
}

} // namespace gx_engine
