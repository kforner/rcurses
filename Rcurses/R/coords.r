
#' get the current beginning coordinates and size of the default window.
#'
#' @param win 	a window
#' @return a named list of y, x (or #rows, #cols)
#' @export
#' @family coords
getmaxyx <- function(win = stdscr()) {
  coords <- .call('_getmaxyx', win)
  names(coords) <- c('rows', 'cols')

  as.list(coords)
}

#' the  width of the screen in characters.
#'
#' @return the number of columns
#' @export
#' @family coords
COLS <- function() {
  res <- .c('_COLS', col = integer(1))

  res$col
}

#' the  height of the screen in characters.
#'
#' @return the number of lines
#' @export
#' @family coords
LINES <- function() {
  res <- .c('_LINES', lines = integer(1))

  res$lines
}