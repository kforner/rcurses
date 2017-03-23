context('move')

.move_getyx <- function() {
  on.exit(endwin())
  initscr()

  expect_error(move(1, 2), NA)

  expect_equal(getyx(), list(y = 1, x = 2))

  expect_error(move(0, 0), NA)
  expect_equal(getyx(), list(y = 0, x = 0))

  expect_error(wmove(stdscr(), 1, 1), NA)
  expect_equal(getyx(), list(y = 1, x = 1))
}
test_that('move_getyx', .move_getyx())



