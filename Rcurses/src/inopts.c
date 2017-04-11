#include "rcurses.h"

// N.B: return the size of the read string in *n, or -1 on error
void _cbreak(int* bf, int* status) {
  int code = (*bf) ? cbreak() : nocbreak();
  *status = (code != ERR);
}

void _raw(int* bf, int* status) {
  int code = (*bf) ? raw() : noraw();
  *status = (code != ERR) ? 1 : 0;
}

void _echo(int* bf, int* status) {
  int code = (*bf) ? echo() : noecho();
  *status = (code != ERR) ? 1 : 0;
}

void _qiflush(int* bf) {
  if (*bf) { qiflush(); } else { noqiflush(); }
}


void _halfdelay(int* tenths, int* status) {
  int code = halfdelay(*tenths);
  *status = (code != ERR) ? 1 : 0;
}


void _intrflush(int* bf, int* status) {
  int code = intrflush(NULL, *bf);
  *status = (code != ERR) ? 1 : 0;
}

SEXP _keypad(SEXP _win, SEXP _bf) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  int status = keypad((WINDOW*)R_ExternalPtrAddr(_win),
                      INTEGER(_bf)[0]);
  return create_status(status);
}

void _meta(int* bf, int* status) {
  int code = meta(NULL, *bf);
  *status = (code != ERR) ? 1 : 0;
}


SEXP _wtimeout(SEXP _win, SEXP _delay) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  wtimeout((WINDOW*)R_ExternalPtrAddr(_win),
                      INTEGER(_delay)[0]);
  return R_NilValue;
}

SEXP _nodelay(SEXP _win, SEXP _bf) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  int status = nodelay((WINDOW*)R_ExternalPtrAddr(_win),
                      INTEGER(_bf)[0]);
  return create_status(status);
}

