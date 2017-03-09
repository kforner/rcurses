#include "rcurses.h"

SEXP create_status(int status) {
  SEXP out = PROTECT(allocVector(INTSXP, 1));
  INTEGER(out)[0] = status != ERR ? 1 : 0;
  UNPROTECT(1);

  return out;
}


// create an external pointer around a WINDOW* without a finalizer
SEXP create_external_window(WINDOW* win) {
  SEXP ptr = R_MakeExternalPtr(win, install("ncurses WINDOW"), R_NilValue);

  return ptr;
}
