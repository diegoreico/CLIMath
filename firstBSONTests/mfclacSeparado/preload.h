#ifndef PRELOAD_H_   /* Include guard */
#define PRELOAD_H_

#include <stdlib.h>
#include <math.h>

struct initFunctions{
  char const *fname;
  double (*fnct) (double);
};

struct initConstants{
  char const *name;
  double constant;
};

extern struct initFunctions functions[];
extern struct initConstants constants[];

void init_table_functions (struct initFunctions* arith_fncts);
void init_table_constants (struct initConstants* arith_fncts);

#endif
