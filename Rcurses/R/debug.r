#' for debugging with options(error)
#'
#' @export
rcurses_recover <- function() {
  clear()
  refresh()
  endwin()
  utils::recover()
}
