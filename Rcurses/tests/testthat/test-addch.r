context('addch')



.waddch_all <- function() {
  on.exit(endwin())
  initscr()


  expect_error(waddch(stdscr(), '*'), NA)
  expect_error(addch('toto'), 'give a single character')

}
test_that('waddch_all', .waddch_all())

