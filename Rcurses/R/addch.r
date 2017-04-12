### ncurses curs_addch functions
# cf http://invisible-island.net/ncurses/man/curs_addch.3x.html

#' put a character
#'put the
#'       character ch into the given window at its  current  window
#'       position,  which  is then advanced.  They are analogous to
#'       putchar in stdio(3).  If the advance is at the right  mar-
#'       gin:
#'
#' @inheritParams window_params
#' @param ch 		a character to print
#' @export
#' @family output
waddch <- function(win, ch) {
  if (length(ch) != 1 || nchar(ch) != 1)
    stop('give a single character')
  status <- as.logical(.call('_waddch', win, as.character(ch)))

  invisible(status)
}

#' addch
#'
#' @inheritParams waddch
#' @export
#' @family output
addch <- function(ch, win = stdscr()) {
  waddch(win, ch)
}

#' mvwaddch
#'
#' @inheritParams waddch
#' @inheritParams move
#' @export
#' @family output
mvwaddch <- function(win, y, x, ch) {
  wmove(win, y, x)
  waddch(win, ch)
}

#' mvaddch
#'
#' @inheritParams waddch
#' @inheritParams move
#' @export
#' @family output
mvaddch <- function(y, x, ch, win = stdscr()) {
  mvwaddch(win, y, x, ch)
}
