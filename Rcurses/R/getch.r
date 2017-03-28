#' wait for user input
#'
#' @return the keycode, or <= 0 on error or timeout
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
getch <- function() {
  wgetch(stdscr())
}

#' move and wait for user input
#'
#' @inheritParams move
#' @return the keycode, or <= 0 on error or timeout
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
mvgetch <- function(y, x) {
  move(y,x)
  getch()
}




#' tells if the terminal recognizes a key
#'
#' @param ch	the key code
#' @return TRUE iff the terminal recognizes ch
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
has_key <- function(ch) {
  res <- .c('_has_key', integer(ch), out = integer(1))
  as.logical(res$out)
}


#' move and wait for user input in window
#'
#' @inheritParams window_params
#' @inheritParams move
#' @return the keycode, or <= 0 on error or timeout
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
mvwgetch <- function(win, y, x) {
  move(y, x)
  wgetch(win)
}

#' wait for user input
#'
#' @inheritParams window_params
#' @return the keycode, or <= 0 on error or timeout
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
wgetch <- function(win) {
  res <- .call('_wgetch', win)
  as.integer(res)
}
