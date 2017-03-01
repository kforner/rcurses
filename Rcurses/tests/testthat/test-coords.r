context('coords')

.getmaxyx <- function() {
  on.exit(endwin())
  initscr()

  coords <- getmaxyx()
  expect_identical(names(coords), c('rows', 'cols'))

  expect_is(coords$rows, 'integer')
  expect_is(coords$cols, 'integer')
}
test_that('getmaxyx', .getmaxyx())


.lines_cols <- function() {
  expect_gt(COLS(), 0)
  expect_gt(LINES(), 0)
}
test_that('lines_cols', .lines_cols())