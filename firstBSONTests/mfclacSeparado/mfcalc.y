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
%token <int>     END_OF_FILE
%token <double>  SHOW_CONSTANTS
%token <double>  SHOW_FUNCTIONS
%token <double>  SHOW_VARIABLES
%token <double>  HELP
%token <double>  QUIT
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
| QUIT '\n'       { exit(0);}
| SHOW_CONSTANTS '\n'{printf("Available Constants\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,-1);}
| SHOW_FUNCTIONS '\n'{printf("Available Functions\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,FNCT);}
| SHOW_VARIABLES '\n'{printf("Current Workspace\n");
                    printf("=========================\n");
                    symbolTablePrintType(symbolTable,VAR);}
| HELP '\n'       { printf("\n CLIMath v0.1 System Help");
                    printf("\n===============================");
                    printf("\nAvailable options:");
                    printf("\n:h --> Shows help menu.");
                    printf("\n:f --> Shows availble functions.");
                    printf("\n:v --> Shows variables.");
                    printf("\n:l --> Load scritp.");
                    printf("\n\t :l pathToFile");
                    printf("\n:q --> Quit.");
                    printf("\n");
                  }
| exp ';' '\n'    { printf ("%.10g\n", $1); }
| exp '\n'    { ; }
| error '\n'      { yyerrok; }
;

exp:
  NUM                { $$ = $1;                         }
| VAR                { $$ = $1->value.var;              }
| VAR '=' exp        { $$ = $3; $1->value.var = $3;     }
| VAR '(' exp ')'    { $$ = (*($1->value.fnctptr))($3); }
| exp '+' exp        { $$ = $1 + $3;                    }
| exp '-' exp        { $$ = $1 - $3;                    }
| exp '*' exp        { $$ = $1 * $3;                    }
| exp '/' exp        { $$ = $1 / $3;                    }
| '-' exp  %prec NEG { $$ = -$2;                        }
| exp '^' exp        { $$ = pow ($1, $3);               }
| '(' exp ')'        { $$ = $2;                         }
;
/* End of grammar.  */
%%

/* Called by yyparse on error.  */
void yyerror (char const *s){
  /*fprintf (stderr, "%s\n", s);
  fprintf (stderr, "%s\n", s);*/
  showError(ERROR_UNEXPECTED_WTF,-1);
}
