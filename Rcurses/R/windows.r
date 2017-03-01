#' get the stdscr window as am external pointer
#'
#' @return a new window as an external pointer
#' @export
#' @family window
stdscr <- function() {
  .call('_stdscr')

}

#' draw a box around a window
#'
#' @param win 	a window
#' @export
#' @family window
box <- function(win = stdscr()) {
  .call('_box00', win)
  invisible()
}


#' create a new window
#'
#' with defaults create a full-screen window
#'
#' If either nlines or ncols is zero, they default to
#'      LINES - begin_y and
#'      COLS - begin_x.
#'
#'
#' @return a new window as an external pointer
#' @export
#' @family window
newwin <- function(nlines = 0, ncols = 0, y = 0, x = 0) {
  .call('_newwin', as.integer(c(nlines, ncols, y, x)))
}


#' delete the window
#'
#' free all memo-ry associated with it (it does not actually erase the win-
#'      dow's screen image).  Subwindows must  be  deleted  before
#'      the main window can be deleted.
#'
#' @param win	a window object as an external pointer
#' @return TRUE iff the window has been deleted
#' @export
#' @family window
delwin <- function(win) {
  as.logical(.call('_delwin', win))
}

