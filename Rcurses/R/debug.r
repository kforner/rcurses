#' @export
rcurses_recover <- function() {
  clear()
  refresh()
  endwin()
  recover()
}