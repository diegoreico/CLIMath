#include <stdlib.h>
#include <stdio.h>
#include "mfcalc.tab.h"
#include "preload.h"
#include "lex.yy.h"

int main (int argc, char const* argv[]){
  yyin = stdin;
  yyout = stdout;
  // int i;
  /* Enable parse traces on option -p.  */

  init_table (functions);
  return yyparse ();
}
