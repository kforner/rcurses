#' can the terminal manipulate colors
#'
#' @return TRUE iff only it can
#' @export
#' @family color
has_colors <- function() {
  res <- .c('_has_colors', status = integer(1))
  as.logical(res$status)
}

#' does the  terminal  supports  colors and can change their definitions
#'
#' Lots of terminals do not support it.
#' Setting TERM=xterm-256color in terminology on ubuntu seem to enable
#' support for it (on terminology and gnome-terminal)
#'
#' @return TRUE iff only it can
#' @export
#' @family color
can_change_color <- function() {
  res <- .c('_can_change_color', status = integer(1))
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


#' get the RGB components of a color
#'
#' @param color		the color index
#' @return the RGB as a named list (R=, G=, B=)
#' @export
#' @family color
color_content <- function(color) {

  res <- .c('_color_content',
    as.integer(as.integer(color)),
    R = integer(1),
    G = integer(1),
    B = integer(1),
    status = integer(1))

  if (!as.logical(res$status))
    stop("Error in color_content()")

  res[2:4]
}


#' find out what colors  a given color-pair consists of
#'
#' @param pair	the pair number
#' @return the colors (foreground, background) as a named list (F, B)
#' @export
#' @family color
pair_content <- function(pair) {

  res <- .c('_pair_content',
    as.integer(pair),
    F = integer(1),
    B = integer(1),
    status = integer(1))

  if (!as.logical(res$status))
    stop("Error in color_content()")

  res[2:3]
}


#' extracts the color value for a video attribute
#'
#' inverse of \link{\code{COLOR_PAIR}}
#'
#' @param vattr		a video attribute
#' @return the pair number
#' @export
#' @family color
PAIR_NUMBER <- function(vattr) {

  res <- .c('_pair_number',
    as.integer(vattr),
    pair = integer(1))

  res$pair
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
  attron(COLOR_PAIR(pair))
}

#' unset the current color
#'
#' @param pair	the pair number
#'
#' @export
#' @family color
color_off <- function(pair) {
  attroff(COLOR_PAIR(pair))
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
