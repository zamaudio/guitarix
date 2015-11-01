// generated automatically
// DO NOT MODIFY!
declare id "foxwah";
declare name "Foxx Wah";
declare category "Guitar Effects";
declare shortname "Foxx Wah";
declare description "Foxx Wah";

import("filter.lib");
import("effect.lib");
import("oscillator.lib");
import("guitarix.lib");

process(x) = x : _<:*(dry),(*(wet) : pre : iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0),(a1/a0,a2/a0,a3/a0,a4/a0))):>_ with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    wet = wah_ctrl.wet_dry;
    dry = 1 - wet;
    pre = dcblockerat(228.232162503);

    Wah1 = (x : amp_follower_ud(0.01,0.1) : min(0.98) : max(0.02) : Inverted(1)): smooth(s);

    Wah2 = wah_ctrl.wah : max(0.01) : LogPot(5) : smooth(s);
 
    sl = wah_ctrl.mode;

    Wah3 = (oscs(freq) + 1) / 2 : min(0.98) : max(0.02) : Inverted(1) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);
    
    b0 = Wah*(Wah*pow(fs,2)*(fs*(1.83199828084009e-21*fs + 4.37177575394138e-17) + 5.9658637492238e-14) + fs*(fs*(fs*(-2.03749178510912e-21*fs - 4.85447818408113e-17) - 6.52701543961359e-14) + 1.41209804493283e-12)) + fs*(fs*(fs*(-7.06526492747902e-21*fs - 2.33820876003629e-16) - 3.26825644515106e-13) - 3.24292143859646e-12);

    b1 = Wah*(Wah*pow(fs,3)*(-7.32799312336037e-21*fs - 8.74355150788276e-17) + fs*(pow(fs,2)*(8.14996714043648e-21*fs + 9.70895636816225e-17) + 2.82419608986565e-12)) + fs*(pow(fs,2)*(2.82610597099161e-20*fs + 4.67641752007259e-16) - 6.48584287719292e-12);

    b2 = Wah*(Wah*pow(fs,2)*(1.09919896850405e-20*pow(fs,2) - 1.19317274984476e-13) + pow(fs,2)*(-1.22249507106547e-20*pow(fs,2) + 1.30540308792272e-13)) + pow(fs,2)*(-4.23915895648741e-20*pow(fs,2) + 6.53651289030211e-13);

    b3 = Wah*(Wah*pow(fs,3)*(-7.32799312336037e-21*fs + 8.74355150788276e-17) + fs*(pow(fs,2)*(8.14996714043648e-21*fs - 9.70895636816225e-17) - 2.82419608986565e-12)) + fs*(pow(fs,2)*(2.82610597099161e-20*fs - 4.67641752007259e-16) + 6.48584287719292e-12);

    b4 = Wah*(Wah*pow(fs,2)*(fs*(1.83199828084009e-21*fs - 4.37177575394138e-17) + 5.9658637492238e-14) + fs*(fs*(fs*(-2.03749178510912e-21*fs + 4.85447818408113e-17) - 6.52701543961359e-14) - 1.41209804493283e-12)) + fs*(fs*(fs*(-7.06526492747902e-21*fs + 2.33820876003629e-16) - 3.26825644515106e-13) + 3.24292143859646e-12);

    a0 = Wah*(Wah*pow(fs,2)*(fs*(-5.27939482245346e-20*fs - 3.84581222788281e-18) - 4.45118937547182e-14) + fs*(fs*(fs*(-2.11837046611975e-19*fs - 1.50671579237021e-18) + 5.84262202161266e-14) - 1.12403772107874e-12)) + fs*(fs*(fs*(3.06896988210923e-19*fs + 2.40276998984285e-17) + 2.93439745158876e-13) + 8.49404844378593e-12) + 2.83847909363319e-11;

    a1 = Wah*(Wah*pow(fs,3)*(2.11175792898138e-19*fs + 7.69162445576562e-18) + fs*(pow(fs,2)*(8.473481864479e-19*fs + 3.01343158474042e-18) - 2.24807544215749e-12)) + fs*(pow(fs,2)*(-1.22758795284369e-18*fs - 4.80553997968569e-17) + 1.69880968875719e-11) + 1.13539163745328e-10;

    a2 = Wah*(Wah*pow(fs,2)*(-3.16763689347207e-19*pow(fs,2) + 8.90237875094365e-14) + pow(fs,2)*(-1.27102227967185e-18*pow(fs,2) - 1.16852440432253e-13)) + pow(fs,2)*(1.84138192926554e-18*pow(fs,2) - 5.86879490317752e-13) + 1.70308745617991e-10;

    a3 = Wah*(Wah*pow(fs,3)*(2.11175792898138e-19*fs - 7.69162445576562e-18) + fs*(pow(fs,2)*(8.473481864479e-19*fs - 3.01343158474042e-18) + 2.24807544215749e-12)) + fs*(pow(fs,2)*(-1.22758795284369e-18*fs + 4.80553997968569e-17) - 1.69880968875719e-11) + 1.13539163745328e-10;

    a4 = Wah*(Wah*pow(fs,2)*(fs*(-5.27939482245346e-20*fs + 3.84581222788281e-18) - 4.45118937547182e-14) + fs*(fs*(fs*(-2.11837046611975e-19*fs + 1.50671579237021e-18) + 5.84262202161266e-14) + 1.12403772107874e-12)) + fs*(fs*(fs*(3.06896988210923e-19*fs - 2.40276998984285e-17) + 2.93439745158876e-13) - 8.49404844378593e-12) + 2.83847909363319e-11;
};
