context('getch')

.has_key <- function() {
  on.exit(endwin())
  keypad()
  expect_true(has_key(KEYS$KEY_UP))
}
test_that('has_key', .has_key())

