context('examples')


.example_attributes <- function() {
  expect_error(example_attributes(0.2), NA)
}
test_that('example_attributes', .example_attributes())



.example_attron <- function() {
  expect_error(example_attron(0.2), NA)
}
test_that('example_attron', .example_attron())



.example_hello <- function() {
  expect_error(example_hello(0.2), NA)
}
test_that('example_hello', .example_hello())



.example_mvprintw <- function() {
  expect_error(example_mvprintw(0.2), NA)
}
test_that('example_mvprintw', .example_mvprintw())



.example_attron <- function() {
  expect_error(example_attron(0.2), NA)
}
test_that('example_attron', .example_attron())



.example_box <- function() {
  expect_error(example_box(0.2), NA)
}
test_that('example_box', .example_box())


.example_window <- function() {
  expect_error(example_window(0.2), NA)
}
test_that('example_window', .example_window())

