%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mfcalc.tab.h"
#include "SymbolTable.h"

int numeroLineas=0;
YY_BUFFER_STATE buffer;
%}

%option noyywrap

Character		[a-zA-Z]

Digit				[0-9]

Integer     {Digit}+

Identifier	({Character}|[_])+({Character}|[_]|[0-9])*

Float				{Digit}+(\.{Digit}+)?(e[+-]{Digit}+){0,1}

Help        \:\?
Quit        \:q
ShowVariables \:v
ShowFunctions \:f
ShowConstants \:c
RestartContaxt \:r
ShowSymbolTable \:t
Load        \:l[ ][^\0\n]+

/*=========*/
/* ESTADOS */
/*=========*/

%%
<<EOF>>           { /*if lexical analyzer founds and EOF sets the yyin to the previous yyin buffer (stdin)*/
                    yy_delete_buffer( YY_CURRENT_BUFFER );
                    yy_switch_to_buffer(buffer);

                    return END_OF_FILE;}
                    /*System commands*/
{ShowSymbolTable} return SHOW_SYMBOL_TABLE;
{RestartContaxt}  return RESTART_CONTEXT;
{ShowConstants}   return SHOW_CONSTANTS;
{ShowFunctions}   return SHOW_FUNCTIONS;
{ShowVariables}   return SHOW_VARIABLES;
{Quit}            return QUIT;
{Help}            return HELP;
{Load}            {
                    /*Pointer to the current flex buffer*/
                    buffer = YY_CURRENT_BUFFER;
                    /*Tries to open a file*/
                    FILE* file= fopen(&yytext[3],"r");

                    /*If file is open*/
                    if(file != NULL){

                      yyin = file;
                      /*creates a new buffer and switchs it with the current buffer*/
                      yy_switch_to_buffer(
                          yy_create_buffer( yyin, YY_BUF_SIZE ) );

                      BEGIN(INITIAL);
                    }else{
                      showError(ERROR_FILE_NOT_EXISTS);
                    }

                    return '\n';
                  }
{Integer}         {yylval.NUM = atof(yytext); return NUM;}
{Float}						{yylval.NUM = atof(yytext); return NUM;}
{Identifier}			{
                    /*tries to get the variable from the symbol table*/
                    symrec *s;
                    s = symbolTableAnalyze(symbolTable,yytext);

                    // if the variable isn't int the symbol table
                    if (s == 0){
                      //inserts the variable in the symbol table an a unnitialiced variable
                      s = symbolTableInsert(symbolTable,yytext, VAR);
                      s->initialized = false;
                    }

                    //sets the yybal to the register of the variable
                    *((symrec**) &yylval) = s;

                    return VAR;}
[ \t\r]						/* NOTHING */
[\n]						  {numeroLineas++; return yytext[0];}
\/	|
\.	|
-	|
\+	|
\(	|
\)	|
\[	|
\]	|
\{	|
\}	|
\?	|
,	|
! |
;	|
=	|
\*	|
\^	return yytext[0];

.	/* IGNORES ALL*/

%%
