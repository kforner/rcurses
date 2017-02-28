#' attributes example
#'
#'
#' @param sleep 	sleep time before exiting
#' @export
#' @family examples
example_attributes <- function(sleep = 5) {
  on.exit(endwin())
  initscr()
#  attron('A_NORMAL')
	printw('Hello world !\n')

  with_attr(printw("I'm BOLD !\n"), A_BOLD)

  with_attr(printw("I'm REVERSED !\n"), A_REVERSE)

  with_attr(printw("I'm UNDERLINED !\n"), A_UNDERLINE)

  with_attr(printw("I'm BOLD and UNDERLINED !\n"), A_UNDERLINE, A_BOLD)



  refresh()
  Sys.sleep(sleep)
  clear()
  refresh()
}


#' attron example
#'
#'
#' @param sleep 	sleep time before exiting
#' @export
#' @family examples
example_attron <- function(sleep = 5) {
  on.exit(endwin())
  initscr()

  attron(A_BOLD, A_UNDERLINE)
  printw("I'm BOLD and UNDERLINED !\n")
  attroff(A_BOLD, A_UNDERLINE)

  refresh()
  Sys.sleep(sleep)
  clear()
  refresh()
}

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


#' box example
#'
#'
#' @param sleep 	sleep time before exiting
#' @export
#' @family examples
example_box <- function(sleep = 5) {
  on.exit(endwin())
  initscr()

  box()

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
# nocov start
example_getnstr <- function(sleep = 5, msg = 'Just a string') {
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

}
# nocov end