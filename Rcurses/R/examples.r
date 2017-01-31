#' hello world example
#'
#'
#' @param sleep 	sleep time before exiting
#' @export
#' @family examples
example_hello <- function(sleep = 5) {
  on.exit(endwin())
  initscr()
	printw('Hello world !')
  refresh()
  Sys.sleep(sleep)
  clear()
  refresh()
}
