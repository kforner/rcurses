context('border')



.wvline_all <- function() {
  on.exit(endwin())
  initscr()

  expect_error(wvline(stdscr(), '*', 10), NA)
  expect_error(vline('-', 1), NA)
}
test_that('wvline_all', .wvline_all())


