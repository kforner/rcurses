context('examples')

.example_hello <- function() {
  expect_error(example_hello(0.2), NA)
}
test_that('example_hello', .example_hello())



.example_mvprintw <- function() {
  expect_error(example_mvprintw(0.2), NA)
}
test_that('example_mvprintw', .example_mvprintw())