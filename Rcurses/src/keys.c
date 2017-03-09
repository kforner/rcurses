#include "rcurses.h"


void _keyname(int* c, char** name) {
  const char* kn = keyname(*c);
  if (kn != NULL) strcpy(name[0], kn);
}
