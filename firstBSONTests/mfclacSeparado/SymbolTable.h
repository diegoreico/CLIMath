
#ifndef ANALIZADORLEXICO_HASHTABLE_H
#define ANALIZADORLEXICO_HASHTABLE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

/* Function type.  */
typedef double (*func_t) (double);

#define SYMBOL_TABLE_DEFAULT_SIZE 149

struct symrec{
  char *name;  /* name of symbol */
  int type;    /* type of symbol: either VAR or FNCT */
  union{
    double var;      /* value of a VAR */
    func_t fnctptr;  /* value of a FNCT */
  } value;
};

typedef struct symrec symrec;

typedef struct _SymbolTable{
    bool hasRegister;
    struct symrec *registe;
    bool hasLeft;
    struct _SymbolTable *left;
    bool hashRight;
    struct _SymbolTable *right;
}SymbolTable;

/*
 * Symbol table is a hash table with trees in each register
 *
 *
 * HASH TABLE
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * BUCKET -> Tree with lexemes
 * ...
 *
 * */
SymbolTable *symbolTable;


SymbolTable* symbolTableCreate();
void symbolTableDestroy(SymbolTable *);
symrec* symbolTableAnalyze(SymbolTable *, char const *);
symrec* symbolTableInsert(SymbolTable *, char const *, int);//just for the load of keywords
void symbolTablePrint(SymbolTable *);
#endif //ANALIZADORLEXICO_HASHTABLE_H
