#' get the current beginning coordinates and size of the default window.
#'
#' @return a named list of y, x (or #rows, #cols)
#' @export
#' @family output
getmaxyx2 <- function() {
  x <- y <- 0L
  coords <- .c('_getstdscr_maxyx', y, x)
  names(coords) <- c('rows', 'cols')

  coords
}

#' get the current beginning coordinates and size of the default window.
#'
#' @param win 	a window
#' @return a named list of y, x (or #rows, #cols)
#' @export
#' @family output
getmaxyx <- function(win = stdscr()) {
  coords <- .call('_getmaxyx', win)
  names(coords) <- c('rows', 'cols')

  as.list(coords)
}
