#' get the current beginning coordinates and size of the default window.
#'
#' @return a named list of y, x (or #rows, #cols)
#' @export
#' @family output
getmaxyx <- function() {
  x <- y <- 0L
  coords <- .c('_getstdscr_maxyx', y, x)
  names(coords) <- c('rows', 'cols')

  coords
}
