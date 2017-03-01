context('init')

.initscr <- function() {
  on.exit(endwin())
  expect_error(initscr(), NA)
}
test_that('initscr', .initscr())


.raw <- function() {
  on.exit(endwin())
  initscr()
  expect_error(raw(), NA)
}
test_that('raw', .raw())
