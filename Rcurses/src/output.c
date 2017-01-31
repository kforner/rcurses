#include <R.h>
#include <ncurses.h>

void _refresh() { refresh(); }

void _printw(char ** strs, int n) {
  if (n <= 0) return;
  printw(strs[0]);
}

void _clear() { clear(); }

