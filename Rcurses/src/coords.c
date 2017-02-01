#include <R.h>
#include <ncurses.h>


void _getstdscr_maxyx(int* y, int* x) {
  getmaxyx(stdscr,*y , *x);
}

