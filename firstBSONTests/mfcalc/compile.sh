rm mfcalc.tab.c
rm mfcalc.out

bison mfcalc.y
gcc mfcalc.tab.c -lm -o mfcalc.out
