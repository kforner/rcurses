#include "rcurses.h"

SEXP _stdscr() {
  return create_external_window(stdscr);
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

SEXP _derwin(SEXP _win, SEXP _params) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  WINDOW* sub = derwin(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(_params)[0],
      INTEGER(_params)[1],
      INTEGER(_params)[2],
      INTEGER(_params)[3]);

  return create_external_window(sub);
}

SEXP _dupwin(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  WINDOW* dup = dupwin((WINDOW*)R_ExternalPtrAddr(_win));
  return create_external_window(dup);
}


SEXP _delwin(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = delwin((WINDOW*)R_ExternalPtrAddr(_win));
  return create_status(status);
}


SEXP _mvderwin(SEXP _win, SEXP _y, SEXP _x) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int status = mvderwin(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(_y)[0],
      INTEGER(_x)[0]);

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

SEXP _wsyncup(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  wsyncup((WINDOW*)R_ExternalPtrAddr(_win));
  return R_NilValue;
}

SEXP _syncok(SEXP _win, SEXP _bf) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  int status = syncok((WINDOW*)R_ExternalPtrAddr(_win), INTEGER(_bf)[0]);
  return create_status(status);
}


