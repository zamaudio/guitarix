v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 43600 43200 1 90 0 resistor-2.sym
{
T 43250 43600 5 10 0 0 90 0 1
device=RESISTOR
T 44000 43900 5 10 1 1 180 0 1
refdes=R4
T 43700 43400 5 10 1 1 0 0 1
value=1.8k
}
C 47500 45500 1 180 0 capacitor-1.sym
{
T 47300 44800 5 10 0 0 180 0 1
device=CAPACITOR
T 46700 45400 5 10 1 1 0 0 1
refdes=C5
T 47300 44600 5 10 0 0 180 0 1
symversion=0.1
T 47600 45600 5 10 1 1 180 0 1
value=10u
}
C 47600 42800 1 0 1 gnd-1.sym
C 45200 42800 1 0 0 gnd-1.sym
C 44800 44000 1 0 0 npn-2.sym
{
T 45400 44500 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 45200 44400 5 10 1 1 0 0 1
refdes=T2
T 44800 44000 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 45400 44200 5 10 1 1 0 0 1
model-name=2N5088
}
C 49500 43900 1 0 0 npn-2.sym
{
T 50100 44400 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 49800 44300 5 10 1 1 0 0 1
refdes=T3
T 49500 43900 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 50100 44100 5 10 1 1 0 0 1
model-name=2N5088
}
C 60700 42900 1 270 1 resistor-variable-2.sym
{
T 60350 43200 5 10 1 1 180 6 1
refdes=P2
T 61600 43700 5 10 0 1 90 2 1
device=VARIABLE_RESISTOR
T 63100 43100 5 10 1 1 180 0 1
value=value=50k,var=Balance
}
C 39100 44500 1 0 0 input-1.sym
{
T 39100 44800 5 10 0 0 0 0 1
device=INPUT
T 39100 44500 5 10 1 1 0 0 1
refdes=IN1
}
C 66200 44000 1 180 1 output-1.sym
{
T 66300 43700 5 10 0 0 180 6 1
device=OUTPUT
T 66400 44000 5 10 1 1 180 6 1
refdes=OUT1
}
C 50100 42700 1 0 1 gnd-1.sym
C 41800 42600 1 90 0 resistor-2.sym
{
T 41450 43000 5 10 0 0 90 0 1
device=RESISTOR
T 41500 43300 5 10 1 1 180 0 1
refdes=R2
T 41200 42900 5 10 1 1 0 0 1
value=100k
}
C 42800 43200 1 90 0 resistor-2.sym
{
T 42450 43600 5 10 0 0 90 0 1
device=RESISTOR
T 42500 44000 5 10 1 1 180 0 1
refdes=R3
T 42200 43500 5 10 1 1 0 0 1
value=100k
}
C 44600 46000 1 270 0 capacitor-1.sym
{
T 45300 45800 5 10 0 0 270 0 1
device=CAPACITOR
T 44700 45800 5 10 1 1 180 0 1
refdes=C2
T 45500 45800 5 10 0 0 270 0 1
symversion=0.1
T 44300 45200 5 10 1 1 0 0 1
value=0.001u
}
C 51700 45100 1 180 0 capacitor-1.sym
{
T 51500 44400 5 10 0 0 180 0 1
device=CAPACITOR
T 50900 45000 5 10 1 1 0 0 1
refdes=C6
T 51500 44200 5 10 0 0 180 0 1
symversion=0.1
T 51800 45200 5 10 1 1 180 0 1
value=10u
}
C 44300 42600 1 270 0 capacitor-1.sym
{
T 45000 42400 5 10 0 0 270 0 1
device=CAPACITOR
T 44400 42500 5 10 1 1 180 0 1
refdes=C3
T 45200 42400 5 10 0 0 270 0 1
symversion=0.1
T 44600 41800 5 10 1 1 0 0 1
value=0.1u
}
C 49200 42700 1 0 1 gnd-1.sym
C 43000 44100 1 0 0 npn-2.sym
{
T 43600 44600 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 43400 44600 5 10 1 1 0 0 1
refdes=T1
T 43000 44100 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 43500 44400 5 10 1 1 0 0 1
model-name=2N5088
}
C 50100 43000 1 90 0 resistor-2.sym
{
T 49750 43400 5 10 0 0 90 0 1
device=RESISTOR
T 50700 43600 5 10 1 1 180 0 1
refdes=R12
T 50200 43200 5 10 1 1 0 0 1
value=10k
}
C 43600 42900 1 0 1 gnd-1.sym
C 57900 45000 1 180 0 capacitor-1.sym
{
T 57700 44300 5 10 0 0 180 0 1
device=CAPACITOR
T 57100 44900 5 10 1 1 0 0 1
refdes=C9
T 57700 44100 5 10 0 0 180 0 1
symversion=0.1
T 57900 45000 5 10 1 1 180 0 1
value=10u
}
C 41700 44700 1 180 0 resistor-2.sym
{
T 41300 44350 5 10 0 0 180 0 1
device=RESISTOR
T 41000 44800 5 10 1 1 0 0 1
refdes=R1
T 41600 44400 5 10 1 1 180 0 1
value=220k
}
C 45400 42700 1 180 0 resistor-2.sym
{
T 45000 42350 5 10 0 0 180 0 1
device=RESISTOR
T 44700 42300 5 10 1 1 0 0 1
refdes=R8
T 45300 42400 5 10 1 1 180 0 1
value=47k
}
C 43600 45100 1 90 0 resistor-2.sym
{
T 43250 45500 5 10 0 0 90 0 1
device=RESISTOR
T 43300 45900 5 10 1 1 180 0 1
refdes=R5
T 43000 45400 5 10 1 1 0 0 1
value=47k
}
C 52700 42700 1 0 1 gnd-1.sym
C 45400 43100 1 90 0 resistor-2.sym
{
T 45050 43500 5 10 0 0 90 0 1
device=RESISTOR
T 45700 43800 5 10 1 1 180 0 1
refdes=R6
T 45400 43300 5 10 1 1 0 0 1
value=10k
}
C 49200 43000 1 90 0 resistor-2.sym
{
T 48850 43400 5 10 0 0 90 0 1
device=RESISTOR
T 49500 43700 5 10 1 1 180 0 1
refdes=R9
T 49300 43100 5 10 1 1 0 0 1
value=150k
}
C 42800 42900 1 0 1 gnd-1.sym
C 49200 45100 1 90 0 resistor-2.sym
{
T 48850 45500 5 10 0 0 90 0 1
device=RESISTOR
T 49600 45800 5 10 1 1 180 0 1
refdes=R10
T 49300 45200 5 10 1 1 0 0 1
value=220k
}
C 50100 45100 1 90 0 resistor-2.sym
{
T 49750 45500 5 10 0 0 90 0 1
device=RESISTOR
T 50400 45800 5 10 1 1 180 0 1
refdes=R11
T 50200 45200 5 10 1 1 0 0 1
value=10k
}
C 40800 44800 1 180 0 capacitor-1.sym
{
T 40600 44100 5 10 0 0 180 0 1
device=CAPACITOR
T 40000 44700 5 10 1 1 0 0 1
refdes=C1
T 40600 43900 5 10 0 0 180 0 1
symversion=0.1
T 40800 44800 5 10 1 1 180 0 1
value=10u
}
C 52700 45100 1 90 0 resistor-2.sym
{
T 52350 45500 5 10 0 0 90 0 1
device=RESISTOR
T 53100 45800 5 10 1 1 180 0 1
refdes=R15
T 52800 45200 5 10 1 1 0 0 1
value=100k
}
C 47400 43900 1 270 1 resistor-variable-2.sym
{
T 48300 44700 5 10 0 1 90 2 1
device=VARIABLE_RESISTOR
T 47150 44600 5 10 1 1 180 6 1
refdes=P1
T 48700 44000 5 10 1 1 180 0 1
value=value=50k,var=Expander
}
C 44600 41400 1 0 1 gnd-1.sym
C 56300 45100 1 90 0 resistor-2.sym
{
T 55950 45500 5 10 0 0 90 0 1
device=RESISTOR
T 56700 45700 5 10 1 1 180 0 1
refdes=R18
T 56400 45200 5 10 1 1 0 0 1
value=100k
}
C 66000 46000 1 0 0 9V-plus-1.sym
{
T 66000 46000 5 10 0 0 0 0 1
device=POWER
T 66300 46000 5 10 1 1 0 0 1
value=9V
T 66000 46400 5 10 1 1 0 0 1
refdes=Vcc
}
N 41700 43500 41700 44600 4
N 41700 44600 43000 44600 4
N 42700 44100 42700 44600 4
N 43500 45100 44800 45100 4
N 44800 45100 44800 44500 4
C 44600 42600 1 90 0 resistor-2.sym
{
T 44250 43000 5 10 0 0 90 0 1
device=RESISTOR
T 44900 43300 5 10 1 1 180 0 1
refdes=R7
T 44600 42800 5 10 1 1 0 0 1
value=470k
}
N 41700 42600 44500 42600 4
N 44500 43500 44500 44000 4
N 44500 44000 46400 44000 4
C 46200 43500 1 270 0 capacitor-1.sym
{
T 46900 43300 5 10 0 0 270 0 1
device=CAPACITOR
T 46300 43400 5 10 1 1 180 0 1
refdes=C4
T 47100 43300 5 10 0 0 270 0 1
symversion=0.1
T 46500 42700 5 10 1 1 0 0 1
value=10u
}
N 45400 42600 46400 42600 4
N 46400 43500 46400 45300 4
N 47500 44800 47500 45300 4
N 47500 43100 47500 43900 4
N 49500 44400 48000 44400 4
N 46600 45300 46400 45300 4
N 49100 45100 49100 44400 4
N 49100 44400 49100 43900 4
N 43500 46000 66200 46000 4
N 50000 45100 50000 44900 4
C 51700 44100 1 180 0 capacitor-1.sym
{
T 51500 43400 5 10 0 0 180 0 1
device=CAPACITOR
T 50900 44000 5 10 1 1 0 0 1
refdes=C7
T 51500 43200 5 10 0 0 180 0 1
symversion=0.1
T 51800 44200 5 10 1 1 180 0 1
value=10u
}
N 50000 43900 50800 43900 4
N 50800 44900 50000 44900 4
C 53500 42600 1 0 1 gnd-1.sym
C 52600 45000 1 180 0 resistor-2.sym
{
T 52200 44650 5 10 0 0 180 0 1
device=RESISTOR
T 51900 45100 5 10 1 1 0 0 1
refdes=R13
T 52500 44700 5 10 1 1 180 0 1
value=470
}
C 51800 42600 1 90 0 resistor-2.sym
{
T 51450 43000 5 10 0 0 90 0 1
device=RESISTOR
T 52400 43200 5 10 1 1 180 0 1
refdes=R14
T 51900 42800 5 10 1 1 0 0 1
value=470
}
C 52900 43800 1 0 0 npn-2.sym
{
T 53500 44300 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 53200 44200 5 10 1 1 0 0 1
refdes=T4
T 52900 43800 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 53500 44000 5 10 1 1 0 0 1
model-name=2N5088
}
N 52600 43900 52600 45100 4
C 52700 43000 1 90 0 resistor-2.sym
{
T 52350 43400 5 10 0 0 90 0 1
device=RESISTOR
T 53100 43700 5 10 1 1 180 0 1
refdes=R16
T 52800 43100 5 10 1 1 0 0 1
value=22k
}
N 51700 43500 51700 43900 4
N 52900 44300 52600 44300 4
C 53500 42900 1 90 0 resistor-2.sym
{
T 53150 43300 5 10 0 0 90 0 1
device=RESISTOR
T 53900 43600 5 10 1 1 180 0 1
refdes=R17
T 53600 43000 5 10 1 1 0 0 1
value=1.8k
}
C 55600 43800 1 0 1 npn-2.sym
{
T 55000 44300 5 10 0 0 0 6 1
device=NPN_TRANSISTOR
T 55300 44200 5 10 1 1 0 6 1
refdes=T5
T 55600 43800 5 10 0 1 0 6 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 55000 44000 5 10 1 1 0 6 1
model-name=2N5088
}
C 54400 45100 1 90 0 resistor-2.sym
{
T 54050 45500 5 10 0 0 90 0 1
device=RESISTOR
T 54800 45800 5 10 1 1 180 0 1
refdes=R27
T 54500 45200 5 10 1 1 0 0 1
value=10k
}
N 53400 44800 57000 44800 4
N 54300 45100 54300 44800 4
N 53400 43800 55100 43800 4
C 54900 43800 1 270 0 capacitor-1.sym
{
T 55600 43600 5 10 0 0 270 0 1
device=CAPACITOR
T 55000 43700 5 10 1 1 180 0 1
refdes=C13
T 55800 43600 5 10 0 0 270 0 1
symversion=0.1
T 55200 43000 5 10 1 1 0 0 1
value=10u
}
C 55200 42600 1 0 1 gnd-1.sym
C 56300 42900 1 90 0 resistor-2.sym
{
T 55950 43300 5 10 0 0 90 0 1
device=RESISTOR
T 56700 43500 5 10 1 1 180 0 1
refdes=R19
T 56400 43000 5 10 1 1 0 0 1
value=22k
}
N 56200 45100 56200 43800 4
N 55600 44300 56200 44300 4
C 56300 42600 1 0 1 gnd-1.sym
N 51700 42600 51700 42100 4
N 51700 42100 57100 42100 4
N 57100 42100 57100 44300 4
N 57100 44300 56200 44300 4
C 59600 45000 1 180 0 capacitor-1.sym
{
T 59400 44300 5 10 0 0 180 0 1
device=CAPACITOR
T 58800 44900 5 10 1 1 0 0 1
refdes=C10
T 59400 44100 5 10 0 0 180 0 1
symversion=0.1
T 59600 45000 5 10 1 1 180 0 1
value=10u
}
C 58900 43900 1 90 0 diode-1.sym
{
T 58300 44300 5 10 0 0 90 0 1
device=DIODE
T 58400 44200 5 10 1 1 90 0 1
refdes=D1
T 58900 43900 5 10 0 0 0 0 1
value=Is=10e-12,mUt=30e-3
}
C 58100 43900 1 90 0 diode-3.sym
{
T 57550 44350 5 10 0 0 90 0 1
device=DIODE
T 57650 44250 5 10 1 1 90 0 1
refdes=D2
T 58100 43900 5 10 0 0 0 0 1
value=Is=10e-12,mUt=30e-3
}
C 58000 43600 1 0 1 gnd-1.sym
C 58800 43600 1 0 1 gnd-1.sym
N 57900 44800 58700 44800 4
N 45300 45000 45300 46000 4
C 59700 43900 1 90 0 resistor-2.sym
{
T 59350 44300 5 10 0 0 90 0 1
device=RESISTOR
T 60100 44500 5 10 1 1 180 0 1
refdes=R20
T 59800 44000 5 10 1 1 0 0 1
value=47k
}
C 59700 43000 1 90 0 resistor-2.sym
{
T 59350 43400 5 10 0 0 90 0 1
device=RESISTOR
T 60100 43600 5 10 1 1 180 0 1
refdes=R21
T 59800 43100 5 10 1 1 0 0 1
value=10k
}
C 59700 42700 1 0 1 gnd-1.sym
C 60900 42600 1 0 1 gnd-1.sym
N 59600 43900 60800 43900 4
N 60800 43900 60800 43800 4
C 63500 43600 1 180 0 capacitor-1.sym
{
T 63300 42900 5 10 0 0 180 0 1
device=CAPACITOR
T 62700 43500 5 10 1 1 0 0 1
refdes=C11
T 63300 42700 5 10 0 0 180 0 1
symversion=0.1
T 63500 43600 5 10 1 1 180 0 1
value=10u
}
N 62600 43400 61300 43400 4
C 64100 42900 1 0 0 npn-2.sym
{
T 64700 43400 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 64400 43300 5 10 1 1 0 0 1
refdes=T6
T 64100 42900 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 64700 43100 5 10 1 1 0 0 1
model-name=2N5088
}
C 63600 45100 1 90 0 resistor-2.sym
{
T 63250 45500 5 10 0 0 90 0 1
device=RESISTOR
T 64000 45700 5 10 1 1 180 0 1
refdes=R22
T 63700 45200 5 10 1 1 0 0 1
value=100k
}
N 63500 43000 63500 45100 4
C 63600 42100 1 90 0 resistor-2.sym
{
T 63250 42500 5 10 0 0 90 0 1
device=RESISTOR
T 64000 42700 5 10 1 1 180 0 1
refdes=R23
T 63700 42200 5 10 1 1 0 0 1
value=15k
}
C 63600 41800 1 0 1 gnd-1.sym
N 64100 43400 63500 43400 4
C 64700 45100 1 90 0 resistor-2.sym
{
T 64350 45500 5 10 0 0 90 0 1
device=RESISTOR
T 65100 45700 5 10 1 1 180 0 1
refdes=R24
T 64800 45200 5 10 1 1 0 0 1
value=10k
}
N 64600 45100 64600 43900 4
C 64700 42000 1 90 0 resistor-2.sym
{
T 64350 42400 5 10 0 0 90 0 1
device=RESISTOR
T 65100 42600 5 10 1 1 180 0 1
refdes=R25
T 64800 42100 5 10 1 1 0 0 1
value=1k
}
C 66200 44100 1 180 0 capacitor-1.sym
{
T 66000 43400 5 10 0 0 180 0 1
device=CAPACITOR
T 65400 44000 5 10 1 1 0 0 1
refdes=C12
T 66000 43200 5 10 0 0 180 0 1
symversion=0.1
T 66200 44100 5 10 1 1 180 0 1
value=10u
}
N 65300 43900 64600 43900 4
C 66300 42000 1 90 0 resistor-2.sym
{
T 65950 42400 5 10 0 0 90 0 1
device=RESISTOR
T 66700 42600 5 10 1 1 180 0 1
refdes=R26
T 66400 42100 5 10 1 1 0 0 1
value=100k
}
N 66200 42900 66200 43900 4
C 64700 41700 1 0 1 gnd-1.sym
C 66300 41700 1 0 1 gnd-1.sym
C 66000 46000 1 270 0 capacitor-1.sym
{
T 66700 45800 5 10 0 0 270 0 1
device=CAPACITOR
T 66100 45900 5 10 1 1 180 0 1
refdes=C8
T 66900 45800 5 10 0 0 270 0 1
symversion=0.1
T 66300 45200 5 10 1 1 0 0 1
value=10u
}
C 66300 44800 1 0 1 gnd-1.sym
