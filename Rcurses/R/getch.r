#' wait for user input
#'
#' @return the keycode
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
getch <- function() {
  res <- .c('_getch', key = integer(1))
  res$key
}


#' tells if the terminal recognizes a key
#'
#' @return TRUE iff the terminal recognizes ch
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
has_key <- function(ch) {
  res <- .c('_has_key', integer(ch), out = integer(1))
  as.logical(res$out)
}


#' wait for user input
#'
#' @return the keycode
#' @export
#' @family getch
#' @seealso \code{\link{KEYS}}
mvwgetch <- function(win, y, x) {
  res <- .c('_getch', key = integer(1))
  res$key
}