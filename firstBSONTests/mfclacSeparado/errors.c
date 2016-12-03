#include "errors.h"
#include <stdlib.h>
#include <stdio.h>

void showError(enum errors code, int line){

  if (line >= 0)
      printf("\033[0;31mError on line %d: ",line);
  else
      printf("\033[0;31m");

  switch(code){
      case ERROR_NOT_INITIALICED_VARIABLE:
        printf("you can't use a not initialiced variable.");
        break;
      case ERROR_OVERWITE:
        printf("you can only overwrite varaibles.");
        break;
      case ERROR_MISSMATCHING_BACKETS:
        printf("miss matching brackets,");
        break;
      case ERROR_WRONG_OPERATOR:
        printf("wrong operator.");
        break;
      case ERROR_DIVISION_BY_ZERO:
        printf("you can't divide by zero.");
        break;
      default:
          printf("Unknown Error");
  }

  printf("\033[0m\n");

}
