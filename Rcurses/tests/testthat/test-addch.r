context('addch')



.waddch_all <- function() {
  on.exit(endwin())
  initscr()

  expect_error(waddch(stdscr(), '*'), NA)
  expect_error(addch('toto'), 'give a single character')
  expect_error(mvwaddch(stdscr(), 0, 0, '*'), NA)
  expect_error(mvaddch(0, 0, '*'), NA)
}
test_that('waddch_all', .waddch_all())



.wechocar_all <- function() {
  on.exit(endwin())
  initscr()

  expect_error(wechochar(stdscr(), '*'), NA)
  expect_error(echochar('*'), NA)
}
test_that('wechocar_all_all', .wechocar_all())
