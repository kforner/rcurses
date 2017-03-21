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
