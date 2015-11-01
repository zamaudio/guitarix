// generated automatically
// DO NOT MODIFY!
declare id "ruin";
declare name "Ruiner";
declare category "Fuzz";
declare shortname "Ruiner";
declare description "Devi Ever Dark Boost";

import("filter.lib");
import("trany.lib");

process = pre : _<:*(dry),(*(wet) : iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0,b5/a0),(a1/a0,a2/a0,a3/a0,a4/a0,a5/a0)) : *(0.5) : clip  : clip2 ):>_ with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    pre = _;
    wet = vslider("wet_dry[name:wet/dry][tooltip:percentage of processed signal in output signal]",  100, 0, 100, 1) : /(100);
    dry = 1 - wet;
    clip = tranystage(TB_SVEL34_250k,86.0,2700.0,3.571981)   ;
    clip2 = tranystage(TB_KT88_68k,86.0,2700.0,5.562895) ;

    
        Level = vslider("Level[name:Level]", 0.5, 0, 1, 0.01) : Inverted(0) : LogPot(0) : smooth(s);
    
        Intensity = vslider("Intensity[name:Intensity]", 0.5, 0, 1, 0.01) : Inverted(1) : LogPot(0) : smooth(s);
    
    b0 = 4.66576522119352e-14*Level*pow(fs,3) + 4.66576522119352e-16*pow(fs,3);

    b1 = -4.66576522119352e-14*Level*pow(fs,3) - 4.66576522119352e-16*pow(fs,3);

    b2 = -9.33153044238704e-14*Level*pow(fs,3) - 9.33153044238704e-16*pow(fs,3);

    b3 = 9.33153044238704e-14*Level*pow(fs,3) + 9.33153044238704e-16*pow(fs,3);

    b4 = 4.66576522119352e-14*Level*pow(fs,3) + 4.66576522119352e-16*pow(fs,3);

    b5 = -4.66576522119352e-14*Level*pow(fs,3) - 4.66576522119352e-16*pow(fs,3);

    a0 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(-2.77619078700135e-25*fs - 1.77177960077957e-21) - 1.30282134265895e-18) - 1.15986606751485e-15) + fs*(fs*(fs*(fs*(2.74842887913133e-25*fs + 1.78182371264179e-21) + 1.45999906472023e-18) + 1.22360789786831e-15) + 5.79933033757426e-14)) + fs*(fs*(fs*(fs*(2.80672888565836e-24*fs + 1.81905884616603e-20) + 1.48752851885156e-17) + 1.24804042577715e-14) + 5.80512966791183e-13)) + Level*(Level*fs*(fs*(fs*(fs*(-2.14830127173034e-25*fs - 2.7133044348957e-22) - 3.93508698145447e-19) - 1.44426081917549e-16) - 5.79933033757426e-14) + fs*(fs*(fs*(fs*(2.12681825901304e-25*fs + 2.90100151771978e-22) + 4.11311489819172e-19) + 1.67435306237073e-16) + 6.51446456326455e-14) + 2.89966516878713e-12) + fs*(fs*(fs*(fs*(2.17193258571938e-24*fs + 2.95819574097976e-21) + 4.19596910358881e-18) + 1.70492707442481e-15) + 6.63702362788267e-13) + 2.90256483395592e-11;

    a1 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(1.38809539350067e-24*fs + 5.31533880233872e-21) + 1.30282134265895e-18) - 1.15986606751485e-15) + fs*(fs*(fs*(fs*(-1.37421443956567e-24*fs - 5.34547113792538e-21) - 1.45999906472023e-18) + 1.22360789786831e-15) + 1.73979910127228e-13)) + fs*(fs*(fs*(fs*(-1.40336444282918e-23*fs - 5.4571765384981e-20) - 1.48752851885156e-17) + 1.24804042577715e-14) + 1.74153890037355e-12)) + Level*(Level*fs*(fs*(fs*(fs*(1.07415063586517e-24*fs + 8.13991330468709e-22) + 3.93508698145447e-19) - 1.44426081917549e-16) - 1.73979910127228e-13) + fs*(fs*(fs*(fs*(-1.06340912950652e-24*fs - 8.70300455315933e-22) - 4.11311489819172e-19) + 1.67435306237073e-16) + 1.95433936897936e-13) + 1.44983258439356e-11) + fs*(fs*(fs*(fs*(-1.08596629285969e-23*fs - 8.87458722293927e-21) - 4.19596910358881e-18) + 1.70492707442481e-15) + 1.9911070883648e-12) + 1.45128241697796e-10;

    a2 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(-2.77619078700135e-24*fs - 3.54355920155915e-21) + 2.60564268531789e-18) + 2.3197321350297e-15) + fs*(fs*(fs*(fs*(2.74842887913133e-24*fs + 3.56364742528358e-21) - 2.91999812944046e-18) - 2.44721579573661e-15) + 1.15986606751485e-13)) + fs*(fs*(fs*(fs*(2.80672888565836e-23*fs + 3.63811769233207e-20) - 2.97505703770311e-17) - 2.49608085155429e-14) + 1.16102593358237e-12)) + Level*(Level*fs*(fs*(fs*(fs*(-2.14830127173034e-24*fs - 5.4266088697914e-22) + 7.87017396290893e-19) + 2.88852163835099e-16) - 1.15986606751485e-13) + fs*(fs*(fs*(fs*(2.12681825901304e-24*fs + 5.80200303543955e-22) - 8.22622979638344e-19) - 3.34870612474147e-16) + 1.30289291265291e-13) + 2.89966516878713e-11) + fs*(fs*(fs*(fs*(2.17193258571938e-23*fs + 5.91639148195952e-21) - 8.39193820717763e-18) - 3.40985414884961e-15) + 1.32740472557653e-12) + 2.90256483395592e-10;

    a3 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(2.77619078700135e-24*fs - 3.54355920155915e-21) - 2.60564268531789e-18) + 2.3197321350297e-15) + fs*(fs*(fs*(fs*(-2.74842887913133e-24*fs + 3.56364742528358e-21) + 2.91999812944046e-18) - 2.44721579573661e-15) - 1.15986606751485e-13)) + fs*(fs*(fs*(fs*(-2.80672888565836e-23*fs + 3.63811769233207e-20) + 2.97505703770311e-17) - 2.49608085155429e-14) - 1.16102593358237e-12)) + Level*(Level*fs*(fs*(fs*(fs*(2.14830127173034e-24*fs - 5.4266088697914e-22) - 7.87017396290893e-19) + 2.88852163835099e-16) + 1.15986606751485e-13) + fs*(fs*(fs*(fs*(-2.12681825901304e-24*fs + 5.80200303543955e-22) + 8.22622979638344e-19) - 3.34870612474147e-16) - 1.30289291265291e-13) + 2.89966516878713e-11) + fs*(fs*(fs*(fs*(-2.17193258571938e-23*fs + 5.91639148195952e-21) + 8.39193820717763e-18) - 3.40985414884961e-15) - 1.32740472557653e-12) + 2.90256483395592e-10;

    a4 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(-1.38809539350067e-24*fs + 5.31533880233872e-21) - 1.30282134265895e-18) - 1.15986606751485e-15) + fs*(fs*(fs*(fs*(1.37421443956567e-24*fs - 5.34547113792538e-21) + 1.45999906472023e-18) + 1.22360789786831e-15) - 1.73979910127228e-13)) + fs*(fs*(fs*(fs*(1.40336444282918e-23*fs - 5.4571765384981e-20) + 1.48752851885156e-17) + 1.24804042577715e-14) - 1.74153890037355e-12)) + Level*(Level*fs*(fs*(fs*(fs*(-1.07415063586517e-24*fs + 8.13991330468709e-22) - 3.93508698145447e-19) - 1.44426081917549e-16) + 1.73979910127228e-13) + fs*(fs*(fs*(fs*(1.06340912950652e-24*fs - 8.70300455315933e-22) + 4.11311489819172e-19) + 1.67435306237073e-16) - 1.95433936897936e-13) + 1.44983258439356e-11) + fs*(fs*(fs*(fs*(1.08596629285969e-23*fs - 8.87458722293927e-21) + 4.19596910358881e-18) + 1.70492707442481e-15) - 1.9911070883648e-12) + 1.45128241697796e-10;

    a5 = Intensity*(Level*(Level*pow(fs,2)*(fs*(fs*(2.77619078700135e-25*fs - 1.77177960077957e-21) + 1.30282134265895e-18) - 1.15986606751485e-15) + fs*(fs*(fs*(fs*(-2.74842887913133e-25*fs + 1.78182371264179e-21) - 1.45999906472023e-18) + 1.22360789786831e-15) - 5.79933033757426e-14)) + fs*(fs*(fs*(fs*(-2.80672888565836e-24*fs + 1.81905884616603e-20) - 1.48752851885156e-17) + 1.24804042577715e-14) - 5.80512966791183e-13)) + Level*(Level*fs*(fs*(fs*(fs*(2.14830127173034e-25*fs - 2.7133044348957e-22) + 3.93508698145447e-19) - 1.44426081917549e-16) + 5.79933033757426e-14) + fs*(fs*(fs*(fs*(-2.12681825901304e-25*fs + 2.90100151771978e-22) - 4.11311489819172e-19) + 1.67435306237073e-16) - 6.51446456326455e-14) + 2.89966516878713e-12) + fs*(fs*(fs*(fs*(-2.17193258571938e-24*fs + 2.95819574097976e-21) - 4.19596910358881e-18) + 1.70492707442481e-15) - 6.63702362788267e-13) + 2.90256483395592e-11;
};
