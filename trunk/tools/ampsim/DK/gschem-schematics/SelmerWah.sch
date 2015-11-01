v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 49100 42600 1 180 0 capacitor-1.sym
{
T 48900 41900 5 10 0 0 180 0 1
device=CAPACITOR
T 48300 42500 5 10 1 1 0 0 1
refdes=C4
T 48900 41700 5 10 0 0 180 0 1
symversion=0.1
T 49000 42900 5 10 1 1 180 0 1
value=0.01u
}
C 50900 43600 1 0 0 gnd-1.sym
C 48600 42900 1 0 0 npn-2.sym
{
T 49200 43400 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 49200 43300 5 10 1 1 0 0 1
refdes=T2
T 48600 42900 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 49300 43000 5 10 1 1 0 0 1
model-name=2N5088
}
C 40700 44300 1 0 0 input-1.sym
{
T 40700 44600 5 10 0 0 0 0 1
device=INPUT
T 40700 44300 5 10 1 1 0 0 1
refdes=IN1
}
C 51000 45600 1 180 1 output-1.sym
{
T 51100 45300 5 10 0 0 180 6 1
device=OUTPUT
T 51200 45600 5 10 1 1 180 6 1
refdes=OUT1
}
C 46400 42300 1 90 1 capacitor-2.sym
{
T 45700 42100 5 10 0 0 270 2 1
device=POLARIZED_CAPACITOR
T 45900 42000 5 10 1 1 0 6 1
refdes=C2
T 45500 42100 5 10 0 0 270 2 1
symversion=0.1
T 46600 41500 5 10 1 1 0 6 1
value=10u
}
C 43700 42200 1 90 0 resistor-2.sym
{
T 43350 42600 5 10 0 0 90 0 1
device=RESISTOR
T 43400 42900 5 10 1 1 180 0 1
refdes=R2
T 43100 42500 5 10 1 1 0 0 1
value=1.5k
}
C 44600 43000 1 90 0 resistor-2.sym
{
T 44250 43400 5 10 0 0 90 0 1
device=RESISTOR
T 44300 43800 5 10 1 1 180 0 1
refdes=R3
T 44000 43300 5 10 1 1 0 0 1
value=470
}
C 47100 45700 1 180 0 capacitor-1.sym
{
T 46900 45000 5 10 0 0 180 0 1
device=CAPACITOR
T 46300 45600 5 10 1 1 0 0 1
refdes=C3
T 46900 44800 5 10 0 0 180 0 1
symversion=0.1
T 47200 45800 5 10 1 1 180 0 1
value=0.22u
}
C 44000 43900 1 0 0 npn-2.sym
{
T 44600 44400 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 44400 44400 5 10 1 1 0 0 1
refdes=T1
T 44000 43900 5 10 0 1 0 0 1
value=Vt=26mV,Is=20.3fA,Bf=1430,Br=4
T 44500 44200 5 10 1 1 0 0 1
model-name=2N5088
}
C 44600 45500 1 90 0 resistor-2.sym
{
T 44250 45900 5 10 0 0 90 0 1
device=RESISTOR
T 44300 46200 5 10 1 1 180 0 1
refdes=R4
T 43900 45800 5 10 1 1 0 0 1
value=27k
}
C 46300 41100 1 0 1 gnd-1.sym
C 43600 44500 1 180 0 resistor-2.sym
{
T 43200 44150 5 10 0 0 180 0 1
device=RESISTOR
T 42900 44600 5 10 1 1 0 0 1
refdes=R1
T 43500 44200 5 10 1 1 180 0 1
value=21k
}
C 47100 45100 1 180 0 resistor-2.sym
{
T 46700 44750 5 10 0 0 180 0 1
device=RESISTOR
T 46400 44700 5 10 1 1 0 0 1
refdes=R5
T 47000 44800 5 10 1 1 180 0 1
value=470k
}
C 46300 42400 1 90 0 resistor-2.sym
{
T 45950 42800 5 10 0 0 90 0 1
device=RESISTOR
T 46000 43200 5 10 1 1 180 0 1
refdes=R6
T 45700 42700 5 10 1 1 0 0 1
value=470k
}
C 49200 41200 1 0 1 gnd-1.sym
C 49200 41500 1 90 0 resistor-2.sym
{
T 48850 41900 5 10 0 0 90 0 1
device=RESISTOR
T 49500 42200 5 10 1 1 180 0 1
refdes=R7
T 49200 41700 5 10 1 1 0 0 1
value=10k
}
C 44600 42700 1 0 1 gnd-1.sym
C 42600 44600 1 180 0 capacitor-1.sym
{
T 42400 43900 5 10 0 0 180 0 1
device=CAPACITOR
T 41800 44500 5 10 1 1 0 0 1
refdes=C1
T 42400 43700 5 10 0 0 180 0 1
symversion=0.1
T 42600 44600 5 10 1 1 180 0 1
value=0.01u
}
C 51100 44800 1 90 1 resistor-variable-2.sym
{
T 50200 44000 5 10 0 1 270 2 1
device=VARIABLE_RESISTOR
T 51450 44400 5 10 1 1 0 6 1
refdes=P1
T 51300 43900 5 10 1 1 0 0 1
value=value=100k,var=Wah
}
C 44300 46400 1 0 0 9V-plus-1.sym
{
T 44300 46400 5 10 0 0 0 0 1
device=POWER
T 44600 46400 5 10 1 1 0 0 1
value=9V
T 44300 46800 5 10 1 1 0 0 1
refdes=Vcc
}
C 46400 42500 1 180 1 inductor-1.sym
{
T 46600 42000 5 10 0 0 0 2 1
device=INDUCTOR
T 46700 42300 5 10 1 1 0 2 1
refdes=L1
T 46600 41800 5 10 0 0 0 2 1
symversion=0.1
T 46400 42500 5 10 0 0 0 2 1
value=0.5H
}
N 43600 43100 43600 44400 4
N 44000 44400 43600 44400 4
N 44500 45500 44500 44900 4
N 46200 45500 44500 45500 4
N 46200 43300 46200 45500 4
N 46400 42400 46200 42400 4
C 48200 42500 1 180 0 resistor-2.sym
{
T 47800 42150 5 10 0 0 180 0 1
device=RESISTOR
T 47500 42100 5 10 1 1 0 0 1
refdes=RL
T 48100 42200 5 10 1 1 180 0 1
value=60
}
N 49100 42900 49100 42400 4
C 48000 45200 1 180 0 capacitor-1.sym
{
T 47800 44500 5 10 0 0 180 0 1
device=CAPACITOR
T 47200 45100 5 10 1 1 0 0 1
refdes=C5
T 47800 44300 5 10 0 0 180 0 1
symversion=0.1
T 48100 45300 5 10 1 1 180 0 1
value=0.1u
}
N 44500 46400 49100 46400 4
N 49100 46400 49100 43900 4
N 47100 45000 47100 43400 4
N 47100 43400 48600 43400 4
N 43600 42200 43600 40700 4
N 43600 40700 48200 40700 4
N 48200 40700 48200 42400 4
N 48000 45000 50500 45000 4
N 50500 45000 50500 44300 4
N 47100 45500 51000 45500 4
N 51000 45500 51000 44800 4
N 41500 44400 41700 44400 4
{
T 41500 44400 5 10 1 1 0 0 1
netname=V1
}
N 42600 44400 42700 44400 4
{
T 42600 44400 5 10 1 1 0 0 1
netname=V2
}
N 46200 42300 46200 42400 4
{
T 46200 42300 5 10 1 1 0 0 1
netname=V6
}
