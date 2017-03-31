#include "rcurses.h"

int MOUSE_EVENTS[] = {BUTTON1_PRESSED,
     BUTTON1_RELEASED,
     BUTTON1_CLICKED,
     BUTTON1_DOUBLE_CLICKED,
     BUTTON1_TRIPLE_CLICKED,
     BUTTON2_PRESSED,
     BUTTON2_RELEASED,
     BUTTON2_CLICKED,
     BUTTON2_DOUBLE_CLICKED,
     BUTTON2_TRIPLE_CLICKED,
     BUTTON3_PRESSED,
     BUTTON3_RELEASED,
     BUTTON3_CLICKED,
     BUTTON3_DOUBLE_CLICKED,
     BUTTON3_TRIPLE_CLICKED,
     BUTTON4_PRESSED,
     BUTTON4_RELEASED,
     BUTTON4_CLICKED,
     BUTTON4_DOUBLE_CLICKED,
     BUTTON4_TRIPLE_CLICKED,
     /*    BUTTON5_PRESSED,
     BUTTON5_RELEASED,
     BUTTON5_CLICKED,
     BUTTON5_DOUBLE_CLICKED,
     BUTTON5_TRIPLE_CLICKED,*/
     BUTTON_SHIFT,
     BUTTON_CTRL,
     BUTTON_ALT,
     ALL_MOUSE_EVENTS,
     REPORT_MOUSE_POSITION};

void _nb_mouse_events(int* _nb) {
  *_nb = sizeof(MOUSE_EVENTS)/sizeof(MOUSE_EVENTS[0]);
}

void _mouse_events(int *events) {
  int nb = sizeof(MOUSE_EVENTS)/sizeof(MOUSE_EVENTS[0]);
  int i;
  for (i = 0; i < nb; i++)
      events[i] = MOUSE_EVENTS[i];

}


void _has_mouse(int *_out) {
  *_out = ((has_mouse() == TRUE) ? 1 : 0);
}

void _getmouse(int* _id, int *_x, int* _y, int* _z, int* _bstate, int* _status) {
  MEVENT event;
  int code = getmouse(&event);
  *_status = (code == OK) ? 1 : 0;

  *_id = event.id;
  *_x = event.x;
  *_y = event.y;
  *_z = event.z;
  *_bstate = event.bstate;
}

void _mousemask(int* mask, int* _effective, int* _oldmask) {
  mmask_t oldmask;
  *_effective = mousemask(*mask, &oldmask);
  *_oldmask = oldmask;
}
