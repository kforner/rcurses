gdc <- function() {
  on.exit(endwin())
  initscr()
  keypad()

  cbreak()
  noecho()
  nodelay(stdscr, 1)

  clear()
  refresh()
}


gdc()