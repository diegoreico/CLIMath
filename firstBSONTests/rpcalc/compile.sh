rm rpcalc.tab.c
rm rpcalc.out

bison rpcalc.y
gcc rpcalc.tab.c -lm -o rpcalc.out
