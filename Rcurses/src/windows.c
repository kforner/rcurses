#include <R.h>
#include <Rinternals.h>
#include <ncurses.h>

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


SEXP _stdscr() {
  return create_external_window(stdscr);
}


SEXP _box00(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  box((WINDOW*)R_ExternalPtrAddr(_win), 0, 0);
}

SEXP _newwin(SEXP _params) {
  WINDOW* win = newwin(
      INTEGER(_params)[0],
      INTEGER(_params)[1],
      INTEGER(_params)[2],
      INTEGER(_params)[3]);

  return create_external_window(win);
}

SEXP _subwin(SEXP _win, SEXP _params) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  WINDOW* sub = subwin(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(_params)[0],
      INTEGER(_params)[1],
      INTEGER(_params)[2],
      INTEGER(_params)[3]);

  return create_external_window(sub);
}

SEXP _delwin(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = delwin((WINDOW*)R_ExternalPtrAddr(_win));
  return create_status(status);
}



SEXP _mvwin(SEXP _win, SEXP _y, SEXP _x) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = mvwin(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(_y)[0],
      INTEGER(_x)[0]);

  return create_status(status);
}
