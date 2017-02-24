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
  box((WINDOW*)R_ExternalPtrAddr(_win), 0, 0);
}
