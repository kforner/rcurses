#' hello world example
#'
#'
#' @export
#' @family examples
example_hello <- function() {
  initscr()
	printw('Hello world !')
  refresh()
  getch()
	endwin()
}
