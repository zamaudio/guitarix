v 20121123 2
C 40000 40000 0 0 0 title-B.sym
C 40600 44800 1 0 0 input-1.sym
{
T 40600 45100 5 10 0 0 0 0 1
device=INPUT
}
C 42300 44700 1 0 0 capacitor-1.sym
{
T 42500 45400 5 10 0 0 0 0 1
device=CAPACITOR
T 42500 45200 5 10 1 1 0 0 1
refdes=C1
T 42500 45600 5 10 0 0 0 0 1
symversion=0.1
T 42600 44500 5 10 1 1 0 0 1
value=22n
}
C 41600 44600 1 0 0 triode.sym
{
T 44100 47300 5 10 1 1 0 0 1
refdes=U1a
T 44000 46700 5 10 0 1 0 0 1
device=TRIODE
}
C 47400 44600 1 0 1 triode.sym
{
T 44900 47300 5 10 1 1 0 6 1
refdes=U1b
T 45000 46700 5 10 0 1 0 6 1
device=TRIODE
}
C 44400 45800 1 270 0 resistor-2.sym
{
T 44750 45400 5 10 0 0 270 0 1
device=RESISTOR
T 44700 45600 5 10 1 1 270 0 1
refdes=R3
T 44700 45300 5 10 1 1 270 0 1
value=470
}
N 44200 45900 44800 45900 4
N 44500 45800 44500 45900 4
C 43400 44800 1 0 0 resistor-2.sym
{
T 43800 45150 5 10 0 0 0 0 1
device=RESISTOR
T 43600 45000 5 10 1 1 0 0 1
refdes=R2
T 43900 45100 5 10 1 1 0 0 1
value=1M
}
N 43200 46600 43200 44900 4
N 44300 44900 44700 44900 4
N 43200 44900 43400 44900 4
C 44700 44800 1 0 0 resistor-2.sym
{
T 45100 45150 5 10 0 0 0 0 1
device=RESISTOR
T 44900 45100 5 10 1 1 0 0 1
refdes=R4
T 45200 45100 5 10 1 1 0 0 1
value=1M
}
C 44400 44500 1 270 0 resistor-2.sym
{
T 44750 44100 5 10 0 0 270 0 1
device=RESISTOR
T 44700 44300 5 10 1 1 270 0 1
refdes=R5
T 44700 44000 5 10 1 1 270 0 1
value=10k
}
C 45600 44100 1 270 0 capacitor-1.sym
{
T 46300 43900 5 10 0 0 270 0 1
device=CAPACITOR
T 45900 43800 5 10 1 1 0 0 1
refdes=C2
T 46500 43900 5 10 0 0 270 0 1
symversion=0.1
T 45900 43300 5 10 1 1 0 0 1
value=100n
}
C 48400 43000 1 0 0 ccurrent.sym
{
T 48600 43500 5 10 1 1 0 0 1
refdes=CC?
T 48800 43300 5 10 0 1 0 0 1
device=CONNECTION_CURRENT
}
N 44500 44500 44500 44900 4
C 44100 48600 1 0 0 capacitor-1.sym
{
T 44300 49300 5 10 0 0 0 0 1
device=CAPACITOR
T 44200 48500 5 10 1 1 0 0 1
refdes=C6
T 44300 49500 5 10 0 0 0 0 1
symversion=0.1
T 44700 48500 5 10 1 1 0 0 1
value=1p
}
C 45200 48100 1 0 0 capacitor-1.sym
{
T 45400 48800 5 10 0 0 0 0 1
device=CAPACITOR
T 45300 48400 5 10 1 1 0 0 1
refdes=C4
T 45400 49000 5 10 0 0 0 0 1
symversion=0.1
T 45800 48400 5 10 1 1 0 0 1
value=22n
}
C 45100 47600 1 0 0 capacitor-1.sym
{
T 45300 48300 5 10 0 0 0 0 1
device=CAPACITOR
T 45200 47900 5 10 1 1 0 0 1
refdes=C5
T 45300 48500 5 10 0 0 0 0 1
symversion=0.1
T 45700 47900 5 10 1 1 0 0 1
value=22n
}
C 43900 49700 1 270 0 resistor-2.sym
{
T 44250 49300 5 10 0 0 270 0 1
device=RESISTOR
T 44200 49300 5 10 1 1 0 0 1
refdes=R9
T 44200 49100 5 10 1 1 0 0 1
value=82k
}
C 44900 49700 1 270 0 resistor-2.sym
{
T 45250 49300 5 10 0 0 270 0 1
device=RESISTOR
T 45200 49300 5 10 1 1 0 0 1
refdes=R10
T 45200 49000 5 10 1 1 0 0 1
value=100k
}
N 44000 48800 44100 48800 4
N 44000 47400 44000 48800 4
N 45100 47800 45000 47800 4
N 45000 48800 45000 47400 4
N 45200 48300 44000 48300 4
C 47000 48200 1 270 0 resistor-2.sym
{
T 47350 47800 5 10 0 0 270 0 1
device=RESISTOR
T 47300 47800 5 10 1 1 0 0 1
refdes=R11
T 47300 47600 5 10 1 1 0 0 1
value=220k
}
C 47000 47200 1 270 0 resistor-2.sym
{
T 47350 46800 5 10 0 0 270 0 1
device=RESISTOR
T 47300 46800 5 10 1 1 0 0 1
refdes=R12
T 47300 46600 5 10 1 1 0 0 1
value=220k
}
C 47100 46000 1 0 0 resistor-2.sym
{
T 47500 46350 5 10 0 0 0 0 1
device=RESISTOR
T 47200 45800 5 10 1 1 0 0 1
refdes=R14
T 47700 45800 5 10 1 1 0 0 1
value=5k
}
C 47100 48200 1 0 0 resistor-2.sym
{
T 47500 48550 5 10 0 0 0 0 1
device=RESISTOR
T 47200 48500 5 10 1 1 0 0 1
refdes=R13
T 47700 48500 5 10 1 1 0 0 1
value=5k
}
N 46800 48300 47100 48300 4
N 47100 46100 46500 46100 4
N 46500 46100 46500 47000 4
C 46900 46600 1 0 0 pentode.sym
{
T 49700 49200 5 10 1 1 0 0 1
refdes=U2
T 49300 48700 5 10 0 1 0 0 1
device=PENTODE
}
C 46900 47800 1 180 1 pentode.sym
{
T 49700 45200 5 10 1 1 180 6 1
refdes=U3
T 49300 45700 5 10 0 1 180 6 1
device=PENTODE
}
C 49200 47500 1 270 0 gnd-1.sym
N 49500 47600 49500 46800 4
N 49500 47400 50200 47400 4
N 50200 45700 50200 48700 4
N 50200 48700 50100 48700 4
N 50200 45700 50100 45700 4
C 50300 48400 1 0 0 resistor-2.sym
{
T 50700 48750 5 10 0 0 0 0 1
device=RESISTOR
T 50500 48700 5 10 1 1 0 0 1
refdes=R15
T 50600 48200 5 10 1 1 0 0 1
value=1k
}
C 50300 45800 1 0 0 resistor-2.sym
{
T 50700 46150 5 10 0 0 0 0 1
device=RESISTOR
T 50500 46100 5 10 1 1 0 0 1
refdes=R16
T 50600 45600 5 10 1 1 0 0 1
value=1k
}
N 50100 45900 50300 45900 4
N 50100 48500 50300 48500 4
N 51200 45900 51200 50300 4
C 52700 46000 1 0 0 transformer-3.sym
{
T 53100 47400 5 10 1 1 0 0 1
refdes=Trans
T 52700 47600 5 10 0 0 0 0 1
device=TRANSFORMER
}
N 49300 49500 52700 49500 4
N 49300 44300 52700 44300 4
N 52700 46700 51700 46700 4
C 46400 43100 1 0 0 resistor-2.sym
{
T 46800 43450 5 10 0 0 0 0 1
device=RESISTOR
T 46600 43400 5 10 1 1 0 0 1
refdes=R7
T 46900 43400 5 10 1 1 0 0 1
value=100k
}
C 44400 42600 1 270 0 resistor-2.sym
{
T 44750 42200 5 10 0 0 270 0 1
device=RESISTOR
T 44700 42400 5 10 1 1 270 0 1
refdes=R6
T 44700 42100 5 10 1 1 270 0 1
value=4k7
}
C 43200 42300 1 270 0 capacitor-1.sym
{
T 43900 42100 5 10 0 0 270 0 1
device=CAPACITOR
T 43500 42000 5 10 1 1 0 0 1
refdes=C3
T 44100 42100 5 10 0 0 270 0 1
symversion=0.1
T 43500 41600 5 10 1 1 0 0 1
value=100n
}
C 43300 43200 1 270 0 resistor-variable-2.sym
{
T 43700 42650 5 10 1 1 270 0 1
refdes=P1
T 44200 42400 5 10 0 1 270 0 1
device=VARIABLE_RESISTOR
T 43600 42800 5 10 1 1 0 0 1
value=22k
}
N 43400 42300 43900 42300 4
N 43900 42300 43900 42700 4
N 43400 43200 46400 43200 4
N 44500 43600 44500 43200 4
N 44500 43200 44500 42600 4
C 43900 41100 1 0 0 gnd-1.sym
N 43400 41400 44500 41400 4
N 44500 41400 44500 41700 4
C 54100 44800 1 0 0 gnd-1.sym
N 54200 46100 54200 45100 4
N 47100 47300 48100 47300 4
N 48100 47300 48100 50200 4
N 44000 49700 45000 49700 4
N 44500 49700 44500 50100 4
N 49200 43200 54600 43200 4
N 54600 43200 54600 47300 4
N 54200 47300 54900 47300 4
N 47300 43200 48400 43200 4
N 45800 46600 45800 44100 4
N 45600 44900 45800 44900 4
C 46000 48100 1 0 0 ccurrent.sym
{
T 46200 48600 5 10 1 1 0 0 1
refdes=CC?
T 46400 48400 5 10 0 1 0 0 1
device=CONNECTION_CURRENT
}
C 46300 47800 1 270 0 ccurrent.sym
{
T 46800 47600 5 10 1 1 270 0 1
refdes=CC?
T 46600 47400 5 10 0 1 270 0 1
device=CONNECTION_CURRENT
}
C 54300 47300 1 90 0 inductor-1.sym
{
T 53800 47500 5 10 0 0 90 0 1
device=INDUCTOR
T 54000 48000 5 10 1 1 180 0 1
refdes=L3
T 53600 47500 5 10 0 0 90 0 1
symversion=0.1
T 53700 47600 5 10 1 1 0 0 1
value=0m6
}
C 55100 49400 1 0 0 inductor-1.sym
{
T 55300 49900 5 10 0 0 0 0 1
device=INDUCTOR
T 55300 49700 5 10 1 1 0 0 1
refdes=L4
T 55300 50100 5 10 0 0 0 0 1
symversion=0.1
T 55700 49700 5 10 1 1 0 0 1
value=23m
}
C 55100 48700 1 0 0 capacitor-1.sym
{
T 55300 49400 5 10 0 0 0 0 1
device=CAPACITOR
T 55100 49000 5 10 1 1 0 0 1
refdes=C10
T 55300 49600 5 10 0 0 0 0 1
symversion=0.1
T 55600 49000 5 10 1 1 0 0 1
value=193
}
C 54700 47200 1 270 0 capacitor-1.sym
{
T 55400 47000 5 10 0 0 270 0 1
device=CAPACITOR
T 55100 46900 5 10 1 1 0 0 1
refdes=C9
T 55600 47000 5 10 0 0 270 0 1
symversion=0.1
T 55100 46500 5 10 1 1 0 0 1
value=1n
}
C 54200 48100 1 0 0 resistor-2.sym
{
T 54600 48450 5 10 0 0 0 0 1
device=RESISTOR
T 54400 48400 5 10 1 1 0 0 1
refdes=R19
T 54500 47900 5 10 1 1 0 0 1
value=6.8
}
C 55100 48100 1 0 0 resistor-2.sym
{
T 55500 48450 5 10 0 0 0 0 1
device=RESISTOR
T 55300 48400 5 10 1 1 0 0 1
refdes=R20
T 55400 47900 5 10 1 1 0 0 1
value=45
}
N 55100 48200 55100 49500 4
N 54900 47300 54900 47200 4
N 54900 46300 54900 46100 4
N 54200 46100 56000 46100 4
N 56000 49500 56000 46100 4
C 41400 44800 1 0 0 resistor-2.sym
{
T 41800 45150 5 10 0 0 0 0 1
device=RESISTOR
T 41600 45100 5 10 1 1 0 0 1
refdes=R1
T 41900 45100 5 10 1 1 0 0 1
value=10
}
N 47100 46100 47100 46300 4
N 47100 48200 47100 48300 4
N 47100 47200 47100 47300 4
C 43000 47500 1 270 0 capacitor-1.sym
{
T 43700 47300 5 10 0 0 270 0 1
device=CAPACITOR
T 42800 47200 5 10 1 1 0 0 1
refdes=Cm1
T 43900 47300 5 10 0 0 270 0 1
symversion=0.1
T 43300 47200 5 10 1 1 0 0 1
value=1p6
}
C 45600 47500 1 270 0 capacitor-1.sym
{
T 46300 47300 5 10 0 0 270 0 1
device=CAPACITOR
T 45300 47200 5 10 1 1 0 0 1
refdes=Cm2
T 46500 47300 5 10 0 0 270 0 1
symversion=0.1
T 45900 47200 5 10 1 1 0 0 1
value=1p6
}
C 48400 44700 1 0 0 capacitor-1.sym
{
T 48600 45400 5 10 0 0 0 0 1
device=CAPACITOR
T 48400 44500 5 10 1 1 0 0 1
refdes=Cm4
T 48600 45600 5 10 0 0 0 0 1
symversion=0.1
T 48900 44500 5 10 1 1 0 0 1
value=1p6
}
C 48400 49300 1 0 0 capacitor-1.sym
{
T 48600 50000 5 10 0 0 0 0 1
device=CAPACITOR
T 48400 49800 5 10 1 1 0 0 1
refdes=Cm3
T 48600 50200 5 10 0 0 0 0 1
symversion=0.1
T 49000 49800 5 10 1 1 0 0 1
value=1p6
}
N 43200 47500 44000 47500 4
N 46500 47800 46000 47800 4
N 45800 47500 45000 47500 4
N 48000 46100 48500 46100 4
N 48000 48300 48500 48300 4
N 48400 49500 48400 48300 4
N 48400 44900 48400 46100 4
C 51500 48600 1 270 0 capacitor-1.sym
{
T 52200 48400 5 10 0 0 270 0 1
device=CAPACITOR
T 51900 48300 5 10 1 1 0 0 1
refdes=C7
T 52400 48400 5 10 0 0 270 0 1
symversion=0.1
T 51900 47900 5 10 1 1 0 0 1
value=1n
}
C 51500 45800 1 270 0 capacitor-1.sym
{
T 52200 45600 5 10 0 0 270 0 1
device=CAPACITOR
T 51900 45500 5 10 1 1 0 0 1
refdes=C8
T 52400 45600 5 10 0 0 270 0 1
symversion=0.1
T 51900 45100 5 10 1 1 0 0 1
value=1n
}
N 51700 45800 51700 47700 4
N 51700 48600 51700 49500 4
C 52200 50300 1 0 0 generic-power-1.sym
C 47900 50200 1 0 0 generic-power-1.sym
C 44300 50100 1 0 0 generic-power-1.sym
C 51000 50300 1 0 0 generic-power-1.sym
C 52600 48200 1 270 0 inductor-1.sym
{
T 53100 48000 5 10 0 0 270 0 1
device=INDUCTOR
T 52800 47800 5 10 1 1 0 0 1
refdes=L1
T 53300 48000 5 10 0 0 270 0 1
symversion=0.1
T 52800 47600 5 10 1 1 0 0 1
value=10m
}
C 52600 46100 1 270 0 inductor-1.sym
{
T 53100 45900 5 10 0 0 270 0 1
device=INDUCTOR
T 52900 45700 5 10 1 1 0 0 1
refdes=L2
T 53300 45900 5 10 0 0 270 0 1
symversion=0.1
T 52900 45500 5 10 1 1 0 0 1
value=10m
}
C 52600 45200 1 270 0 resistor-2.sym
{
T 52950 44800 5 10 0 0 270 0 1
device=RESISTOR
T 52900 45000 5 10 1 1 270 0 1
refdes=R18
T 52900 44600 5 10 1 1 270 0 1
value=10
}
C 52600 49100 1 270 0 resistor-2.sym
{
T 52950 48700 5 10 0 0 270 0 1
device=RESISTOR
T 52900 48900 5 10 1 1 270 0 1
refdes=R17
T 52900 48500 5 10 1 1 270 0 1
value=10
}
N 52700 49500 52700 49100 4
N 49300 44900 49300 44300 4
N 51700 44900 51700 44300 4
N 52400 46700 52400 50300 4
N 46100 48300 46000 48300 4
