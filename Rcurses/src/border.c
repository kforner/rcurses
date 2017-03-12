#include "rcurses.h"

SEXP _wborder(SEXP _win,
              SEXP ls, SEXP rs, SEXP ts, SEXP bs,
              SEXP tl, SEXP tr, SEXP bl, SEXP br)
{
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;

  wborder(
      (WINDOW*)R_ExternalPtrAddr(_win),
      INTEGER(ls)[0],
      INTEGER(rs)[0],
      INTEGER(ts)[0],
      INTEGER(bs)[0],
      INTEGER(tl)[0],
      INTEGER(tr)[0],
      INTEGER(bl)[0],
      INTEGER(br)[0]
  );

  return R_NilValue;
}


SEXP _box00(SEXP _win) {
  if (!R_ExternalPtrAddr(_win)) return R_NilValue;
  box((WINDOW*)R_ExternalPtrAddr(_win), 0, 0);
  return R_NilValue;
}
