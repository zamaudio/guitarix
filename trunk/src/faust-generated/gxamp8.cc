// generated from file '../src/faust/gxamp8.dsp' by dsp2cc:
// Code generated with Faust 0.9.65 (http://faust.grame.fr)

#include "valve.h"

namespace gxamp8 {

class Dsp: public PluginDef {
private:
	int fSamplingFreq;
	int 	iConst0;
	double 	fConst1;
	double 	fConst2;
	double 	fConst3;
	double 	fConst4;
	double 	fRec10[2];
	FAUSTFLOAT 	fslider0;
	FAUSTFLOAT	*fslider0_;
	double 	fRec11[2];
	FAUSTFLOAT 	fslider1;
	FAUSTFLOAT	*fslider1_;
	double 	fRec16[2];
	double 	fConst5;
	double 	fConst6;
	double 	fConst7;
	double 	fConst8;
	double 	fConst9;
	double 	fConst10;
	double 	fConst11;
	double 	fConst12;
	double 	fConst13;
	double 	fConst14;
	double 	fVec0[2];
	double 	fConst15;
	double 	fRec29[2];
	double 	fRec28[2];
	double 	fRec27[3];
	double 	fRec26[3];
	FAUSTFLOAT 	fslider2;
	FAUSTFLOAT	*fslider2_;
	double 	fRec30[2];
	double 	fConst16;
	double 	fConst17;
	double 	fConst18;
	double 	fConst19;
	double 	fConst20;
	double 	fRec31[2];
	double 	fRec25[3];
	double 	fConst21;
	double 	fConst22;
	double 	fConst23;
	double 	fConst24;
	double 	fConst25;
	double 	fRec24[2];
	double 	fConst26;
	double 	fConst27;
	double 	fConst28;
	double 	fConst29;
	double 	fRec34[2];
	double 	fRec33[3];
	double 	fRec32[2];
	double 	fRec23[2];
	double 	fConst30;
	double 	fRec22[2];
	double 	fRec35[2];
	double 	fRec21[3];
	double 	fRec20[2];
	double 	fConst31;
	double 	fConst32;
	double 	fConst33;
	double 	fConst34;
	double 	fRec38[2];
	double 	fRec37[3];
	double 	fRec36[2];
	double 	fRec19[2];
	double 	fRec39[2];
	double 	fRec18[3];
	double 	fRec17[2];
	double 	fRec15[2];
	int 	IOTA;
	double 	fVec1[32768];
	int 	iConst35;
	double 	fRec14[2];
	double 	fConst36;
	double 	fRec13[2];
	FAUSTFLOAT 	fslider3;
	FAUSTFLOAT	*fslider3_;
	double 	fConst37;
	double 	fConst38;
	double 	fConst39;
	double 	fConst40;
	double 	fConst41;
	double 	fConst42;
	double 	fConst43;
	double 	fConst44;
	double 	fConst45;
	double 	fConst46;
	double 	fConst47;
	double 	fConst48;
	double 	fConst49;
	double 	fConst50;
	double 	fConst51;
	double 	fConst52;
	double 	fConst53;
	double 	fConst54;
	double 	fConst55;
	double 	fConst56;
	double 	fConst57;
	double 	fConst58;
	double 	fConst59;
	double 	fConst60;
	double 	fConst61;
	double 	fConst62;
	double 	fRec48[3];
	double 	fVec2[2];
	double 	fConst63;
	double 	fRec47[2];
	double 	fConst64;
	double 	fConst65;
	double 	fConst66;
	double 	fRec46[2];
	double 	fRec45[3];
	double 	fVec3[2];
	double 	fConst67;
	double 	fConst68;
	double 	fConst69;
	double 	fRec44[2];
	double 	fRec43[3];
	double 	fVec4[2];
	double 	fConst70;
	double 	fConst71;
	double 	fConst72;
	double 	fRec42[2];
	double 	fRec41[3];
	double 	fConst73;
	double 	fConst74;
	double 	fConst75;
	double 	fRec51[2];
	double 	fRec50[3];
	double 	fConst76;
	double 	fRec49[3];
	double 	fConst77;
	double 	fConst78;
	double 	fConst79;
	double 	fRec55[2];
	double 	fRec54[3];
	double 	fConst80;
	double 	fRec53[3];
	double 	fRec52[3];
	double 	fConst81;
	double 	fRec57[2];
	double 	fRec56[3];
	double 	fConst82;
	double 	fVec5[2];
	double 	fRec40[2];
	double 	fVec6[2];
	double 	fRec12[2];
	double 	fRec9[3];
	double 	fConst83;
	double 	fRec8[2];
	double 	fRec60[2];
	double 	fRec59[3];
	double 	fRec58[2];
	double 	fRec6[2];
	double 	fRec4[2];
	double 	fRec2[2];
	double 	fRec0[2];
	void clear_state_f();
	void init(unsigned int samplingFreq);
	void compute(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0);
	int register_par(const ParamReg& reg);

	static void clear_state_f_static(PluginDef*);
	static void init_static(unsigned int samplingFreq, PluginDef*);
	static void compute_static(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0, PluginDef*);
	static int register_params_static(const ParamReg& reg);
	static void del_instance(PluginDef *p);
public:
	Dsp();
	~Dsp();
};



Dsp::Dsp()
	: PluginDef() {
	version = PLUGINDEF_VERSION;
	flags = 0;
	id = "pre 12AU7/ push-pull 6V6";
	name = N_("pre 12AU7/ push-pull 6V6");
	groups = 0;
	description = ""; // description (tooltip)
	category = "";       // category
	shortname = "";     // shortname
	mono_audio = compute_static;
	stereo_audio = 0;
	set_samplerate = init_static;
	activate_plugin = 0;
	register_params = register_params_static;
	load_ui = 0;
	clear_state = clear_state_f_static;
	delete_instance = del_instance;
}

Dsp::~Dsp() {
}

inline void Dsp::clear_state_f()
{
	for (int i=0; i<2; i++) fRec10[i] = 0;
	for (int i=0; i<2; i++) fRec11[i] = 0;
	for (int i=0; i<2; i++) fRec16[i] = 0;
	for (int i=0; i<2; i++) fVec0[i] = 0;
	for (int i=0; i<2; i++) fRec29[i] = 0;
	for (int i=0; i<2; i++) fRec28[i] = 0;
	for (int i=0; i<3; i++) fRec27[i] = 0;
	for (int i=0; i<3; i++) fRec26[i] = 0;
	for (int i=0; i<2; i++) fRec30[i] = 0;
	for (int i=0; i<2; i++) fRec31[i] = 0;
	for (int i=0; i<3; i++) fRec25[i] = 0;
	for (int i=0; i<2; i++) fRec24[i] = 0;
	for (int i=0; i<2; i++) fRec34[i] = 0;
	for (int i=0; i<3; i++) fRec33[i] = 0;
	for (int i=0; i<2; i++) fRec32[i] = 0;
	for (int i=0; i<2; i++) fRec23[i] = 0;
	for (int i=0; i<2; i++) fRec22[i] = 0;
	for (int i=0; i<2; i++) fRec35[i] = 0;
	for (int i=0; i<3; i++) fRec21[i] = 0;
	for (int i=0; i<2; i++) fRec20[i] = 0;
	for (int i=0; i<2; i++) fRec38[i] = 0;
	for (int i=0; i<3; i++) fRec37[i] = 0;
	for (int i=0; i<2; i++) fRec36[i] = 0;
	for (int i=0; i<2; i++) fRec19[i] = 0;
	for (int i=0; i<2; i++) fRec39[i] = 0;
	for (int i=0; i<3; i++) fRec18[i] = 0;
	for (int i=0; i<2; i++) fRec17[i] = 0;
	for (int i=0; i<2; i++) fRec15[i] = 0;
	for (int i=0; i<32768; i++) fVec1[i] = 0;
	for (int i=0; i<2; i++) fRec14[i] = 0;
	for (int i=0; i<2; i++) fRec13[i] = 0;
	for (int i=0; i<3; i++) fRec48[i] = 0;
	for (int i=0; i<2; i++) fVec2[i] = 0;
	for (int i=0; i<2; i++) fRec47[i] = 0;
	for (int i=0; i<2; i++) fRec46[i] = 0;
	for (int i=0; i<3; i++) fRec45[i] = 0;
	for (int i=0; i<2; i++) fVec3[i] = 0;
	for (int i=0; i<2; i++) fRec44[i] = 0;
	for (int i=0; i<3; i++) fRec43[i] = 0;
	for (int i=0; i<2; i++) fVec4[i] = 0;
	for (int i=0; i<2; i++) fRec42[i] = 0;
	for (int i=0; i<3; i++) fRec41[i] = 0;
	for (int i=0; i<2; i++) fRec51[i] = 0;
	for (int i=0; i<3; i++) fRec50[i] = 0;
	for (int i=0; i<3; i++) fRec49[i] = 0;
	for (int i=0; i<2; i++) fRec55[i] = 0;
	for (int i=0; i<3; i++) fRec54[i] = 0;
	for (int i=0; i<3; i++) fRec53[i] = 0;
	for (int i=0; i<3; i++) fRec52[i] = 0;
	for (int i=0; i<2; i++) fRec57[i] = 0;
	for (int i=0; i<3; i++) fRec56[i] = 0;
	for (int i=0; i<2; i++) fVec5[i] = 0;
	for (int i=0; i<2; i++) fRec40[i] = 0;
	for (int i=0; i<2; i++) fVec6[i] = 0;
	for (int i=0; i<2; i++) fRec12[i] = 0;
	for (int i=0; i<3; i++) fRec9[i] = 0;
	for (int i=0; i<2; i++) fRec8[i] = 0;
	for (int i=0; i<2; i++) fRec60[i] = 0;
	for (int i=0; i<3; i++) fRec59[i] = 0;
	for (int i=0; i<2; i++) fRec58[i] = 0;
	for (int i=0; i<2; i++) fRec6[i] = 0;
	for (int i=0; i<2; i++) fRec4[i] = 0;
	for (int i=0; i<2; i++) fRec2[i] = 0;
	for (int i=0; i<2; i++) fRec0[i] = 0;
}

void Dsp::clear_state_f_static(PluginDef *p)
{
	static_cast<Dsp*>(p)->clear_state_f();
}

inline void Dsp::init(unsigned int samplingFreq)
{
	fSamplingFreq = samplingFreq;
	iConst0 = min(192000, max(1, fSamplingFreq));
	fConst1 = (1.0 / tan((20517.741620594938 / double(iConst0))));
	fConst2 = (1 + fConst1);
	fConst3 = (0.0041 / fConst2);
	fConst4 = (0 - ((1 - fConst1) / fConst2));
	fConst5 = tan((37699.11184307752 / double(iConst0)));
	fConst6 = (2 * (1 - (1.0 / faustpower<2>(fConst5))));
	fConst7 = (1.0 / fConst5);
	fConst8 = (1 + ((fConst7 - 0.7653668647301795) / fConst5));
	fConst9 = (1 + ((0.7653668647301795 + fConst7) / fConst5));
	fConst10 = (1.0 / fConst9);
	fConst11 = (1 + ((fConst7 - 1.8477590650225735) / fConst5));
	fConst12 = (1.0 / (1 + ((fConst7 + 1.8477590650225735) / fConst5)));
	fConst13 = (973.8937226128359 / double(iConst0));
	fConst14 = (1 - fConst13);
	fConst15 = (1.0 / (1 + fConst13));
	fConst16 = (2.0 / fConst9);
	fConst17 = (1.0 / tan((270.1769682087222 / double(iConst0))));
	fConst18 = (1 + fConst17);
	fConst19 = (0.027 / fConst18);
	fConst20 = (0 - ((1 - fConst17) / fConst18));
	fConst21 = (1.0 / tan((97.38937226128358 / double(iConst0))));
	fConst22 = (0 - fConst21);
	fConst23 = (1 + fConst21);
	fConst24 = (0.1 / fConst23);
	fConst25 = (0 - ((1 - fConst21) / fConst23));
	fConst26 = (1.0 / tan((414.6902302738527 / double(iConst0))));
	fConst27 = (1 + fConst26);
	fConst28 = (0.015 / fConst27);
	fConst29 = (0 - ((1 - fConst26) / fConst27));
	fConst30 = (1.0 / fConst2);
	fConst31 = (1.0 / tan((609.4689747964198 / double(iConst0))));
	fConst32 = (1 + fConst31);
	fConst33 = (0.0082 / fConst32);
	fConst34 = (0 - ((1 - fConst31) / fConst32));
	IOTA = 0;
	iConst35 = int((int((0.1111111111111111 * iConst0)) & 65535));
	fConst36 = (0.009000000000000008 / double(iConst0));
	fConst37 = tan((942.4777960769379 / double(iConst0)));
	fConst38 = (1.0 / faustpower<2>(fConst37));
	fConst39 = (2 * (1 - fConst38));
	fConst40 = (1.0 / fConst37);
	fConst41 = (1 + ((fConst40 - 1.0000000000000004) / fConst37));
	fConst42 = (1.0 / (1 + ((fConst40 + 1.0000000000000004) / fConst37)));
	fConst43 = tan((3769.9111843077517 / double(iConst0)));
	fConst44 = (1.0 / faustpower<2>(fConst43));
	fConst45 = (2 * (1 - fConst44));
	fConst46 = (1.0 / fConst43);
	fConst47 = (1 + ((fConst46 - 1.0000000000000004) / fConst43));
	fConst48 = (1 + ((fConst46 + 1.0000000000000004) / fConst43));
	fConst49 = (1.0 / fConst48);
	fConst50 = tan((10053.096491487338 / double(iConst0)));
	fConst51 = (1.0 / faustpower<2>(fConst50));
	fConst52 = (2 * (1 - fConst51));
	fConst53 = (1.0 / fConst50);
	fConst54 = (1 + ((fConst53 - 1.0000000000000004) / fConst50));
	fConst55 = (1 + ((1.0000000000000004 + fConst53) / fConst50));
	fConst56 = (1.0 / fConst55);
	fConst57 = tan((47123.8898038469 / double(iConst0)));
	fConst58 = (2 * (1 - (1.0 / faustpower<2>(fConst57))));
	fConst59 = (1.0 / fConst57);
	fConst60 = (1 + ((fConst59 - 1.414213562373095) / fConst57));
	fConst61 = (1 + ((1.414213562373095 + fConst59) / fConst57));
	fConst62 = (1.0 / fConst61);
	fConst63 = (1.0 / (fConst23 * fConst61));
	fConst64 = (1 + fConst53);
	fConst65 = (1.0 / fConst64);
	fConst66 = (0 - ((1 - fConst53) / fConst64));
	fConst67 = (1 + fConst46);
	fConst68 = (1.0 / (fConst67 * fConst55));
	fConst69 = (0 - ((1 - fConst46) / fConst67));
	fConst70 = (1 + fConst40);
	fConst71 = (1.0 / (fConst70 * fConst48));
	fConst72 = (0 - ((1 - fConst40) / fConst70));
	fConst73 = (1 + ((fConst40 - 1.0) / fConst37));
	fConst74 = (1.0 / (1 + ((1.0 + fConst40) / fConst37)));
	fConst75 = (0 - fConst46);
	fConst76 = (2 * (0 - fConst44));
	fConst77 = (1 + ((fConst46 - 1.0) / fConst43));
	fConst78 = (1.0 / (1 + ((1.0 + fConst46) / fConst43)));
	fConst79 = (0 - fConst53);
	fConst80 = (2 * (0 - fConst51));
	fConst81 = (0 - fConst40);
	fConst82 = (2 * (0 - fConst38));
	fConst83 = (0.025 / fConst23);
	clear_state_f();
}

void Dsp::init_static(unsigned int samplingFreq, PluginDef *p)
{
	static_cast<Dsp*>(p)->init(samplingFreq);
}

void always_inline Dsp::compute(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0)
{
#define fslider0 (*fslider0_)
#define fslider1 (*fslider1_)
#define fslider2 (*fslider2_)
#define fslider3 (*fslider3_)
	double 	fSlow0 = (0.0010000000000000009 * pow(10,(0.05 * double(fslider0))));
	double 	fSlow1 = (1.000000000000001e-05 * double(fslider1));
	double 	fSlow2 = (0.0010000000000000009 * pow(10,(0.05 * double(fslider2))));
	double 	fSlow3 = double(fslider3);
	double 	fSlow4 = (2 * (fSlow3 - 0.5));
	double 	fSlow5 = (0.024937655860349125 * (1 - max((double)0, fSlow4)));
	double 	fSlow6 = (1.25 * fSlow3);
	double 	fSlow7 = (fConst42 * pow(1e+01,(0.9 * fSlow3)));
	double 	fSlow8 = pow(1e+01,(1.2 * fSlow3));
	double 	fSlow9 = pow(1e+01,(0.8 * fSlow3));
	double 	fSlow10 = (fConst42 * pow(1e+01,(2 * fSlow3)));
	double 	fSlow11 = (1 - max((double)0, (0 - fSlow4)));
	for (int i=0; i<count; i++) {
		double fTemp0 = (0.4 * fRec2[1]);
		double fTemp1 = (0.5 * fRec0[1]);
		double fTemp2 = (fTemp1 + ((0.3 * fRec4[1]) + fTemp0));
		fRec10[0] = ((fConst4 * fRec10[1]) + (fConst3 * (fRec9[1] + fRec9[2])));
		fRec11[0] = ((0.999 * fRec11[1]) + fSlow0);
		fRec16[0] = (fSlow1 + (0.999 * fRec16[1]));
		double fTemp3 = (double)input0[i];
		fVec0[0] = fTemp3;
		fRec29[0] = (fConst15 * ((fVec0[0] - fVec0[1]) + (fConst14 * fRec29[1])));
		fRec28[0] = (fConst15 * ((fRec29[0] - fRec29[1]) + (fConst14 * fRec28[1])));
		fRec27[0] = (fRec28[0] - (fConst12 * ((fConst11 * fRec27[2]) + (fConst6 * fRec27[1]))));
		fRec26[0] = ((fConst12 * (fRec27[2] + (fRec27[0] + (2 * fRec27[1])))) - (fConst10 * ((fConst8 * fRec26[2]) + (fConst6 * fRec26[1]))));
		fRec30[0] = ((0.999 * fRec30[1]) + fSlow2);
		fRec31[0] = ((fConst20 * fRec31[1]) + (fConst19 * (fRec25[1] + fRec25[2])));
		fRec25[0] = (Ftube(TUBE_TABLE_12AU7_68k, ((fRec31[0] + (fConst16 * (fRec30[0] * (fRec26[2] + (fRec26[0] + (2 * fRec26[1])))))) - 1.25724)) - 83.43555555555557);
		fRec24[0] = ((fConst25 * fRec24[1]) + (fConst24 * ((fConst21 * fRec25[0]) + (fConst22 * fRec25[1]))));
		fRec34[0] = ((fConst29 * fRec34[1]) + (fConst28 * (fRec33[1] + fRec33[2])));
		fRec33[0] = (Ftube(TUBE_TABLE_12AU7_250k, ((fRec34[0] + fRec23[1]) - 0.776162)) - 78.25586666666666);
		fRec32[0] = ((fConst25 * fRec32[1]) + (fConst24 * ((fConst21 * fRec33[0]) + (fConst22 * fRec33[1]))));
		fRec23[0] = ((0.6 * fRec32[0]) + fRec24[0]);
		fRec22[0] = ((fConst4 * fRec22[1]) + (fConst30 * (fRec23[0] + fRec23[1])));
		fRec35[0] = ((fConst29 * fRec35[1]) + (fConst28 * (fRec21[1] + fRec21[2])));
		fRec21[0] = (Ftube(TUBE_TABLE_12AU7_250k, ((fRec35[0] + fRec22[0]) - 0.776162)) - 78.25586666666666);
		fRec20[0] = ((fConst25 * fRec20[1]) + (fConst24 * ((fConst21 * fRec21[0]) + (fConst22 * fRec21[1]))));
		fRec38[0] = ((fConst34 * fRec38[1]) + (fConst33 * (fRec37[1] + fRec37[2])));
		fRec37[0] = (Ftube(TUBE_TABLE_12AU7_250k, ((fRec38[0] + fRec19[1]) - 0.445487)) - 75.67231707317073);
		fRec36[0] = ((fConst25 * fRec36[1]) + (fConst24 * ((fConst21 * fRec37[0]) + (fConst22 * fRec37[1]))));
		fRec19[0] = ((0.6 * fRec36[0]) + fRec20[0]);
		fRec39[0] = ((fConst34 * fRec39[1]) + (fConst33 * (fRec18[1] + fRec18[2])));
		fRec18[0] = (Ftube(TUBE_TABLE_12AU7_250k, ((fRec39[0] + fRec19[0]) - 0.445487)) - 75.67231707317073);
		fRec17[0] = ((fConst25 * fRec17[1]) + (fConst24 * ((fConst21 * fRec18[0]) + (fConst22 * fRec18[1]))));
		double fTemp4 = (fRec17[0] * fRec16[0]);
		double fTemp5 = fabs(fTemp4);
		fRec15[0] = ((0.9999 * fRec15[1]) + (9.999999999998899e-05 * fTemp5));
		double fTemp6 = max(fRec15[0], fTemp5);
		fVec1[IOTA&32767] = fTemp6;
		fRec14[0] = ((fVec1[IOTA&32767] + fRec14[1]) - fVec1[(IOTA-iConst35)&32767]);
		fRec13[0] = ((0.999 * fRec13[1]) + (fConst36 * fRec14[0]));
		double fTemp7 = max(-1.0, min(-0.01, (fVec1[IOTA&32767] - (1.0 + (1.02 * fRec13[0])))));
		double fTemp8 = (0 - fTemp7);
		double fTemp9 = (40.1 * fTemp8);
		double fTemp10 = max((double)-600, fTemp9);
		double fTemp11 = (0 - fTemp10);
		double fTemp12 = (fTemp4 - fTemp7);
		double fTemp13 = (40.1 * fTemp12);
		double fTemp14 = max((double)-600, fTemp13);
		double fTemp15 = (0 - fTemp14);
		double fTemp16 = (((int((fabs(fTemp13) > 0.0001)))?((int((fTemp14 < -50)))?(fTemp15 * exp(fTemp14)):(fTemp14 / (1 - exp(fTemp15)))):(1 + (fTemp12 * (20.05 + (134.00083333333336 * fTemp12))))) - ((int((fabs(fTemp9) > 0.0001)))?((int((fTemp10 < -50)))?(fTemp11 * exp(fTemp10)):(fTemp10 / (1 - exp(fTemp11)))):(1 + (fTemp8 * (20.05 + (134.00083333333336 * fTemp8))))));
		double fTemp17 = (fRec17[0] * (1 - fRec16[0]));
		fRec48[0] = ((0.024937655860349125 * fTemp16) - (fConst62 * ((fConst60 * fRec48[2]) + (fConst58 * fRec48[1]))));
		double fTemp18 = (fRec48[2] + (fRec48[0] + (2 * fRec48[1])));
		fVec2[0] = fTemp18;
		fRec47[0] = ((fConst25 * fRec47[1]) + (fConst63 * ((fConst21 * fVec2[0]) + (fConst22 * fVec2[1]))));
		fRec46[0] = ((fConst66 * fRec46[1]) + (fConst65 * (fRec47[0] + fRec47[1])));
		fRec45[0] = (fRec46[0] - (fConst56 * ((fConst54 * fRec45[2]) + (fConst52 * fRec45[1]))));
		double fTemp19 = (fRec45[2] + (fRec45[0] + (2 * fRec45[1])));
		fVec3[0] = fTemp19;
		fRec44[0] = ((fConst69 * fRec44[1]) + (fConst68 * (fVec3[0] + fVec3[1])));
		fRec43[0] = (fRec44[0] - (fConst49 * ((fConst47 * fRec43[2]) + (fConst45 * fRec43[1]))));
		double fTemp20 = (fRec43[2] + (fRec43[0] + (2 * fRec43[1])));
		fVec4[0] = fTemp20;
		fRec42[0] = ((fConst72 * fRec42[1]) + (fConst71 * (fVec4[0] + fVec4[1])));
		fRec41[0] = (fRec42[0] - (fConst42 * ((fConst41 * fRec41[2]) + (fConst39 * fRec41[1]))));
		double fTemp21 = max((double)-1, min((double)1, (fSlow7 * (fRec41[2] + (fRec41[0] + (2 * fRec41[1]))))));
		double fTemp22 = (fConst39 * fRec49[1]);
		fRec51[0] = ((fConst69 * fRec51[1]) + (fConst68 * ((fConst46 * fVec3[0]) + (fConst75 * fVec3[1]))));
		fRec50[0] = (fRec51[0] - (fConst49 * ((fConst47 * fRec50[2]) + (fConst45 * fRec50[1]))));
		fRec49[0] = ((fConst49 * (((fConst44 * fRec50[0]) + (fConst76 * fRec50[1])) + (fConst44 * fRec50[2]))) - (fConst74 * ((fConst73 * fRec49[2]) + fTemp22)));
		double fTemp23 = max((double)-1, min((double)1, (fSlow8 * (fRec49[2] + (fConst74 * (fTemp22 + (fConst73 * fRec49[0])))))));
		double fTemp24 = (fConst39 * fRec52[1]);
		double fTemp25 = (fConst45 * fRec53[1]);
		fRec55[0] = ((fConst66 * fRec55[1]) + (fConst65 * ((fConst53 * fRec47[0]) + (fConst79 * fRec47[1]))));
		fRec54[0] = (fRec55[0] - (fConst56 * ((fConst54 * fRec54[2]) + (fConst52 * fRec54[1]))));
		fRec53[0] = ((fConst56 * (((fConst51 * fRec54[0]) + (fConst80 * fRec54[1])) + (fConst51 * fRec54[2]))) - (fConst78 * ((fConst77 * fRec53[2]) + fTemp25)));
		fRec52[0] = ((fRec53[2] + (fConst78 * (fTemp25 + (fConst77 * fRec53[0])))) - (fConst74 * ((fConst73 * fRec52[2]) + fTemp24)));
		double fTemp26 = max((double)-1, min((double)1, (fSlow9 * (fRec52[2] + (fConst74 * (fTemp24 + (fConst73 * fRec52[0])))))));
		fRec57[0] = ((fConst72 * fRec57[1]) + (fConst71 * ((fConst40 * fVec4[0]) + (fConst81 * fVec4[1]))));
		fRec56[0] = (fRec57[0] - (fConst42 * ((fConst41 * fRec56[2]) + (fConst39 * fRec56[1]))));
		double fTemp27 = max((double)-1, min((double)1, (fSlow10 * (((fConst38 * fRec56[0]) + (fConst82 * fRec56[1])) + (fConst38 * fRec56[2])))));
		double fTemp28 = ((1.584893192 * ((fTemp27 * (1 - (0.3333333333333333 * faustpower<2>(fTemp27)))) + ((fTemp26 * (1 - (0.3333333333333333 * faustpower<2>(fTemp26)))) + (0.8413951417869425 * (fTemp23 * (1 - (0.3333333333333333 * faustpower<2>(fTemp23)))))))) + (1.2589412 * (fTemp21 * (1 - (0.3333333333333333 * faustpower<2>(fTemp21))))));
		fVec5[0] = fTemp28;
		fRec40[0] = ((fConst4 * fRec40[1]) + (fConst30 * (fVec5[0] + fVec5[1])));
		double fTemp29 = ((fSlow11 * fRec40[0]) + ((fTemp17 * (1 + (fSlow6 * ((4 - (4 * fabs(fTemp17))) - 1)))) + (fSlow5 * fTemp16)));
		fVec6[0] = fTemp29;
		fRec12[0] = ((fConst4 * fRec12[1]) + (fConst30 * (fVec6[0] + fVec6[1])));
		double fTemp30 = (fRec12[0] * fRec11[0]);
		fRec9[0] = (Ftube(TUBE_TABLE_6V6_68k, ((fTemp30 + fRec10[0]) - 0.664541)) - 87.91682926829267);
		fRec8[0] = ((fConst25 * fRec8[1]) + (fConst83 * ((fConst21 * fRec9[0]) + (fConst22 * fRec9[1]))));
		fRec60[0] = ((fConst4 * fRec60[1]) + (fConst3 * (fRec59[1] + fRec59[2])));
		fRec59[0] = (Ftube(TUBE_TABLE_6V6_250k, ((fRec60[0] + fTemp30) - 0.659761)) - 89.08268292682925);
		fRec58[0] = ((fConst25 * fRec58[1]) + (fConst83 * ((fConst21 * fRec59[0]) + (fConst22 * fRec59[1]))));
		double fTemp31 = (min(0.7, fRec58[0]) + max(-0.75, fRec8[0]));
		double fTemp32 = ((fTemp31 + (0.2 * fRec6[1])) - fTemp2);
		fRec6[0] = fTemp32;
		double 	fRec7 = (0 - (0.2 * fTemp32));
		fRec4[0] = (fRec7 + fRec6[1]);
		double 	fRec5 = (0.3 * (fTemp31 - fTemp2));
		fRec2[0] = (fRec5 + fRec4[1]);
		double 	fRec3 = (0.4 * (fTemp31 - (fTemp0 + fTemp1)));
		fRec0[0] = (fRec3 + fRec2[1]);
		double 	fRec1 = (0.5 * (fTemp31 - fTemp1));
		output0[i] = (FAUSTFLOAT)(fRec1 + fRec0[1]);
		// post processing
		fRec0[1] = fRec0[0];
		fRec2[1] = fRec2[0];
		fRec4[1] = fRec4[0];
		fRec6[1] = fRec6[0];
		fRec58[1] = fRec58[0];
		fRec59[2] = fRec59[1]; fRec59[1] = fRec59[0];
		fRec60[1] = fRec60[0];
		fRec8[1] = fRec8[0];
		fRec9[2] = fRec9[1]; fRec9[1] = fRec9[0];
		fRec12[1] = fRec12[0];
		fVec6[1] = fVec6[0];
		fRec40[1] = fRec40[0];
		fVec5[1] = fVec5[0];
		fRec56[2] = fRec56[1]; fRec56[1] = fRec56[0];
		fRec57[1] = fRec57[0];
		fRec52[2] = fRec52[1]; fRec52[1] = fRec52[0];
		fRec53[2] = fRec53[1]; fRec53[1] = fRec53[0];
		fRec54[2] = fRec54[1]; fRec54[1] = fRec54[0];
		fRec55[1] = fRec55[0];
		fRec49[2] = fRec49[1]; fRec49[1] = fRec49[0];
		fRec50[2] = fRec50[1]; fRec50[1] = fRec50[0];
		fRec51[1] = fRec51[0];
		fRec41[2] = fRec41[1]; fRec41[1] = fRec41[0];
		fRec42[1] = fRec42[0];
		fVec4[1] = fVec4[0];
		fRec43[2] = fRec43[1]; fRec43[1] = fRec43[0];
		fRec44[1] = fRec44[0];
		fVec3[1] = fVec3[0];
		fRec45[2] = fRec45[1]; fRec45[1] = fRec45[0];
		fRec46[1] = fRec46[0];
		fRec47[1] = fRec47[0];
		fVec2[1] = fVec2[0];
		fRec48[2] = fRec48[1]; fRec48[1] = fRec48[0];
		fRec13[1] = fRec13[0];
		fRec14[1] = fRec14[0];
		IOTA = IOTA+1;
		fRec15[1] = fRec15[0];
		fRec17[1] = fRec17[0];
		fRec18[2] = fRec18[1]; fRec18[1] = fRec18[0];
		fRec39[1] = fRec39[0];
		fRec19[1] = fRec19[0];
		fRec36[1] = fRec36[0];
		fRec37[2] = fRec37[1]; fRec37[1] = fRec37[0];
		fRec38[1] = fRec38[0];
		fRec20[1] = fRec20[0];
		fRec21[2] = fRec21[1]; fRec21[1] = fRec21[0];
		fRec35[1] = fRec35[0];
		fRec22[1] = fRec22[0];
		fRec23[1] = fRec23[0];
		fRec32[1] = fRec32[0];
		fRec33[2] = fRec33[1]; fRec33[1] = fRec33[0];
		fRec34[1] = fRec34[0];
		fRec24[1] = fRec24[0];
		fRec25[2] = fRec25[1]; fRec25[1] = fRec25[0];
		fRec31[1] = fRec31[0];
		fRec30[1] = fRec30[0];
		fRec26[2] = fRec26[1]; fRec26[1] = fRec26[0];
		fRec27[2] = fRec27[1]; fRec27[1] = fRec27[0];
		fRec28[1] = fRec28[0];
		fRec29[1] = fRec29[0];
		fVec0[1] = fVec0[0];
		fRec16[1] = fRec16[0];
		fRec11[1] = fRec11[0];
		fRec10[1] = fRec10[0];
	}
#undef fslider0
#undef fslider1
#undef fslider2
#undef fslider3
}

void __rt_func Dsp::compute_static(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0, PluginDef *p)
{
	static_cast<Dsp*>(p)->compute(count, input0, output0);
}

int Dsp::register_par(const ParamReg& reg)
{
	fslider3_ = reg.registerVar("gxdistortion.drive","","SA","",&fslider3, 0.35, 0.0, 1.0, 0.01);
	fslider1_ = reg.registerVar("gxdistortion.wet_dry","","SA","",&fslider1, 1e+02, 0.0, 1e+02, 1.0);
	fslider2_ = reg.registerVar("amp2.stage1.Pregain","","SA","",&fslider2, -6.0, -2e+01, 2e+01, 0.1);
	fslider0_ = reg.registerVar("amp2.stage2.gain1","","SA","",&fslider0, -6.0, -2e+01, 2e+01, 0.1);
	return 0;
}

int Dsp::register_params_static(const ParamReg& reg)
{
	return static_cast<Dsp*>(reg.plugin)->register_par(reg);
}

PluginDef *plugin() {
	return new Dsp();
}

void Dsp::del_instance(PluginDef *p)
{
	delete static_cast<Dsp*>(p);
}

} // end namespace gxamp8
