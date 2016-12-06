bison -d mfcalc.y
flex --header-file=lex.yy.h lexicalAnalyzer.l
gcc mfcalc.tab.c lex.yy.c errors.c SymbolTable.c main.c preload.c -lm  -o CLIMath.out
