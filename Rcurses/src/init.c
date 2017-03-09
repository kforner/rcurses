#include <R.h>
#include <ncurses.h>


void _initscr() { initscr(); }

void _endwin() { endwin(); }



///* delete the standard screen, as initialized e.g. by initscr() */
//void _del_std_screen() {
//  if (CURRENT_SCREEN == NULL) {
//      warning("in _del_std_screen, CURRENT_SCREEN is NULL")
//      return;
//  }
//
//  delscreen(CURRENT_SCREEN);
//}
