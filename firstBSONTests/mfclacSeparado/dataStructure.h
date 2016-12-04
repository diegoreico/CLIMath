#ifndef DATASTRUCTURE_H_   /* Include guard */
#define DATASTRUCTURE_H_

 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>

/* Function type.  */
typedef double (*func_t) (double);
/* Data type for links in the chain of symbols.  */
struct symrec{
  char *name;  /* name of symbol */
  int type;    /* type of symbol: either VAR or FNCT */
  bool initiliced;
  union{
    double var;      /* value of a VAR */
    func_t fnctptr;  /* value of a FNCT */
  } value;

  struct symrec *next;  /* link field */
};

typedef struct symrec symrec;

/* The symbol table: a chain of 'struct symrec'.  */
symrec *sym_table;

symrec *putsym (char const *, int);
symrec *getsym (char const *);

#endif
