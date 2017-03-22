context('colors')

.has_colors <- function() {
  on.exit(endwin())
  initscr()
  expect_is(has_colors(), "logical")
}
test_that('has_colors', .has_colors())


.COLORS <- function() {
  expect_is(COLORS, 'list')
  expect_is(COLORS$BLACK, 'integer')
}
test_that('COLORS', .COLORS())

