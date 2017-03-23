#' perform a cursor movement
#'
#' may die if the position is outside the window
#'
#' @inheritParams window_params
#' @param y			the y position (aka the row)
#' @param x			the x position (aka the column)
#' @export
#' @family cursor
move <- function(y, x, win = stdscr()) {
  wmove(win, y, x)
}

#' perform a cursor movement in a window
#'
#' may die if the position is outside the window
#'
#' @inheritParams window_params
#' @param y			the y position (aka the row)
#' @param x			the x position (aka the column)
#'
#' @return TRUE iff the cursor has been moved
#' @export
#' @family cursor
wmove <- function(win, y, x) {
  res <- .call('_wmove', win, as.integer(y), as.integer(x))
  invisible(as.logical(res))

}

#' get the cursor position
#'
#'@return a list (y, x)
#' @export
#' @family cursor
getyx <- function() {
  res <- .c('_getyx', y = 0L, x = 0L)

  res
}
