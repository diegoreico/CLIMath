#include "preload.h"
#include "mfcalc.tab.h"

struct init functions[] = {
  { "atan", atan },
  { "cos",  cos  },
  { "exp",  exp  },
  { "ln",   log  },
  { "sin",  sin  },
  { "sqrt", sqrt },
  { 0, 0 },
};

/* Put arithmetic functions in table.  */
void init_table (struct init* arith_fncts)
{
  int i;
  for (i = 0; arith_fncts[i].fname != 0; i++)
    {
      symrec *ptr = putsym (arith_fncts[i].fname, FNCT);
      ptr->value.fnctptr = arith_fncts[i].fnct;
    }
}
