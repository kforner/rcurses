context('keys')

.keys <- function() {
  expect_is(KEYS, 'list')
  expect_gt(KEYS$UP, 0)
  expect_gt(KEYS$F10, 0)
}
test_that('keys', .keys())

