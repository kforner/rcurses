context('mouse')

.mouse_events <- function() {
  events <- mouse_events()
  expect_is(events, 'list')

  expect_true('BUTTON1_PRESSED' %in% names(events))
  expect_true('ALL_MOUSE_EVENTS' %in% names(events))

  expect_equal(anyDuplicated(events), 0)

}
test_that('mouse_events', .mouse_events())



.MOUSE <- function() {
  expect_identical(MOUSE, mouse_events())
}
test_that('MOUSE', .MOUSE())



.has_mouse <- function() {
  expect_false(has_mouse())

#  on.exit(endwin())
#  initscr()
#  expect_true(has_mouse())
}
test_that('has_mouse', .has_mouse())



