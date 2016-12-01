#include "errors.h"
#include <stdlib.h>
#include <stdio.h>

void showError(enum errors code, int line){

  if (line >= 0)
      printf("\033[0;31mError on line %d: ",line);
  else
      printf("\033[0;31m");

  switch(code){
    case ERROR_UNEXPECTED_WTF:
        printf("WTF, AN UNEXPECTED ERROR APPEARRED");
      break;

      default:
          printf("Unknown Error");
  }

  printf("\033[0m\n");

}
