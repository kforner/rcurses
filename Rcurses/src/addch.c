#include "rcurses.h"

SEXP _waddch(SEXP win, SEXP ch) {
  if (!R_ExternalPtrAddr(win)) return R_NilValue;
  int status = waddch((WINDOW*)R_ExternalPtrAddr(win),
                      CHAR(STRING_ELT(ch, 0))[0]);
  return create_status(status);
}
