#' wait for user input
#'
#' @export
#' @family input
getch <- function() .c('_getch')


#' read character string from terminal from default window
#'
#' @param nchar_max		max length of the string to read
#' @return the read string
#' @export
#' @family input
getnstr <- function(nchar_max = 5000L) {
  str <- paste0(rep(' ', nchar_max), collapse = '')

  res <- .c('_getnstr', str = str, n = as.integer(nchar_max))
  warning(res$n)
  substr(res$str, 1, res$n)
}
