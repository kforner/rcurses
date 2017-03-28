#include "rcurses.h"

void _has_key(int *ch, int* _out) {
  *_out = has_key(*ch);
}


void _ungetch(int* ch, int* _status) {
  int code = ungetch(*ch);
  *_status = (code != ERR) ? 1 : 0;
}

SEXP _wgetch(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  int key = wgetch((WINDOW*)R_ExternalPtrAddr(_win));
  return create_integer_scalar_output(key);
}


