#include <R.h>
#include <ncurses.h>


void _initscr() { initscr(); }

void _endwin() { endwin(); }

/* disable line buffering - disable signals sending by CTRL-Z and CTRL-C */
void _raw() { raw(); }


