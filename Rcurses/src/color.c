#include "rcurses.h"

void _has_colors(int* status) {
  *status = (has_colors() == TRUE);
}

void _can_change_color(int* status) {
  *status = (can_change_color() == TRUE);
}

void _COLOR_BLACK(int* color) { *color = COLOR_BLACK; }
void _COLOR_RED(int* color) { *color = COLOR_RED; }
void _COLOR_GREEN(int* color) { *color = COLOR_GREEN; }
void _COLOR_YELLOW(int* color) { *color = COLOR_YELLOW; }
void _COLOR_BLUE(int* color) { *color = COLOR_BLUE; }
void _COLOR_MAGENTA(int* color) { *color = COLOR_MAGENTA; }
void _COLOR_CYAN(int* color) { *color = COLOR_CYAN; }
void _COLOR_WHITE(int* color) { *color = COLOR_WHITE; }


void _init_pair(int* pair, int* f, int* b, int* status) {
  *status = (init_pair(*pair, *f, *b) != ERR);
}

void _start_color(int* status) { *status = (start_color() != ERR); }

void _color_pair(int* pair, int* vattr) {
  *vattr = COLOR_PAIR(*pair);
}

void _pair_number(int* vattr, int* _pair) {
  *_pair = PAIR_NUMBER(*vattr);
}


void _color_content(int* color, int* _r, int* _g, int* _b, int* _status) {
  short r, g, b;

  int code = color_content(*color, &r, &g, &b);

  *_status = (code != ERR) ? 1 : 0;
  *_r = r;
  *_g = g;
  *_b = b;
}


void _pair_content(int* pair, int* _f, int* _b, int* _status) {
  short f, b;

  int code = pair_content(*pair, &f, &b);

  *_status = (code != ERR) ? 1 : 0;
  *_f = f;
  *_b = b;
}


void _assume_default_colors(int* f, int* b, int* _status) {
  int code = assume_default_colors(*f, *b);
   *_status = (code != ERR) ? 1 : 0;
}

void _use_default_colors(int* _status) {
  int code = use_default_colors();
   *_status = (code != ERR) ? 1 : 0;
}


