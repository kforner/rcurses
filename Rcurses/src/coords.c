#include <R.h>
#include <Rinternals.h>
#include <ncurses.h>


void _COLS(int *_col) {
  _col[0] = COLS;
}

void _LINES(int *_lines) {
  _lines[0] = LINES;
}

void _getstdscr_maxyx(int* y, int* x) {
  getmaxyx(stdscr,*y , *x);
}

SEXP _getmaxyx(SEXP _win) {
  SEXP out = PROTECT(allocVector(INTSXP, 2));

  WINDOW* win = (WINDOW*)R_ExternalPtrAddr(_win);

  int x, y;

  getmaxyx(win, y , x);

  INTEGER(out)[0] = y;
  INTEGER(out)[1] = x;

  UNPROTECT(1);
  return out;
}

