%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mfcalc.tab.h"
#include "dataStructure.h"

int numeroLineas=0;
%}

%option noyywrap

Character		[a-zA-Z]

Digit				[0-9]

Integer     {Digit}+

Identifier	({Character}|[_])+({Character}|[_]|[0-9])*

Float				{Digit}+(\.{Digit}+)?(e[+-]{Digit}+){0,1}

Help        \:\?
Quit        \:q

/*=========*/
/* ESTADOS */
/*=========*/

%%
{Quit}            return QUIT;
{Help}            return HELP;
{Integer}         {yylval.NUM = atof(yytext); return NUM;}
{Float}						{yylval.NUM = atof(yytext); return NUM;}
{Identifier}			{
                    symrec *s;
                    s = getsym (yytext);

                    if (s == 0)
                      s = putsym (yytext, VAR);

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
