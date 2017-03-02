#include <R.h>
#include <Rinternals.h>
#include <ncurses.h>

void _refresh() { refresh(); }

SEXP _wrefresh(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  wrefresh((WINDOW*)R_ExternalPtrAddr(_win));
  return R_NilValue;
}
