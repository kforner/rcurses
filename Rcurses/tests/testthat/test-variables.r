context('variables')



.variables <- function() {
  on.exit(endwin())
  initscr()

  expect_gt(COLOR_PAIRS(), 0)
  expect_gt(COLORS(), 0)

  expect_gt(ESCDELAY(), 0)

  expect_gt(COLS(), 0)
  expect_gt(LINES(), 0)

  expect_gt(TABSIZE(), 0)

  expect_is(stdscr(), 'externalptr')
  expect_is(curscr(), 'externalptr')
  expect_is(newscr(), 'externalptr')

}
test_that('variables', .variables())
