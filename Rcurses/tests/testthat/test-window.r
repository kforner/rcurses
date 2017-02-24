context('window')

.box <- function() {
  on.exit(endwin())
  initscr()

  expect_error(box(), NA)
}
test_that('box', .box())

