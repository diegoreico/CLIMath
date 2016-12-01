#ifndef ERROR_H_
#define ERROR_H_

  enum errors {
      ERROR_UNEXPECTED_WTF};

  void showError(enum errors code, int line);

#endif
