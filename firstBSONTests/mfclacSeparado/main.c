#include <stdlib.h>
#include <stdio.h>
#include "mfcalc.tab.h"


int main (int argc, char const* argv[]){
  // int i;
  /* Enable parse traces on option -p.  */

  init_table ();
  return yyparse ();
}
