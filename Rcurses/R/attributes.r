#' VIDEO ATTRIBUTES
#'
#'               A_NORMAL       Normal display (no highlight)
#'               A_STANDOUT     Best highlighting mode of the terminal.
#'               A_UNDERLINE    Underlining
#'               A_REVERSE      Reverse video
#'               A_BLINK        Blinking
#'               A_DIM          Half bright
#'               A_BOLD         Extra bright or bold
#'               A_PROTECT      Protected mode
#'               A_INVIS        Invisible or blank mode
#'               A_ALTCHARSET   Alternate character set
#'               A_ITALIC       Italics (non-X/Open extension)
#'               A_CHARTEXT     Bit-mask to extract a character
#' @aliases A_NORMAL A_STANDOUT A_UNDERLINE A_REVERSE A_BLINK A_DIM A_BOLD A_PROTECT A_INVIS A_ALTCHARSET A_CHARTEXT
#' @rdname VIDEO_ATTRIBUTES
#' @export A_NORMAL A_STANDOUT A_UNDERLINE A_REVERSE A_BLINK A_DIM A_BOLD
#' @export A_PROTECT A_INVIS A_ALTCHARSET A_CHARTEXT
ATTRIBUTE_NAMES <- c("A_NORMAL", "A_STANDOUT", "A_UNDERLINE", "A_REVERSE", "A_BLINK",
  "A_DIM", "A_BOLD", "A_PROTECT", "A_INVIS", "A_ALTCHARSET", "A_CHARTEXT")

# use lapply because it fixes the problem of referencing symbols in loops
invisible(lapply(ATTRIBUTE_NAMES, function(x) {
  delayedAssign(x, attributes()[x], assign.env = parent.frame(2))
}))



#' get the attributes values
#'
#' @export
#' @family attributes
attributes <- function() {
  attrs <- integer(11)
  res <- .c('_attributes', attrs = attrs)

  names(res$attrs) <- ATTRIBUTE_NAMES

  res$attrs
}


#r_attrs_to_c <- function(attrs) {
#  bads <- setdiff(attrs, names(ATTRIBUTES))
#  if (length(bads) > 0)
#    stop(sprintf('bad attributes: "%s"', paste(bads, collapse = ",")))
#
#  values <- unique(ATTRIBUTES[attrs])
#
##  Reduce(bitwOr, values)
#  values
#}

#' evaluate some code with the the given attributes on
#'
#' @param code	the code to evaluate
#' @param ...		passed to \code{\link{attron}} and \code{\link{attroff}}
#' @export
#' @family attributes
with_attr <- function(code, ...)
{
  attron(...)
  on.exit(attroff(...), add = TRUE)
  force(code)
}

#' turns on the given attributes without affecting any others.
#'
#' @param ...	any valid attributes
#' @export
#' @family attributes
attron <- function(...) {
  attrs <- as.integer(list(...))
  .c('_attron', attrs, as.integer(length(attrs)))
}

#' turns off the given attributes without affecting any others.
#'
#' @param ...	any valid attributes
#' @export
#' @family attributes
attroff <- function(...) {
  attrs <- as.integer(list(...))
  .c('_attroff', attrs, as.integer(length(attrs)))
}

