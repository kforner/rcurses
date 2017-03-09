#' return the string corresponding to the key code
#'
#' @param code	an integer code describing a key
#' @param the curses keyname for that key code
#' @export
keyname <- function(code) {
  str <- paste0(rep(' ', 1000), collapse = '')
  res <- .c('_keyname', c = as.integer(code),
    name = str)
  if (res$name == str) '' else res$name
}

#' Key constants
#'
#' @seealso keyname
#' @export
#' @name KEYS
NULL
delayedAssign('KEYS', assign_keys())

assign_keys <- function() {
  keys <- sapply(1:1000, keyname)
  idx <- which(nzchar(keys))

  KEYS <- list()
  KEYS[keys[idx]]=idx

  KEYS
}


