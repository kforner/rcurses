#include <R.h>
#include <Rinternals.h>
#include <ncurses.h>


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

SEXP _delwin(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = delwin((WINDOW*)R_ExternalPtrAddr(_win));

  SEXP out = PROTECT(allocVector(INTSXP, 1));
  INTEGER(out)[0] = status != ERR ? 1 : 0;
  UNPROTECT(1);

  return out;
}

