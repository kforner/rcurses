context('examples')

.example_hello <- function() {
  expect_error(example_hello(0.2), NA)
}
test_that('example_hello', .example_hello())

