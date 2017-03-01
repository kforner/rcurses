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
test_that('newwin_delwin', .newwin_delwin())



.mvwin <- function() {
  win <- newwin()
  on.exit(delwin(win))

  expect_true(mvwin(win , 0, 0))
}
test_that('mvwin', .mvwin())


