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
#' @family addch
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
#' @family addch
addch <- function(ch, win = stdscr()) {
  waddch(win, ch)
}

#' mvwaddch
#'
#' @inheritParams waddch
#' @inheritParams move
#' @export
#' @family addch
mvwaddch <- function(win, y, x, ch) {
  wmove(win, y, x)
  waddch(win, ch)
}

#' mvaddch
#'
#' @inheritParams waddch
#' @inheritParams move
#' @export
#' @family addch
mvaddch <- function(y, x, ch, win = stdscr()) {
  mvwaddch(win, y, x, ch)
}

#' optimized waddch + refresh
#'
#' The  echochar  and  wechochar routines are equivalent to a
#' call to addch followed by a call to refresh(3x), or a call
#' to  waddch  followed by a call to wrefresh.  The knowledge
#' that only a single character is being output is used  and,
#' for  non-control  characters,  a  considerable performance
#' gain may be seen by using these routines instead of  their
#' equivalents.
#'
#' @inheritParams waddch
#' @export
#' @family addch
wechochar <- function(win, ch) {
  if (length(ch) != 1 || nchar(ch) != 1)
    stop('give a single character')
  status <- as.logical(.call('_wechochar', win, as.character(ch)))

  invisible(status)
}

#' echochar
#'

#' @inheritParams wechochar
#' @export
#' @family addch
echochar <- function(ch, win = stdscr()) {
  wechochar(win, ch)
}
