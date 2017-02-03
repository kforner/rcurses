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


#' mvprintw example
#'
#' @param sleep 	sleep time before exiting
#' @param msg			the message to print in the center of the window
#' @export
#' @family examples
example_mvprintw <- function(sleep = 5, msg = 'Just a string') {
  on.exit(endwin())
  initscr()

  dims <- getmaxyx()

  mvprintw(dims$rows / 2, (dims$cols - nchar(msg)) / 2, msg)

  mvprintw(dims$rows - 2, 0,
    "This screen has %d rows and %d columns\n", dims$rows, dims$cols)

  printw("Try resizing your window(if possible) and then run this example again");
  refresh()
  Sys.sleep(sleep)
  clear()
  refresh()
}

#' getnstr example
#'
#' cf example 4 from NCURSES-Programming-HOWTO
#'
#' @param sleep 	sleep time before exiting
#' @param msg			the message to print in the center of the window
#' @export
#' @family examples
example_getnstr <- function(sleep = 5, msg = 'Enter a string') {
  on.exit(endwin())
  initscr()

  dims <- getmaxyx()

  mvprintw(dims$rows / 2, (dims$cols - nchar(msg)) / 2, msg)

  str <- getnstr()

  mvprintw(dims$rows - 2, 0, "You Entered: %s", str);

  refresh()
  Sys.sleep(sleep)
  clear()
  refresh()
browser()
  print(str)
}