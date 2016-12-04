
#include "SymbolTable.h"
#include <string.h>
#include "mfcalc.tab.h"
//creates a register
symrec* createRegister(char const * element,int type){
    symrec* registe = (symrec*) malloc(sizeof(symrec));

    registe->name = strdup(element);
    registe->type = type;

    return registe;
}

//destroys a register
void destroyRegister(symrec *registe){

    free(registe->name);
    free(registe);
}

//creates a node that is used by the binary trees of each position of the hash table/symbol table
SymbolTable* createNode(){
    SymbolTable *node = (SymbolTable*) malloc(sizeof(SymbolTable));

    node->hashRight = node->hasLeft = node->hasRegister = false;

    return node;
}

//removes 1 node
bool removeNode(SymbolTable **bucket){

    //if the current node has a register
    if((*bucket)->hasRegister){

        //destroys the register inside the node
        destroyRegister((*bucket)->registe);

        (*bucket)->hasRegister=false;

        //moves upward, one of his child nodes
        if ((*bucket)->hasLeft){
            *bucket = (*bucket)->left;
            return false;
        }else if ((*bucket)->hashRight){
            *bucket = (*bucket)->right;
            return false;
        }else{
            return true;
        }

    //if current node doesn't has a register, the memory can be free
    }else{
        free(*bucket);
        return true;
    }
}

//creates the symbol table with default size
SymbolTable* symbolTableCreate(){
    SymbolTable *hashTable = (SymbolTable*) malloc(sizeof(SymbolTable) * SYMBOL_TABLE_DEFAULT_SIZE);

    for (int i = 0; i < SYMBOL_TABLE_DEFAULT_SIZE; ++i) {
        hashTable[i].hashRight = hashTable[i].hasLeft = hashTable[i].hasRegister = false;
    }

    return hashTable;
}

//destroys all node from a tree
void destroyTree(SymbolTable *symbolTable){

    if(symbolTable->hasLeft) {
        destroyTree(symbolTable->left);
        free(symbolTable->left);
    }

    if(symbolTable->hashRight) {
        destroyTree(symbolTable->right);
        free(symbolTable->right);
    }

    if(symbolTable->hasRegister){
        destroyRegister(symbolTable->registe);

    }
}

//destroys all the symbol table
void symbolTableDestroy(SymbolTable *symbolTable){

    for (int i = 0; i < SYMBOL_TABLE_DEFAULT_SIZE; i++) {
        destroyTree(&symbolTable[i]);
    }

    free(symbolTable);

}

//hash function for elements
int hash(char const * element){
    unsigned int hash = 5381;
    int current=0;

    while(element[current]){
        /* D. J. Bernstein hash function */
        hash = (33 * hash ^ element[current])% (SYMBOL_TABLE_DEFAULT_SIZE - 1);

        current++;
    }

    return hash;
}

//inserts a element in one of the trees
symrec* insertIntoBucket(SymbolTable *bucket,char const * element,int type){
    if(bucket->hasRegister){

        //compares the element that we are going to insert with the element of the current node
        int r = strcmp(element,symbolTable->registe->name);
        if (r > 0) r = 1;
        else if (r < 0) r = -1;
        switch (r){
            case -1:
                //the element that we want to insert goes before the element of the current node
                //if doesn't exist a left node, a new node is created for the element
                if(!bucket->hasLeft){
                    bucket->left = createNode();
                    bucket->hasLeft = bucket->left->hasRegister= true;
                    bucket->left->registe=createRegister(element,type);
                    return bucket->left->registe;
                }else
                    //compares the element with the element of the left node
                    return insertIntoBucket(bucket->left,element,type);

                break;

            //current node has the same lexema
            // case 0:
            //
            //     // bucket->registe->count++;
            //
            //     break;
            case 1:
                //the element that we want to insert goes after the element of the current node
                //if doesn't exist a right node, a new node is created for the element
                if(!bucket->hashRight){
                    bucket->right = createNode();
                    bucket->hashRight = bucket->right->hasRegister= true;
                    bucket->right->registe=createRegister(element,type);
                    return bucket->right->registe;
                }else
                    //compares the element with the element of the left node
                    return insertIntoBucket(bucket->right,element,type);

                break;
            default:
                return NULL;
        }

    }else{
        //creates a register for the node
        bucket->hasRegister = true;
        bucket->registe = createRegister(element,type);
        return bucket->registe;
    }
}


//inserts an elemento into the symbol table
symrec* symbolTableInsert(SymbolTable *symbolTable, char const * element, int type){
    SymbolTable* bucket = &symbolTable[hash(element)];

    return insertIntoBucket(bucket,element,type);
}

//returns the data stored in a tree of a bucket for a element
symrec* getElement(SymbolTable *symbolTable,char const * element){

    //checks if current node of hash table has a register
    if (symbolTable->hasRegister){

        //searchs in the tree for a node with the exact element
        int r = strcmp(element,symbolTable->registe->name);
        if (r > 0) r = 1;
        else if (r < 0) r = -1;

        switch (r){
            case -1:

                if(symbolTable->hasLeft)
                    return getElement(symbolTable->left,element);
                else
                    return NULL;

                break;
            case 0:
                return symbolTable->registe;
                break;

            case 1:

                if(symbolTable->hashRight)
                    return getElement(symbolTable->right,element);
                else
                    return NULL;

                break;
            default:
                return NULL;
        }

    }else
        return NULL;
}

//returns the data stored in the symbol table for a element
symrec* symbolTableGet(SymbolTable *symbolTable, char const * element){

    return getElement(&symbolTable[hash(element)],element);

}

//deletes a element from a tree
bool deleteElement(SymbolTable *symbolTable, char const * element){

    //if current node has a register
    if (symbolTable->hasRegister){

        //searchs in the tree for the exact element
        int r = strcmp(element,symbolTable->registe->name);
        if (r > 0) r = 1;
        else if (r < 0) r = -1;

        switch (r){
            case -1:

                if(symbolTable->hasLeft){
                    if(deleteElement(symbolTable->left, element)){//searchs on the right node and updates current node info if the child node is deleted
                        symbolTable->hasLeft=false;

                        //segurarse de que esto é correcto tanto a esquerda como a dereita
                        return true;
                    }else{
                      return false;
                    }
                }
                else
                    return false;

                break;
            case 0:
                // founds the node with the element and deletes 1 apparition of the element
                // if the number of apparitions is 0, then the node is also removed

                return removeNode(&symbolTable);

                break;

            case 1:

                if(symbolTable->hashRight){//searchs on the right node and updates current node info if the child node is deleted
                    if(deleteElement(symbolTable->right, element)){
                        symbolTable->hashRight=false;
                        return true;
                    }else{
                      return false;
                    }
                }
                else
                    return false;

                break;
            default:
                return NULL;
        }

    }else{
        return false;
    }
}

//deletes a element from the symbol table
void symbolTableDelete(SymbolTable *symbolTable, char const * element){

    deleteElement(&symbolTable[hash(element)], element);
}

void printTreeElement(SymbolTable* symbolTable){
  printf("\t%s",symbolTable->registe->name);
  if(symbolTable->registe->type != FNCT)
    printf(" - \t%f",symbolTable->registe->value.var);
  // printf(" - %d",symbolTable->registe->type);

  printf("\n");
}
//prints the tree of a bucket of the symbol table / hash table
void printTree(SymbolTable* symbolTable){

    if(symbolTable->hasLeft)
        printTree(symbolTable->left);

    if(symbolTable->hasRegister){
        printTreeElement(symbolTable);
    }

    if(symbolTable->hashRight)
        printTree(symbolTable->right);

}

void printTreeByType(SymbolTable* symbolTable,int type){

    if(symbolTable->hasLeft)
        printTree(symbolTable->left);

    if(symbolTable->hasRegister && symbolTable->registe->type == type && symbolTable->registe->initialized){
        printTreeElement(symbolTable);
    }

    if(symbolTable->hashRight)
        printTree(symbolTable->right);

}

void symbolTablePrint(SymbolTable *symbolTable){
    // printf("SYMBOL TABLE\n");
    // printf("==========\n");
    for (int i = 0; i < SYMBOL_TABLE_DEFAULT_SIZE; ++i) {
        // printf("BUCKET %d\n",i);
        // printf("==========\n");
        printTree(&symbolTable[i]);
        // printf("\n");
    }
}

void symbolTablePrintType(SymbolTable *symbolTable,int type){
  for (int i = 0; i < SYMBOL_TABLE_DEFAULT_SIZE; ++i)
      printTreeByType(&symbolTable[i],type);
}

//checks if a element exists int he symbol table. If the element doesn't exist,
//then the element is inserted in the symbol table as an IDENTIFIER
symrec* symbolTableAnalyze(SymbolTable *symbolTable, char const *element){

    symrec* registe = symbolTableGet(symbolTable, element);

    if ( registe == NULL){
        // return symbolTableInsert(symbolTable, element, VAR);
        return NULL;
    }else{
        return registe;
    }
}
