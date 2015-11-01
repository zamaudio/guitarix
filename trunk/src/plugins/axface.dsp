// generated automatically
// DO NOT MODIFY!
declare id "axface";
declare name "Axis Face";
declare category "Fuzz";
declare shortname "Axis Face";
declare description "Axis Face";

import("filter.lib");
import("trany.lib");

process = pre :  iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0,b5/a0),(a1/a0,a2/a0,a3/a0,a4/a0,a5/a0)) : clip with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    pre = _;
    clip = tranystage(TB_7199P_68k,86.0,2700.0,3.571981) : tranystage(TB_7199P_68k,86.0,2700.0,3.571981) ;

    
        Attack = vslider("Attack[name:Attack]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
        Smooth = vslider("Smooth[name:Smooth]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
        Level = vslider("Level[name:Level]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
    b0 = Attack*(Attack*Level*pow(fs,3)*(3.38149630023061e-21*fs - 1.69477435943983e-16) + Level*pow(fs,3)*(-3.86160790724035e-21*fs + 1.70600223084551e-14)) + Level*pow(fs,2)*(-1.28720263574678e-19*fs + 5.68667410281837e-13);

    b1 = Attack*(Attack*Level*pow(fs,3)*(-1.01444889006918e-20*fs + 1.69477435943983e-16) + Level*pow(fs,3)*(1.15848237217211e-20*fs - 1.70600223084551e-14)) + Level*pow(fs,2)*(1.28720263574678e-19*fs + 5.68667410281837e-13);

    b2 = Attack*(Attack*Level*pow(fs,3)*(6.76299260046122e-21*fs + 3.38954871887967e-16) + Level*pow(fs,3)*(-7.7232158144807e-21*fs - 3.41200446169102e-14)) + Level*pow(fs,2)*(2.57440527149357e-19*fs - 1.13733482056367e-12);

    b3 = Attack*(Attack*Level*pow(fs,3)*(6.76299260046122e-21*fs - 3.38954871887967e-16) + Level*pow(fs,3)*(-7.7232158144807e-21*fs + 3.41200446169102e-14)) + Level*pow(fs,2)*(-2.57440527149357e-19*fs - 1.13733482056367e-12);

    b4 = Attack*(Attack*Level*pow(fs,3)*(-1.01444889006918e-20*fs - 1.69477435943983e-16) + Level*pow(fs,3)*(1.15848237217211e-20*fs + 1.70600223084551e-14)) + Level*pow(fs,2)*(-1.28720263574678e-19*fs + 5.68667410281837e-13);

    b5 = Attack*(Attack*Level*pow(fs,3)*(3.38149630023061e-21*fs + 1.69477435943983e-16) + Level*pow(fs,3)*(-3.86160790724035e-21*fs - 1.70600223084551e-14)) + Level*pow(fs,2)*(1.28720263574678e-19*fs + 5.68667410281837e-13);

    a0 = Attack*(Attack*fs*(fs*(fs*(fs*(-4.03791059191999e-25*fs - 1.13427407987086e-18) - 1.49739128868709e-14) - 7.44393603614497e-12) - 1.60942285815325e-10) + fs*(fs*(fs*(fs*(5.1173274738794e-25*fs + 1.13834320666478e-18) + 1.49968987528957e-14) + 7.45459961503187e-12) + 1.61087815478651e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(3.77313513934094e-25*fs + 1.13011470525257e-18) + 1.48978106454603e-14) + 7.08146057587431e-12) + pow(fs,2)*(fs*(fs*(-4.4415330562134e-25*fs - 1.13263345455505e-18) - 1.49120085362402e-14) - 7.08786388106065e-12)) + fs*(fs*(fs*(-1.4805110187378e-23*fs - 3.77544484851683e-17) - 4.97066951208006e-13) - 2.36262129368688e-10)) + fs*(fs*(fs*(1.70577582462647e-23*fs + 3.79447735554928e-17) + 4.99896625096522e-13) + 2.48486653834396e-10) + 5.36959384928837e-9;

    a1 = Attack*(Attack*fs*(fs*(fs*(fs*(2.01895529596e-24*fs + 3.40282223961257e-18) + 1.49739128868709e-14) - 7.44393603614497e-12) - 4.82826857445976e-10) + fs*(fs*(fs*(fs*(-2.5586637369397e-24*fs - 3.41502961999435e-18) - 1.49968987528957e-14) + 7.45459961503187e-12) + 4.83263446435953e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(-1.88656756967047e-24*fs - 3.39034411575772e-18) - 1.48978106454603e-14) + 7.08146057587431e-12) + pow(fs,2)*(fs*(fs*(2.2207665281067e-24*fs + 3.39790036366515e-18) + 1.49120085362402e-14) - 7.08786388106065e-12)) + fs*(fs*(fs*(4.4415330562134e-23*fs + 3.77544484851683e-17) - 4.97066951208006e-13) - 7.08786388106065e-10)) + fs*(fs*(fs*(-5.1173274738794e-23*fs - 3.79447735554928e-17) + 4.99896625096522e-13) + 7.45459961503187e-10) + 2.68479692464418e-8;

    a2 = Attack*(Attack*fs*(fs*(fs*(fs*(-4.03791059191999e-24*fs - 2.26854815974171e-18) + 2.99478257737419e-14) + 1.48878720722899e-11) - 3.21884571630651e-10) + fs*(fs*(fs*(fs*(5.1173274738794e-24*fs + 2.27668641332957e-18) - 2.99937975057913e-14) - 1.49091992300637e-11) + 3.22175630957302e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(3.77313513934094e-24*fs + 2.26022941050514e-18) - 2.97956212909206e-14) - 1.41629211517486e-11) + pow(fs,2)*(fs*(fs*(-4.4415330562134e-24*fs - 2.2652669091101e-18) + 2.98240170724803e-14) + 1.41757277621213e-11)) + fs*(fs*(fs*(-2.9610220374756e-23*fs + 7.55088969703365e-17) + 9.94133902416011e-13) - 4.72524258737377e-10)) + fs*(fs*(fs*(3.41155164925293e-23*fs - 7.58895471109855e-17) - 9.99793250193045e-13) + 4.96973307668791e-10) + 5.36959384928837e-8;

    a3 = Attack*(Attack*fs*(fs*(fs*(fs*(4.03791059191999e-24*fs - 2.26854815974171e-18) - 2.99478257737419e-14) + 1.48878720722899e-11) + 3.21884571630651e-10) + fs*(fs*(fs*(fs*(-5.1173274738794e-24*fs + 2.27668641332957e-18) + 2.99937975057913e-14) - 1.49091992300637e-11) - 3.22175630957302e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(-3.77313513934094e-24*fs + 2.26022941050514e-18) + 2.97956212909206e-14) - 1.41629211517486e-11) + pow(fs,2)*(fs*(fs*(4.4415330562134e-24*fs - 2.2652669091101e-18) - 2.98240170724803e-14) + 1.41757277621213e-11)) + fs*(fs*(fs*(-2.9610220374756e-23*fs - 7.55088969703365e-17) + 9.94133902416011e-13) + 4.72524258737377e-10)) + fs*(fs*(fs*(3.41155164925293e-23*fs + 7.58895471109855e-17) - 9.99793250193045e-13) - 4.96973307668791e-10) + 5.36959384928837e-8;

    a4 = Attack*(Attack*fs*(fs*(fs*(fs*(-2.01895529596e-24*fs + 3.40282223961257e-18) - 1.49739128868709e-14) - 7.44393603614497e-12) + 4.82826857445976e-10) + fs*(fs*(fs*(fs*(2.5586637369397e-24*fs - 3.41502961999435e-18) + 1.49968987528957e-14) + 7.45459961503187e-12) - 4.83263446435953e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(1.88656756967047e-24*fs - 3.39034411575772e-18) + 1.48978106454603e-14) + 7.08146057587431e-12) + pow(fs,2)*(fs*(fs*(-2.2207665281067e-24*fs + 3.39790036366515e-18) - 1.49120085362402e-14) - 7.08786388106065e-12)) + fs*(fs*(fs*(4.4415330562134e-23*fs - 3.77544484851683e-17) - 4.97066951208006e-13) + 7.08786388106065e-10)) + fs*(fs*(fs*(-5.1173274738794e-23*fs + 3.79447735554928e-17) + 4.99896625096522e-13) - 7.45459961503187e-10) + 2.68479692464418e-8;

    a5 = Attack*(Attack*fs*(fs*(fs*(fs*(4.03791059191999e-25*fs - 1.13427407987086e-18) + 1.49739128868709e-14) - 7.44393603614497e-12) + 1.60942285815325e-10) + fs*(fs*(fs*(fs*(-5.1173274738794e-25*fs + 1.13834320666478e-18) - 1.49968987528957e-14) + 7.45459961503187e-12) - 1.61087815478651e-10)) + Smooth*(Attack*(Attack*pow(fs,2)*(fs*(fs*(-3.77313513934094e-25*fs + 1.13011470525257e-18) - 1.48978106454603e-14) + 7.08146057587431e-12) + pow(fs,2)*(fs*(fs*(4.4415330562134e-25*fs - 1.13263345455505e-18) + 1.49120085362402e-14) - 7.08786388106065e-12)) + fs*(fs*(fs*(-1.4805110187378e-23*fs + 3.77544484851683e-17) - 4.97066951208006e-13) + 2.36262129368688e-10)) + fs*(fs*(fs*(1.70577582462647e-23*fs - 3.79447735554928e-17) + 4.99896625096522e-13) - 2.48486653834396e-10) + 5.36959384928837e-9;
};
