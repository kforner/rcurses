

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


r_attrs_to_c <- function(attrs) {
  bads <- setdiff(attrs, names(ATTRIBUTES))
  if (length(bads) > 0)
    stop(sprintf('bad attributes: "%s"', paste(bads, collapse = ",")))

  values <- ATTRIBUTES[attrs]
  Reduce(bitwOr, values)
}


#' turns on the given attributes without affecting any others.
#'
#' @export
#' @family attributes
attron <- function(...) {
  dots <- as.character(as.list(...))
  c_attrs <- as.integer(r_attrs_to_c(dots))

  .c('_attron', c_attrs)
}

#' turns off the given attributes without affecting any others.
#'
#' @export
#' @family attributes
attroff <- function(...) {
  dots <- as.character(as.list(...))
  c_attrs <- as.integer(r_attrs_to_c(dots))

  .c('_attroff', c_attrs)
}

