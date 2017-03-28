
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

