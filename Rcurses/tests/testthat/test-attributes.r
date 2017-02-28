context('attributes')


.with_attr <- function() {
  res <- with_attr(1 + 1, A_BOLD, A_REVERSE)
  expect_equal(res, 2)
}
test_that('with_attr', .with_attr())


.attron <- function() {
  attron(A_BOLD)

  attron(A_REVERSE, A_BOLD, A_NORMAL)

  attron(A_NORMAL)
}
test_that('attron', .attron())



#.r_attrs_to_c <- function() {
#  r_attrs_to_c <- Rcurses:::r_attrs_to_c
#
#  ATTRS <- as.list(attributes())
#
#  an <- r_attrs_to_c('A_NORMAL')
#  expect_equal(an, ATTRS$A_NORMAL)
#
#  ab <- r_attrs_to_c('A_BOLD')
#  expect_equal(ab, ATTRS$A_BOLD)
#
#  ar <- r_attrs_to_c('A_REVERSE')
#  expect_equal(ar, ATTRS$A_REVERSE)
#
#  mix <- r_attrs_to_c(c('A_REVERSE', 'A_BOLD', 'A_NORMAL'))
#  expect_equal(mix, c(ATTRS$A_REVERSE, ATTRS$A_BOLD, ATTRS$A_NORMAL))
#  #expect_equal(mix, bitwOr(ab, bitwOr(ar, an)))
#
#  expect_equal(r_attrs_to_c('A_BOLD'), r_attrs_to_c(c('A_BOLD', 'A_BOLD')))
#}
#test_that('r_attrs_to_c', .r_attrs_to_c())



.attributes <- function() {
  attrs <- attributes()
  expect_length(attrs, 11)

  expect_is(attrs, 'integer')

  expect_true('A_NORMAL' %in% names(attrs))
  expect_equal(attrs[['A_NORMAL']], 0)
}
test_that('attributes', .attributes())

