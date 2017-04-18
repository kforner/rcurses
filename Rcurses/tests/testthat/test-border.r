context('border')



.wvline_all <- function() {
  on.exit(endwin())
  initscr()

  expect_error(wvline(stdscr(), '*', 10), NA)
  expect_error(vline('-', 1), NA)
}
test_that('wvline_all', .wvline_all())



.whline_all <- function() {
  on.exit(endwin())
  initscr()

  expect_error(whline(stdscr(), '*', 10), NA)
  expect_error(hline('-', 1), NA)
}
test_that('whline_all', .whline_all())



.box <- function() {
  on.exit(endwin())
  initscr()

  expect_error(box(), NA)
}
test_that('box', .box())
