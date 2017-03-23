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



.color_content <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  col <- color_content(COLORS$RED)

  expect_gt(col$R, 10)
  expect_equal(col$G, 0)
  expect_equal(col$B, 0)

}
test_that('color_content', .color_content())



.pair_content <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  init_pair(2, COLORS$RED, COLORS$BLACK)

  cols <- pair_content(2)
  expect_equal(cols$F, COLORS$RED)
  expect_equal(cols$B, COLORS$BLACK)
}
test_that('pair_content', .pair_content())



.pair_number <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  vattr <- COLOR_PAIR(1)
  pair <- PAIR_NUMBER(vattr)

  expect_equal(pair, 1)
}
test_that('pair_content', .pair_content())



.assume_default_color <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  expect_error(assume_default_colors(-1,-1), NA)
}
test_that('assume_default_color', .assume_default_color())
