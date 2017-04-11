context('addch')



.waddch <- function() {
  on.exit(endwin())
  initscr()

  expect_error(waddch('toto'), 'give a single character')
  expect_error(waddch('*', stdscr()), NA)

}
test_that('waddch', .waddch())
