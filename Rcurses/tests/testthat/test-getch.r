context('getch')

.has_key <- function() {
  on.exit(endwin())
  keypad()
  expect_true(has_key(KEYS$KEY_UP))
}
test_that('has_key', .has_key())



.ungetch <- function() {
  on.exit(endwin())
  keypad()
  halfdelay(1) # quick timeout

  ungetch(KEYS$KEY_ENTER)
  expect_equal(getch(), KEYS$KEY_ENTER)
}
test_that('ungetch', .ungetch())



.getch_all <- function() {
  on.exit(endwin())
  keypad()

  ungetch(32)
  expect_equal(getch(), 32)

  ungetch(32)
  expect_equal(wgetch(stdscr()), 32)

  ungetch(32)
  expect_equal(mvgetch(0, 0), 32)

  ungetch(32)
  expect_equal(mvwgetch(stdscr(), 0, 0), 32)
}
test_that('getch_all', .getch_all())



.wgetch <- function() {
  on.exit(endwin())
  keypad()

  ungetch(32)
  expect_equal(wgetch(stdscr()), 32)
}
test_that('wgetch', .wgetch())
