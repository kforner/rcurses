#' can the terminal manipulate colord
#'
#' @return TRUE iff only it can
#' @export
#' @family color
has_colors <- function() {
  res <- .c('_has_colors', status = integer(1))
  as.logical(res$status)
}

#' allocate the color table
#'
#' @export
#' @family color
start_color <- function() {
  res <- .c('_start_color', status = integer(1))
  if (!as.logical(res$status)) stop("Error in init_start_color()")
  invisible()
}

#' convert the pair to a video attribute
#'
#' @param pair	the pair number
#' @export
#' @family color
#' @family attributes
COLOR_PAIR <- function(pair) {
  res <- .c('_color_pair', as.integer(pair), vattr = integer(1))

  res$vattr
}


#' changes the definition of a color pair.
#'
#' @param pair	the pair number
#' @param f			the foreground color number
#' @param b			the background color number
#'
#' @export
#' @family color
init_pair <- function(pair, b, f) {
  res <- .c('_init_pair',
    as.integer(pair), as.integer(b), as.integer(f), status = integer(1))
  if (!as.logical(res$status))
    stop("Error in init_pair(), can not allocate color pair")
  invisible()
}

#' set the current color
#'
#' @param pair	the pair number
#'
#' @export
#' @family color
color_on <- function(pair) {
  attrs <- COLOR_PAIR(pair)
  .c('_attron', attrs, as.integer(length(attrs)))
}

#' unset the current color
#'
#' @param pair	the pair number
#'
#' @export
#' @family color
color_off <- function(pair) {
  attrs <- COLOR_PAIR(pair)
  .c('_attroff', attrs, as.integer(length(attrs)))
}

#' Color constants
#'
#' @seealso keyname
#' @export
#' @name COLORS
#' @family color
NULL
delayedAssign('COLORS', assign_colors())

assign_colors <- function() {
  cnames <- c("COLOR_BLACK", "COLOR_RED", "COLOR_GREEN", "COLOR_YELLOW",
    "COLOR_BLUE", "COLOR_MAGENTA", "COLOR_CYAN", "COLOR_WHITE")
  .name_to_col <- function(cn) {
    .c(paste0('_', cn), color = integer(1))$color
  }

  cols <- lapply(cnames, .name_to_col)
  names(cols) <- sub('COLOR_', '', cnames)

  cols
}
