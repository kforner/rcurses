#' wait for user input
#'
#' @return the keycode
#' @export
#' @family input
#' @seealso \code{\link{KEYS}}
getch <- function() {
  res <- .c('_getch', key = integer(1))
  res$key
}


#' read character string from terminal from default window
#'
#' @param nchar_max		max length of the string to read
#' @return the read string
#' @export
#' @family input
getnstr <- function(nchar_max = 5000L) {
  str <- paste0(rep(' ', nchar_max), collapse = '')

  if (nchar(str) != nchar_max) warning('bad nchar', nchar(str))

  res <- .c('_getnstr', str = str, n = as.integer(nchar_max))
  if (res$n < 0) stop('got error in getnstr()')

  substr(res$str, 1, res$n)
}
