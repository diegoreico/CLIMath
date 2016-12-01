#include <stdlib.h>
#include <stdio.h>
#include <math.h>
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


int main (int argc, char const* argv[]){
  // int i;
  /* Enable parse traces on option -p.  */

  init_table (functions);
  return yyparse ();
}
