// generated automatically
// DO NOT MODIFY!
declare id "muff";
declare name "Muff";
declare category "Fuzz";
declare shortname "Muff";
declare description "Muff";

import("filter.lib");
import("trany.lib");

process = pre : iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0,b5/a0,b6/a0),(a1/a0,a2/a0,a3/a0,a4/a0,a5/a0,a6/a0)) : clip with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    pre = _;
    clip = tranystage(TB_7199P_68k,86.0,2700.0,3.571981) : tranystage(TB_7199P_68k,86.0,2700.0,3.571981) : tranystage(TB_7199P_68k,86.0,2700.0,3.571981) ;


        Tone = vslider("Tone[name:Tone]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
        Level = vslider("Level[name:Level]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
    b0 = Tone*pow(fs,3)*(fs*(fs*(-1.29955117406144e-31*fs + 3.73173380397863e-25) + 1.11415567049164e-24) - 3.19936025718332e-18) + Level*(Tone*pow(fs,3)*(fs*(fs*(-5.90705079118838e-30*fs + 1.6962426381721e-23) + 5.06434395678016e-23) - 1.45425466235606e-16) + pow(fs,3)*(fs*(-1.38925083422393e-26*fs + 3.98287967295002e-20) + 1.84690342119219e-16)) + pow(fs,3)*(fs*(-3.05635183529265e-28*fs + 8.76233528049005e-22) + 4.06318752662282e-18);

    b1 = Tone*pow(fs,4)*(fs*(7.79730704436866e-31*fs - 1.49269352159145e-24) - 2.22831134098327e-24) + Level*(Tone*pow(fs,4)*(fs*(3.54423047471303e-29*fs - 6.78497055268842e-23) - 1.01286879135603e-22) + pow(fs,4)*(5.55700333689573e-26*fs - 7.96575934590005e-20)) + pow(fs,4)*(1.22254073411706e-27*fs - 1.75246705609801e-21);

    b2 = Tone*pow(fs,3)*(fs*(fs*(-1.94932676109216e-30*fs + 1.86586690198932e-24) - 1.11415567049164e-24) + 9.59808077154997e-18) + Level*(Tone*pow(fs,3)*(fs*(fs*(-8.86057618678257e-29*fs + 8.48121319086052e-23) - 5.06434395678016e-23) + 4.36276398706817e-16) + pow(fs,3)*(fs*(-6.94625417111967e-26*fs - 3.98287967295002e-20) - 5.54071026357658e-16)) + pow(fs,3)*(fs*(-1.52817591764633e-27*fs - 8.76233528049005e-22) - 1.21895625798685e-17);

    b3 = Tone*pow(fs,4)*(2.59910234812289e-30*pow(fs,2) + 4.45662268196654e-24) + Level*(Tone*pow(fs,4)*(1.18141015823768e-28*pow(fs,2) + 2.02573758271206e-22) + 1.59315186918001e-19*pow(fs,4)) + 3.50493411219602e-21*pow(fs,4);

    b4 = Tone*pow(fs,3)*(fs*(fs*(-1.94932676109216e-30*fs - 1.86586690198932e-24) - 1.11415567049164e-24) - 9.59808077154997e-18) + Level*(Tone*pow(fs,3)*(fs*(fs*(-8.86057618678257e-29*fs - 8.48121319086052e-23) - 5.06434395678016e-23) - 4.36276398706817e-16) + pow(fs,3)*(fs*(6.94625417111967e-26*fs - 3.98287967295002e-20) + 5.54071026357658e-16)) + pow(fs,3)*(fs*(1.52817591764633e-27*fs - 8.76233528049005e-22) + 1.21895625798685e-17);

    b5 = Tone*pow(fs,4)*(fs*(7.79730704436866e-31*fs + 1.49269352159145e-24) - 2.22831134098327e-24) + Level*(Tone*pow(fs,4)*(fs*(3.54423047471303e-29*fs + 6.78497055268842e-23) - 1.01286879135603e-22) + pow(fs,4)*(-5.55700333689573e-26*fs - 7.96575934590005e-20)) + pow(fs,4)*(-1.22254073411706e-27*fs - 1.75246705609801e-21);

    b6 = Tone*pow(fs,3)*(fs*(fs*(-1.29955117406144e-31*fs - 3.73173380397863e-25) + 1.11415567049164e-24) + 3.19936025718332e-18) + Level*(Tone*pow(fs,3)*(fs*(fs*(-5.90705079118838e-30*fs - 1.6962426381721e-23) + 5.06434395678016e-23) + 1.45425466235606e-16) + pow(fs,3)*(fs*(1.38925083422393e-26*fs + 3.98287967295002e-20) - 1.84690342119219e-16)) + pow(fs,3)*(fs*(3.05635183529265e-28*fs + 8.76233528049005e-22) - 4.06318752662282e-18);

    a0 = Tone*(Tone*fs*(fs*(fs*(fs*(fs*(-5.75452574944698e-29*fs - 7.27469124190795e-25) - 2.36761929650589e-21) - 2.15665382234029e-18) - 5.3389212423117e-16) - 3.40686364113531e-15) + fs*(fs*(fs*(fs*(fs*(5.77317651704237e-29*fs + 7.91492198040202e-25) + 2.5773097315087e-21) + 2.02385759012812e-18) + 5.21709009014916e-16) + 3.33278467477534e-15)) + fs*(fs*(fs*(fs*(fs*(4.64196013276193e-29*fs + 7.1140905248404e-25) + 2.87245155338884e-21) + 3.60543982135142e-18) + 8.93675308928682e-16) + 1.16723639524299e-14) + 3.91224189243262e-14;

    a1 = Tone*(Tone*fs*(fs*(pow(fs,2)*(fs*(3.45271544966819e-28*fs + 2.90987649676318e-24) + 4.73523859301178e-21) - 1.06778424846234e-15) - 1.36274545645413e-14) + fs*(fs*(pow(fs,2)*(fs*(-3.46390591022542e-28*fs - 3.16596879216081e-24) - 5.15461946301739e-21) + 1.04341801802983e-15) + 1.33311386991013e-14)) + fs*(fs*(pow(fs,2)*(fs*(-2.78517607965716e-28*fs - 2.84563620993616e-24) - 5.74490310677768e-21) + 1.78735061785736e-15) + 4.66894558097195e-14) + 2.34734513545957e-13;

    a2 = Tone*(Tone*fs*(fs*(fs*(fs*(fs*(-8.63178862417047e-28*fs - 3.63734562095397e-24) + 2.36761929650589e-21) + 6.46996146702087e-18) + 5.3389212423117e-16) - 1.70343182056766e-14) + fs*(fs*(fs*(fs*(fs*(8.65976477556356e-28*fs + 3.95746099020101e-24) - 2.5773097315087e-21) - 6.07157277038437e-18) - 5.21709009014916e-16) + 1.66639233738767e-14)) + fs*(fs*(fs*(fs*(fs*(6.96294019914289e-28*fs + 3.5570452624202e-24) - 2.87245155338884e-21) - 1.08163194640543e-17) - 8.93675308928682e-16) + 5.83618197621494e-14) + 5.86836283864892e-13;

    a3 = Tone*(Tone*pow(fs,2)*(pow(fs,2)*(1.1509051498894e-27*pow(fs,2) - 9.47047718602356e-21) + 2.13556849692468e-15) + pow(fs,2)*(pow(fs,2)*(-1.15463530340847e-27*pow(fs,2) + 1.03092389260348e-20) - 2.08683603605967e-15)) + pow(fs,2)*(pow(fs,2)*(-9.28392026552386e-28*pow(fs,2) + 1.14898062135554e-20) - 3.57470123571473e-15) + 7.82448378486523e-13;

    a4 = Tone*(Tone*fs*(fs*(fs*(fs*(fs*(-8.63178862417047e-28*fs + 3.63734562095397e-24) + 2.36761929650589e-21) - 6.46996146702087e-18) + 5.3389212423117e-16) + 1.70343182056766e-14) + fs*(fs*(fs*(fs*(fs*(8.65976477556356e-28*fs - 3.95746099020101e-24) - 2.5773097315087e-21) + 6.07157277038437e-18) - 5.21709009014916e-16) - 1.66639233738767e-14)) + fs*(fs*(fs*(fs*(fs*(6.96294019914289e-28*fs - 3.5570452624202e-24) - 2.87245155338884e-21) + 1.08163194640543e-17) - 8.93675308928682e-16) - 5.83618197621494e-14) + 5.86836283864892e-13;

    a5 = Tone*(Tone*fs*(fs*(pow(fs,2)*(fs*(3.45271544966819e-28*fs - 2.90987649676318e-24) + 4.73523859301178e-21) - 1.06778424846234e-15) + 1.36274545645413e-14) + fs*(fs*(pow(fs,2)*(fs*(-3.46390591022542e-28*fs + 3.16596879216081e-24) - 5.15461946301739e-21) + 1.04341801802983e-15) - 1.33311386991013e-14)) + fs*(fs*(pow(fs,2)*(fs*(-2.78517607965716e-28*fs + 2.84563620993616e-24) - 5.74490310677768e-21) + 1.78735061785736e-15) - 4.66894558097195e-14) + 2.34734513545957e-13;

    a6 = Tone*(Tone*fs*(fs*(fs*(fs*(fs*(-5.75452574944698e-29*fs + 7.27469124190795e-25) - 2.36761929650589e-21) + 2.15665382234029e-18) - 5.3389212423117e-16) + 3.40686364113531e-15) + fs*(fs*(fs*(fs*(fs*(5.77317651704237e-29*fs - 7.91492198040202e-25) + 2.5773097315087e-21) - 2.02385759012812e-18) + 5.21709009014916e-16) - 3.33278467477534e-15)) + fs*(fs*(fs*(fs*(fs*(4.64196013276193e-29*fs - 7.1140905248404e-25) + 2.87245155338884e-21) - 3.60543982135142e-18) + 8.93675308928682e-16) - 1.16723639524299e-14) + 3.91224189243262e-14;
};
