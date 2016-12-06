#include "preload.h"
#include "mfcalc.tab.h"


//default values for symbol table
struct initFunctions functions[] = {
  { "atan", atan },
  { "cos",  cos  },
  { "exp",  exp  },
  { "ln",   log  },
  { "sin",  sin  },
  { "sqrt", sqrt },
  { 0, 0 },
};

struct initConstants constants[] = {
  { "pi", 3.14159265359 },
  { "e",  2.71828182846  },
  { 0, 0 },
};

//puts the functions in the symbol table
void init_table_functions (struct initFunctions* arith_fncts)
{
  int i;
  for (i = 0; arith_fncts[i].fname != 0; i++)
    {
      symrec *ptr = symbolTableInsert(symbolTable,arith_fncts[i].fname, FNCT);
      ptr->value.fnctptr = arith_fncts[i].fnct;
      ptr->initialized = true;
    }
}

//puts the constants in the symbol table
void init_table_constants (struct initConstants* arith_fncts)
{
  int i;
  for (i = 0; arith_fncts[i].name != 0; i++)
    {
      symrec *ptr = symbolTableInsert(symbolTable,arith_fncts[i].name, -1);
      ptr->value.var = arith_fncts[i].constant;
      ptr->initialized = true;
    }
}
