context('keys')

.keyname <- function() {
  expect_identical(keyname(32), " ")
  expect_identical(keyname(65), "A")
}
test_that('keyname', .keyname())


.keys <- function() {
  expect_is(KEYS, 'list')
  expect_equal(KEYS[['A']], 65)
  expect_gt(KEYS$KEY_ENTER, 0)
  expect_gt(KEYS$KEY_UP, 0)
}
test_that('keys', .keys())

