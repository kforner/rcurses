#include "rcurses.h"



void _getch(int *key) {
  *key = getch();
}

void _has_key(int *ch, int* _out) {
  *_out = has_key(*ch);
}
