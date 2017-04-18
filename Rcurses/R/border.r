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
#' @family border
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
#' @family border
box <- function(win = stdscr()) {
  .call('_box00', win)
  invisible()
}


#' draw  a  vertical  (top  to bottom) line
#'
#'  The vline and wvline functions draw  a  vertical  (top  to
#'        bottom) line using ch starting at the current cursor posi-
#'        tion in the window.  The current cursor  position  is  not
#'        changed.   The  line  is  at most n characters long, or as
#'        many as fit into the window.
#'
#' @inheritParams window_params
#' @param ch 		a character to draw the line with
#' @param n			the max nb of characters to draw
#' @export
#' @family border
wvline <- function(win, ch, n) {
  if (length(ch) != 1 || nchar(ch) != 1)
    stop('give a single character')
  status <- as.logical(.call('_wvline', win, as.character(ch), as.integer(n)))

  invisible(status)
}

#' draw  a  vertical  (top  to bottom) line
#'
#'  The vline and wvline functions draw  a  vertical  (top  to
#'        bottom) line using ch starting at the current cursor posi-
#'        tion in the window.  The current cursor  position  is  not
#'        changed.   The  line  is  at most n characters long, or as
#'        many as fit into the window.
#'
#' @inheritParams window_params
#' @param ch 		a character to draw the line with
#' @param n			the max nb of characters to draw
#' @export
#' @family border
wvline <- function(win, ch, n) {
  if (length(ch) != 1 || nchar(ch) != 1)
    stop('give a single character')
  status <- as.logical(.call('_wvline', win, as.character(ch), as.integer(n)))

  invisible(status)
}



#' vline
#'
#' @inheritParams wvline
#' @export
#' @family border
vline <- function(ch, n, win = stdscr()) {
  wvline(win, ch, n)
}
