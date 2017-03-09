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

#' getch example
#'
#'
#' @export
#' @family examples
example_getch <- function() {
  on.exit(endwin())
  initscr()

  cbreak()
	printw('Hit a key !')
  refresh()
  key <- getch()
  printw(sprintf('You typed "%i"', key))

  printw('Hit another key to exit')
  refresh()

  key <- getch()
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


#' window border example
#'
#' inspired by http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html
#'
#' @export
#' @family examples
example_window_border <- function() {
  .create_newwin <- function(...) {
    win <- newwin(...)
    box(win)
    wrefresh(win)

    win
  }

  .destroy_win <- function(win) {
    delwin(win)
  }

  on.exit(endwin())
  initscr()

  cbreak()

  height <- 3
	width <- 10
	starty <-  (LINES() - height) / 2 # Calculating for a center placement
	startx <- (COLS() - width) / 2;	#  of the window

	printw('Press ENTER to exit')
  refresh()
  my_win <- .create_newwin(height, width, starty, startx)

  while( (ch <- getch()) != KEYS$ENTER) {
    if (ch == KEYS$LEFT) startx <- startx - 1
    if (ch == KEYS$RIGHT) startx <- startx + 1
    if (ch == KEYS$UP) starty <- starty - 1
    if (ch == KEYS$DOWN) starty <- starty + 1

    .destroy_win(my_win);
		my_win <-  .create_newwin(height, width, starty, startx)
	}


  clear()
  refresh()
}

#' window example
#'
#' inspired by http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html
#'
#' @param sleep 	sleep time before exiting
#' @export
#' @family examples
example_window <- function(sleep = 5) {
  .create_newwin <- function(...) {
    win <- newwin(...)
    box(win)
    wrefresh(win)

    win
  }

  on.exit(endwin())
  initscr()

  height <- 3
	width <- 10
	starty <-  (LINES() - height) / 2 # Calculating for a center placement
	startx <- (COLS() - width) / 2;	#  of the window

	printw('Hello world !')
  refresh()

  my_win <- .create_newwin(height, width, starty, startx)

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