v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 50700 42500 1 0 0 gnd-1.sym
C 50300 42800 1 0 0 npn-2.sym
{
T 50900 43300 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 50700 43200 5 10 1 1 0 0 1
refdes=T2
T 50300 42800 5 10 0 1 0 0 1
value=Vt=26mV,Is=33.58fA,Bf=2365,Br=5.774
T 50900 43000 5 10 1 1 0 0 1
model-name=MPSA18
}
C 54000 43700 1 0 1 resistor-variable-2.sym
{
T 53850 44000 5 10 1 1 0 6 1
refdes=P2
T 53200 44600 5 10 0 1 180 2 1
device=VARIABLE_RESISTOR
T 52800 43400 5 10 1 1 0 0 1
value=value=100k,var=Volume
}
C 40900 44200 1 0 0 input-1.sym
{
T 40900 44500 5 10 0 0 0 0 1
device=INPUT
T 40900 44200 5 10 1 1 0 0 1
refdes=IN1
}
C 53500 45200 1 180 1 output-1.sym
{
T 53600 44900 5 10 0 0 180 6 1
device=OUTPUT
T 53700 45200 5 10 1 1 180 6 1
refdes=OUT1
}
C 55000 43500 1 0 1 gnd-1.sym
C 46100 43800 1 90 0 resistor-2.sym
{
T 45750 44200 5 10 0 0 90 0 1
device=RESISTOR
T 45800 44500 5 10 1 1 180 0 1
refdes=R3
T 45500 44100 5 10 1 1 0 0 1
value=10k
}
C 47500 43800 1 270 0 capacitor-1.sym
{
T 48200 43600 5 10 0 0 270 0 1
device=CAPACITOR
T 47600 43600 5 10 1 1 180 0 1
refdes=C2
T 48400 43600 5 10 0 0 270 0 1
symversion=0.1
T 47200 43000 5 10 1 1 0 0 1
value=0.1u
}
C 48600 44000 1 180 0 capacitor-1.sym
{
T 48400 43300 5 10 0 0 180 0 1
device=CAPACITOR
T 47800 43900 5 10 1 1 0 0 1
refdes=C3
T 48400 43100 5 10 0 0 180 0 1
symversion=0.1
T 48700 44100 5 10 1 1 180 0 1
value=0.05u
}
C 45500 42800 1 0 0 npn-2.sym
{
T 46100 43300 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 45900 43300 5 10 1 1 0 0 1
refdes=T1
T 45500 42800 5 10 0 1 0 0 1
value=Vt=26mV,Is=33.58fA,Bf=2365,Br=5.774
T 46000 43000 5 10 1 1 0 0 1
model-name=MPSA18
}
C 41400 42900 1 90 0 resistor-2.sym
{
T 41050 43300 5 10 0 0 90 0 1
device=RESISTOR
T 41100 43600 5 10 1 1 180 0 1
refdes=R1
T 40700 43200 5 10 1 1 0 0 1
value=100k
}
C 47800 42600 1 0 1 gnd-1.sym
C 45000 43900 1 180 0 resistor-2.sym
{
T 44600 43550 5 10 0 0 180 0 1
device=RESISTOR
T 44300 44000 5 10 1 1 0 0 1
refdes=R2
T 44900 43600 5 10 1 1 180 0 1
value=2.2M
}
C 50100 43900 1 180 0 resistor-2.sym
{
T 49700 43550 5 10 0 0 180 0 1
device=RESISTOR
T 49400 44000 5 10 1 1 0 0 1
refdes=R4
T 50100 43600 5 10 1 1 180 0 1
value=2.2M
}
C 41400 42600 1 0 1 gnd-1.sym
C 46100 42500 1 0 1 gnd-1.sym
C 43100 44000 1 180 0 capacitor-1.sym
{
T 42900 43300 5 10 0 0 180 0 1
device=CAPACITOR
T 42300 43900 5 10 1 1 0 0 1
refdes=C1
T 42900 43100 5 10 0 0 180 0 1
symversion=0.1
T 43100 44000 5 10 1 1 180 0 1
value=0.1u
}
C 42200 43700 1 0 1 resistor-variable-2.sym
{
T 41400 44600 5 10 0 1 180 2 1
device=VARIABLE_RESISTOR
T 42050 44000 5 10 1 1 0 6 1
refdes=P1
T 41500 43400 5 10 1 1 0 0 1
value=value=100k,var=Intensity,inv=1
}
C 45800 44700 1 0 0 9V-plus-1.sym
{
T 45800 44700 5 10 0 0 0 0 1
device=POWER
T 46100 44700 5 10 1 1 0 0 1
value=9V
T 45800 45100 5 10 1 1 0 0 1
refdes=Vcc
}
N 44100 43800 43100 43800 4
N 45000 43800 47700 43800 4
N 44100 43800 44100 43300 4
N 44100 43300 45500 43300 4
N 49200 43800 48600 43800 4
N 50100 43800 52200 43800 4
N 49200 43800 49200 43300 4
N 49200 43300 50300 43300 4
C 52000 43800 1 270 0 capacitor-1.sym
{
T 52700 43600 5 10 0 0 270 0 1
device=CAPACITOR
T 52900 43600 5 10 0 0 270 0 1
symversion=0.1
T 52100 43600 5 10 1 1 180 0 1
refdes=C4
T 51700 43000 5 10 1 1 0 0 1
value=0.1u
}
C 53100 44000 1 180 0 capacitor-1.sym
{
T 52900 43300 5 10 0 0 180 0 1
device=CAPACITOR
T 52900 43100 5 10 0 0 180 0 1
symversion=0.1
T 52300 43900 5 10 1 1 0 0 1
refdes=C5
T 53200 44100 5 10 1 1 180 0 1
value=0.1u
}
C 52300 42600 1 0 1 gnd-1.sym
N 53500 45100 53500 44300 4
C 53300 44400 1 0 1 gnd-1.sym
C 52300 44800 1 180 0 resistor-2.sym
{
T 51900 44450 5 10 0 0 180 0 1
device=RESISTOR
T 51600 44900 5 10 1 1 0 0 1
refdes=R5
T 52200 44500 5 10 1 1 180 0 1
value=4.7k
}
N 51400 44700 46000 44700 4
C 50900 43800 1 90 0 resistor-2.sym
{
T 50550 44200 5 10 0 0 90 0 1
device=RESISTOR
T 50600 44500 5 10 1 1 180 0 1
refdes=R6
T 50300 44100 5 10 1 1 0 0 1
value=10k
}
C 52300 44500 1 0 0 diode-1.sym
{
T 52700 45100 5 10 0 0 0 0 1
device=DIODE2
T 52600 45000 5 10 1 1 0 0 1
refdes=D1
T 52300 44500 5 10 0 0 0 0 1
value=Is=10e-15,mUt=30e-3
}
C 54900 43900 1 180 0 resistor-2.sym
{
T 54500 43550 5 10 0 0 180 0 1
device=RESISTOR
T 54100 43900 5 10 1 1 0 0 1
refdes=R7
T 54800 44100 5 10 1 1 180 0 1
value=1k
}
C 54400 44600 1 180 0 resistor-2.sym
{
T 54000 44250 5 10 0 0 180 0 1
device=RESISTOR
T 53700 44700 5 10 1 1 0 0 1
refdes=R8
T 54300 44800 5 10 1 1 180 0 1
value=1M
}
C 54500 44200 1 0 1 gnd-1.sym
