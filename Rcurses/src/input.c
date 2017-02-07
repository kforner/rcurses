#include <R.h>
#include <ncurses.h>

void _getch() { getch(); }

// N.B: return the size of the read string in *n, or -1 on error
void _getnstr(char ** str, int* n) {
  int status = getnstr(str[0], *n);
  *n = (status == ERR) ? - 1 : strlen(str[0]);
}

