#include "rcurses.h"

void _COLOR_PAIRS(int* _out) {
*_out = COLOR_PAIRS;
}

void _COLORS(int* _out) {
*_out = COLORS;
}

void _ESCDELAY(int* _out) {
*_out = ESCDELAY;
}


void _COLS(int *_col) {
  _col[0] = COLS;
}

void _LINES(int *_lines) {
  _lines[0] = LINES;
}

void _TABSIZE(int* _out) {
*_out = TABSIZE;
}

SEXP _stdscr() {
  return create_external_window(stdscr);
}

SEXP _curscr() {
  return create_external_window(curscr);
}

SEXP _newscr() {
  return create_external_window(newscr);
}

