# cf http://invisible-island.net/ncurses/man/curs_variables.3x.html

#' number of color pairs which the terminal can support.
#'
#' requires initializing curses
#' Usually the number of color pairs  will  be  the  product COLORS*COLORS,
#'  however this is not always true:
#'
#' @export
#' @family variables
COLOR_PAIRS <- function() {
  res <- .c('_COLOR_PAIRS', out = integer(1))
  res$out
}

#' number of colors which the terminal can support.
#'
#' requires initializing curses
#'
#' @export
#' @family variables
COLORS <- function() {
  res <- .c('_COLORS', out = integer(1))
  res$out
}

#' number of ms to wait after reading an escape character
#'
#' to distinguish between an individual escape character entered on the  keyboard
#' from escape  sequences  sent  by cursor- and function-keys
#'
#' @export
#' @family variables
ESCDELAY <- function() {
  res <- .c('_ESCDELAY', out = integer(1))
  res$out
}


#' the  width of the screen in characters.
#'
#' requires initializing curses
#'
#' @return the number of columns
#' @export
#' @family variables
COLS <- function() {
  res <- .c('_COLS', col = integer(1))

  res$col
}

#' the  height of the screen in characters.
#'
#' requires initializing curses
#'
#' @return the number of lines
#' @export
#' @family variables
LINES <- function() {
  res <- .c('_LINES', lines = integer(1))

  res$lines
}


#'  number  of columns for a tab
#'
#' This  variable  holds  the  number  of columns used by the
#' curses library when converting a tab character  to  spaces
#' as it adds the tab to a window
#'
#' @export
#' @family variables
TABSIZE <- function() {
  res <- .c('_TABSIZE', out = integer(1))
  res$out
}

#' get the stdscr window as am external pointer
#'
#' @return stdscr as an external pointer
#' @export
#' @family variables
stdscr <- function() {
  .call('_stdscr')
}

#' special window curscr to record its updates to the terminal screen.
#'
#' @return curscr as an external pointer
#' @export
#' @family variables
curscr <- function() {
  .call('_curscr')
}

#' special window newscr to  hold  updates  to  the terminal screen
#'
#' @return newscr as an external pointer
#' @export
#' @family variables
newscr <- function() {
  .call('_newscr')
}


