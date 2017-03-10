#' draw a box around the edges of a window
#'
#' @inheritParams window_params
#' @param ls	left side
#' @param rs	right side
#' @param ts 	top side
#' @param bs	bottom side
#' @param tl	top left-hand corner
#' @param tr	top right-hand corner
#' @param bl	bottom left-hand corner
#' @param br	bottom right-hand corner
#' @export
#' @family window
border <- function(win = stdscr(),
  ls = 0, rs = 0, ts = 0, bs = 0,
  tl = 0, tr = 0, bl = 0, br = 0) {

  .code <- function(x) {
    if (is.character(x)) x <- charToRaw(x)[1]
    as.integer(x)
  }

  .call('_wborder', win,
    .code(ls),
    .code(rs),
    .code(ts),
    .code(bs),
    .code(tl),
    .code(tr),
    .code(bl),
    .code(br))
  invisible()
}


#' draw a box around a window
#'
#' @inheritParams window_params
#' @export
#' @family window
box <- function(win = stdscr()) {
  .call('_box00', win)
  invisible()
}