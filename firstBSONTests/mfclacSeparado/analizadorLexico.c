#include "analizadorLexico.h"
#include <stdlib.h> /* malloc. */
#include <string.h> /* strlen. */
#include <stdio.h>  /* For printf, etc. */
#include <ctype.h>

int yylex (void){
  int c;

  /* Ignore white space, get first nonwhite character.  */
  while ((c = getchar ()) == ' ' || c == '\t')
    continue;

  if (c == EOF)
    return 0;

  /* Char starts a number => parse the number.         */
  if (c == '.' || isdigit (c))
    {
      ungetc (c, stdin);
      scanf ("%lf", &yylval.NUM);
      return NUM;
    }

  /* Char starts an identifier => read the name.       */
  if (isalpha (c))
    {
      /* Initially make the buffer long enough
         for a 40-character symbol name.  */
      static size_t length = 40;
      static char *symbuf = 0;
      symrec *s;
      int i;
      if (!symbuf)
        symbuf = (char *) malloc (length + 1);

      i = 0;
      do
        {
          /* If buffer is full, make it bigger.        */
          if (i == length)
            {
              length *= 2;
              symbuf = (char *) realloc (symbuf, length + 1);
            }
          /* Add this character to the buffer.         */
          symbuf[i++] = c;
          /* Get another character.                    */
          c = getchar ();
        }
      while (isalnum (c));

      ungetc (c, stdin);
      symbuf[i] = '\0';
      s = getsym (symbuf);
      if (s == 0)
        s = putsym (symbuf, VAR);
      *((symrec**) &yylval) = s;
      return s->type;
    }

  /* Any other character is a token by itself.        */
  return c;
}
