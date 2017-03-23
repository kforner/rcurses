#include "rcurses.h"


void _getyx(int *y, int *x) {
  getyx(stdscr ,*y, *x);
}

SEXP _wmove(SEXP _win, SEXP _y, SEXP _x) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = wmove(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(_y)[0],
      INTEGER(_x)[0]);

  return create_status(status);
}
