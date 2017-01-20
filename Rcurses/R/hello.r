




print_hello <- function() .C('_print_hello')

getch <- function() .C('_getch')

refresh <- function() .C('refresh')

hello <- function() {
  .C("_hello")
}

r_hello <- function() {
  initscr()
	print_hello()
  refresh()
  getch()
	endwin()
}

