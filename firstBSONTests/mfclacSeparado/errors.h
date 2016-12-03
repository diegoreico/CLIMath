#ifndef ERROR_H_
#define ERROR_H_

  enum errors {
      ERROR_NOT_INITIALICED_VARIABLE,
      ERROR_OVERWITE,
      ERROR_MISSMATCHING_BACKETS,
      ERROR_WRONG_OPERATOR,
      ERROR_DIVISION_BY_ZERO};

  void showError(enum errors code, int line);

#endif
