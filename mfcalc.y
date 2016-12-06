%{

  #include <stdlib.h> /* malloc. */
  #include <string.h> /* strlen. */
  #include <stdio.h>  /* For printf, etc. */
  #include <math.h>   /* For pow, used in the grammar.  */

  extern int yylex(void);
  extern void yyterminate();
  void yyerror(const char *s);
  extern FILE* yyin;
%}

%code top{

  void yyerror (char const *s);

}

%code requires {
  #include "SymbolTable.h"
  #include "errors.h"
}

%define api.value.type union /* Generate YYSTYPE from these types:  */
%token <int>  END_OF_FILE
%token <int>  RESTART_CONTEXT
%token <int>  SHOW_CONSTANTS
%token <int>  SHOW_FUNCTIONS
%token <int>  SHOW_VARIABLES
%token <int>  SHOW_SYMBOL_TABLE
%token <int>  HELP
%token <int>  QUIT
%token <double>  NUM         /* Simple double precision number.  */
%token <symrec*> VAR FNCT    /* Symbol table pointer: variable and function.  */
%type  <double>  exp

%precedence '='
%left '-' '+'
%left '*' '/'
%precedence NEG /* negation--unary minus */
%right '^'      /* exponentiation */

%% /* The grammar follows.  */
input:
  %empty
| input line
;

line:
  '\n'
| END_OF_FILE
| QUIT '\n'       { YYACCEPT;}
| RESTART_CONTEXT '\n' { // destroys the sumbol table and creates a new one
                    symbolTableDestroy(symbolTable);
                    symbolTable = symbolTableCreate();
                    }
| SHOW_CONSTANTS '\n'{ //how availble contants
                    printf("Available Constants\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,-1);}
| SHOW_FUNCTIONS '\n'{ //shows available functions
                    printf("Available Functions\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,FNCT);}
| SHOW_VARIABLES '\n'{ //shows available variables
                    printf("Current Workspace\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,VAR);}
| SHOW_SYMBOL_TABLE '\n'{ //shows full symbol table
                    printf("Symbol Table\n");
                    printf("=========================\n");
                    symbolTablePrint(symbolTable);
                  }
| HELP '\n'       { //shows system help
                    printf("\n CLIMath v0.1 System Help");
                    printf("\n===============================");
                    printf("\nWelcome to the first version of this command line interface");
                    printf("\n");
                    printf("\nYou can use \";\" at the end of a command to supress the command output");
                    printf("\n");
                    printf("\nAvailable options:");
                    printf("\n:? --> Shows help menu.");
                    printf("\n:f --> Shows availble functions.");
                    printf("\n:v --> Shows variables.");
                    printf("\n:t --> Shows full symbol table.");
                    printf("\n:l --> Load scritp.");
                    printf("\n\t :l pathToFile");
                    printf("\n:r --> Resets the current workspace.");
                    printf("\n:q --> Quit.");
                    printf("\n");
                  }
| exp ';' '\n'    { ; }
| exp '\n'        { printf ("%.10g\n", $1); }
| error '\n'      { yyerrok; }
;

exp:
  NUM                { $$ = $1; /* gets thje value of a number */ }
| VAR                {  //access to a var value
                        //checks if users tries to check the value of a function
                        if($1->type == FNCT){
                          $$ = 0;
                          showError(ERROR_VALUE_OF_FUNCTION);
                       }else{
                         //gets the value of the variable if it's initialized
                         if(!$1->initialized)
                          showError(ERROR_NOT_INITIALICED_VARIABLE);
                         $$ = $1->value.var;
                       }
                      }
| VAR '=' exp        { //if user is accesing a variable, initialices the value
                      if($1->type == VAR){
                        $$ = $3; $1->value.var = $3;
                        $1->initialized = true;
                      }else{
                        showError(ERROR_OVERWITE);
                        $$ = 0;
                      }
                     }
| VAR '(' exp ')'    {  //invokes a function using a expr as an argument
                        if($1->type == FNCT)
                          $$ = (*($1->value.fnctptr))($3);
                        else{
                          $$ = 0;
                          showError(ERROR_NOT_A_FUNCTION);
                        }
                      }
                      //basic arithmetic operations
| exp '+' exp        { $$ = $1 + $3;                    }
| exp '-' exp        { $$ = $1 - $3;                    }
| exp '*' exp        { $$ = $1 * $3;                    }
| exp '/' exp        { if($3 == 0) //error if user divides by zero
                        showError(ERROR_DIVISION_BY_ZERO);
                       else
                        $$ = $1 / $3;                    }
| '-' exp  %prec NEG { $$ = -$2;                        }
| exp '^' exp        { $$ = pow ($1, $3);               }
| '(' exp ')'        { $$ = $2;                         }
;
/* End of grammar.  */
%%

/* Called by yyparse on error.  */
void yyerror (char const *s){
  printf("\033[0;31m");
  printf("%s",s);
  printf("\033[0m\n");
}
