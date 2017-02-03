#include <R.h>
#include <ncurses.h>

void _getch() { getch(); }

void _getnstr(char ** str, int* n) {
  fprintf(stderr, "n=%i\n", *n);
  int read = getnstr(str[0], *n);
  fprintf(stderr, "read=%i\n", read);
  *n = read;
}

