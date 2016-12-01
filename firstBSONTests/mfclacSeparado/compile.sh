rm mfcalc.tab.c
rm mfcalc.tab.h
rm fin.out

bison -d mfcalc.y
gcc mfcalc.tab.c analizadorLexico.c dataStructure.c main.c preload.c -lm -o fin.out
