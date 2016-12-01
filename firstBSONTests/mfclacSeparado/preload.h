#ifndef PRELOAD_H_   /* Include guard */
#define PRELOAD_H_

#include <stdlib.h>
#include <math.h>

struct init{
  char const *fname;
  double (*fnct) (double);
};

extern struct init functions[];

void init_table (struct init* arith_fncts);

#endif
