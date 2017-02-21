#include <R.h>
#include <ncurses.h>

void _move(int *y, int *x, int *status) {
  *status = (move(*y, *x) != ERR) ? 1 : 0;
}

void _getyx(int *y, int *x) {
  getyx(stdscr ,*y, *x);
}

