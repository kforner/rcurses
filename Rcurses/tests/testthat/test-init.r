context('init')

.initscr <- function() {
  on.exit(endwin())
  expect_error(initscr(), NA)
}
test_that('initscr', .initscr())

