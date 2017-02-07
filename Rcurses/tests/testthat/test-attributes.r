context('attributes')

.attributes <- function() {
  attrs <- attributes()

  expect_is(attrs, 'integer')
  expect_length(attrs, 11)
  expect_true('A_NORMAL' %in% names(attrs))
  expect_equal(attrs[['A_NORMAL']], 0)
}
test_that('attributes', .attributes())

