context('window')

.box <- function() {
  on.exit(endwin())
  initscr()

  expect_error(box(), NA)
}
test_that('box', .box())

.newwin_delwin <- function() {
  win <- newwin()
  expect_is(win, 'externalptr')

  expect_true(delwin(win))
  expect_false(delwin(win))
}
test_that('box', .box())