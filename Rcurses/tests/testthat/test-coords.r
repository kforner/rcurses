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

