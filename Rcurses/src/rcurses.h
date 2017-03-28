#include <R.h>
#include <Rinternals.h>
#include <ncurses.h>


SEXP create_status(int status);
SEXP create_external_window(WINDOW* win);
SEXP create_integer_scalar_output(int value);

