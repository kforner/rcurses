context('refresh')

.refresh <- function() {
  on.exit(endwin())
  initscr()

  refresh()
}
test_that('refresh', .refresh())

