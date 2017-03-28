context('getch')

.has_key <- function() {
  on.exit(endwin())
  keypad()
  expect_true(has_key(KEYS$KEY_UP))
}
test_that('has_key', .has_key())



.getch <- function() {
  on.exit(endwin())
  keypad()
  halfdelay(1) # quick timeout
  expect_lt(getch(), 0)
}
test_that('getch', .getch())



.wgetch <- function() {
  on.exit(endwin())
  keypad()
  halfdelay(1) # quick timeout
  expect_lt(wgetch(stdscr()), 0)
}
test_that('wgetch', .wgetch())
