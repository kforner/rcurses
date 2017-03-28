context('getch')

.has_key <- function() {
  on.exit(endwin())
  keypad()
  expect_true(has_key(KEYS$KEY_UP))
}
test_that('has_key', .has_key())



.getch_all <- function() {
  on.exit(endwin())
  keypad()
  halfdelay(1) # quick timeout
  expect_lt(getch(), 0)
  expect_lt(wgetch(stdscr()), 0)
  expect_lt(mvgetch(0, 0), 0)
  expect_lt(mvwgetch(stdscr(), 0, 0), 0)
}
test_that('getch_all', .getch_all())



.wgetch <- function() {
  on.exit(endwin())
  keypad()
  halfdelay(1) # quick timeout
  expect_lt(wgetch(stdscr()), 0)
}
test_that('wgetch', .wgetch())
