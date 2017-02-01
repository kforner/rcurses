#include <R.h>
#include <ncurses.h>

void _refresh() { refresh(); }

void _printw(char ** strs, int *n) {
  if (*n <= 0) return;
  printw(strs[0]);
}

void _clear() { clear(); }



void _mvprintw(int *y, int *x, char ** strs, int *n, int *status) {
  if (*n <= 0) return;
  *status = (mvprintw(*y, *x, strs[0]) != ERR) ? 1 : 0;
}

