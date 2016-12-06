#include <stdlib.h>
#include <stdio.h>
#include "mfcalc.tab.h"
#include "preload.h"
#include "lex.yy.h"

int main (int argc, char const* argv[]){
  //asigns default input and output for flex
  yyin = stdin;
  yyout = stdout;

  //creates and initialices the symbol table
  symbolTable = symbolTableCreate();
  init_table_functions(functions);
  init_table_constants(constants);

  printf("\nWelcome! type \":?\" an press \"Enter\" to get the system help");

  //starts the syntax analyzer
  yyparse ();

  //closes yyin when we are done
  fclose(yyin);

  //destroys the symbol table
  symbolTableDestroy(symbolTable);

  return 0;
}
