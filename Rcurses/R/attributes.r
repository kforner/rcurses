

#' get the attributes values
#'
#' @export
#' @family attributes
attributes <- function() {
  attrs <- integer(11)
  res <- .c('_attributes', attrs = attrs)

  names(res$attrs) <- c("A_NORMAL", "A_STANDOUT", "A_UNDERLINE", "A_REVERSE", "A_BLINK",
    "A_DIM", "A_BOLD", "A_PROTECT", "A_INVIS", "A_ALTCHARSET", "A_CHARTEXT"
  )

  res$attrs
}

#
##' turns on the given attributes without affecting any others.
##'
##' @export
##' @family attributes
#attron <- function(...) {
#  #  altcharset = 0L,
#  #  charset =  0L,
##  color_pair = 0
#  normal = FALSE,
#  standout = FALSE,
#  underline = FALSE,
#  reverse = FALSE,
#  blink = FALSE,
#  dim = FALSE,
#  bold = FALSE,
#  protect = FALSE,
#  invis = FALSE,
#  italic = FALSE)
#{
#  attrs <- as.integer(c(
#      normal,
#      standout,
#      underline,
#      reverse,
#      blink,
#      dim,
#      bold,
#      protect,
#      invis,
#      italic))
#  .c('_attron', attrs)
#}