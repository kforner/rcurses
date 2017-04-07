#include <ncurses.h>


int main() {


  initscr();

  keypad(stdscr, TRUE);


   mousemask(ALL_MOUSE_EVENTS | REPORT_MOUSE_POSITION, NULL);

  int c = KEY_MOUSE;
  const char* key = keyname(c);
  clear();
  endwin();

  printf("KEY_MOUSE=%i\n", c);
  printf("keyname(KEY_MOUSE)=%s\n", key);



}
