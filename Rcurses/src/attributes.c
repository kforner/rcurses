#include <R.h>
#include <ncurses.h>

// return the attribute values in predefined order (except COLOR_PAIR(n))
// attrs must be preallocated of at least 11 elements
void _attributes(int* attrs) {
  int i = 0;
  attrs[i++] = A_NORMAL;
  attrs[i++] = A_STANDOUT   ;
  attrs[i++] = A_UNDERLINE  ;
  attrs[i++] = A_REVERSE    ;
  attrs[i++] = A_BLINK      ;
  attrs[i++] = A_DIM        ;
  attrs[i++] = A_BOLD       ;
  attrs[i++] = A_PROTECT    ;
  attrs[i++] = A_INVIS      ;
  attrs[i++] = A_ALTCHARSET ;
  attrs[i++] = A_CHARTEXT   ;
//  attrs[i++] = COLOR_PAIR;
}


/*
void _attron(int* _attrs) {
  int attrs = 0;

  if (attrs[0]) attrs |= A_NORMAL;
  if (attrs[1]) attrs |= A_STANDOUT;
  if (attrs[2]) attrs |= A_UNDERLINE;

  attron(*attrs);
}
*/
