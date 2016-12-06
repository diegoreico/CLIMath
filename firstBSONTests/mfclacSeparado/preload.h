#ifndef PRELOAD_H_   /* Include guard */
#define PRELOAD_H_

#include <stdlib.h>
#include <math.h>

//structs used to initialize the symbol table
struct initFunctions{
  char const *fname;      //function name
  double (*fnct) (double);//function pointer
};

struct initConstants{
  char const *name;       //consatant name
  double constant;        //constant value
};

extern struct initFunctions functions[];
extern struct initConstants constants[];

void init_table_functions (struct initFunctions* arith_fncts);
void init_table_constants (struct initConstants* arith_fncts);

#endif
