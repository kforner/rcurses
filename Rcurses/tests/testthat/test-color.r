context('colors')

.has_colors <- function() {
  on.exit(endwin())
  initscr()
  expect_is(has_colors(), "logical")
}
test_that('has_colors', .has_colors())


.COLOR <- function() {
  expect_is(COLOR, 'list')
  expect_is(COLOR$BLACK, 'integer')
}
test_that('COLOR', .COLOR())



.color_content <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  col <- color_content(COLOR$RED)

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

  init_pair(2, COLOR$RED, COLOR$BLACK)

  cols <- pair_content(2)
  expect_equal(cols$F, COLOR$RED)
  expect_equal(cols$B, COLOR$BLACK)
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



.use_default_colors <- function() {
  on.exit(endwin())
  initscr()
  skip_if_not(has_colors(), 'no color support')
  start_color()

  expect_error(use_default_colors(), NA)
}
test_that('use_default_colors', .use_default_colors())

