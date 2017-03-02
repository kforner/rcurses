context('refresh')

.refresh <- function() {
  on.exit(endwin())
  initscr()

  refresh()
}
test_that('refresh', .refresh())



.wrefresh <- function() {
  on.exit(endwin())
  initscr()

  wrefresh(stdscr())
}
test_that('wrefresh', .wrefresh())