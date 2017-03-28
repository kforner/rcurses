#' window params
#'
#' @param win		a window object as an external pointer
#' @param nlines 	the number of lines of the window
#' @param ncols		the number of columns of the window
#' @param	y				the upper y position
#' @param x				the left x position
#'
#' @name window_params
#' @keywords internal
NULL





#' create a new window
#'
#' with defaults create a full-screen window
#'
#' If either nlines or ncols is zero, they default to
#'      LINES - begin_y and
#'      COLS - begin_x.
#'
#' @inheritParams window_params
#' @return a new window as an external pointer
#' @export
#' @family window
newwin <- function(nlines = 0, ncols = 0, y = 0, x = 0) {
  .call('_newwin', as.integer(c(nlines, ncols, y, x)))
}

#' create a new sub window
#'
#' with defaults create a full-screen window
#' The subwindow shares memory with  the  window
#'       orig,  so that changes made to one window will affect both
#'       windows.  When using this routine, it is necessary to call
#'       touchwin  or  touchline on orig before calling wrefresh on
#'      the subwindow.
#'
#' @inheritParams window_params
#' @return a new window as an external pointer
#' @export
#' @family window
subwin <- function(win, nlines, ncols, y, x) {
  .call('_subwin', win, as.integer(c(nlines, ncols, y, x)))
}

#' create a new sub window with positions relative to its parent window
#'
#' Calling derwin is the same as calling subwin, except  that
#' begin_y and begin_x are relative to the origin of the win-
#'  dow orig rather than the screen.
#'
#' @inheritParams window_params
#' @return a new window as an external pointer
#' @export
#' @family window
derwin <- function(win, nlines, ncols, y, x) {
  .call('_derwin', win, as.integer(c(nlines, ncols, y, x)))
}

#'  moves a derived window (or subwindow) inside its parent window.
#'
#' The screen-relative parameters of the  window are not changed.
#' This routine is used to display different parts of the  parent  window
#'  at  the  same physical position on the screen.
#'
#' @inheritParams window_params
#' @return TRUE iff the window has been moved
#' @export
#' @family window
mvderwin <- function(win, y, x) {
  invisible(as.logical(.call('_mvderwin', win, as.integer(y), as.integer(x))))
}


#' creates  an exact duplicate of a window
#'
#' @inheritParams window_params
#' @return a new window as an external pointer
#' @export
#' @family window
dupwin <- function(win) {
  .call('_dupwin', win)
}


#' delete the window
#'
#' free all memory associated with it (it does not actually erase the win-
#'      dow's screen image).  Subwindows must  be  deleted  before
#'      the main window can be deleted.
#'
#' @inheritParams window_params
#' @return TRUE iff the window has been deleted
#' @export
#' @family window
delwin <- function(win) {
  invisible(as.logical(.call('_delwin', win)))
}


#' moves the window so that the upper left-hand corner is at position (x, y)
#'
#' If the move would cause the
#'       window to be off the screen, it is an error and the window
#'       is not moved.  Moving subwindows is allowed, but should be
#'       avoided.
#'
#' @inheritParams window_params
#'
#' @return TRUE iff the window has been moved
#' @export
#' @family window
mvwin <- function(win, y, x) {
  invisible(as.logical(.call('_mvwin', win, as.integer(y), as.integer(x))))
}


#' touches all locations in ancestors of  win that  are changed in win.
#'
#' @inheritParams window_params
#' @export
#' @family window
wsyncup <- function(win) {
  .call('_wsyncup', win)
  invisible()
}

#' setup automatic window wync
#'
#' @inheritParams window_params
#' @param bf	if TRUE then wsyncup is called automatically whenever
#' 						there is a change in the window.
#' @return TRUE on success
#' @export
#' @family window
syncok <- function(win, bf) {
  invisible(as.logical(.call('_syncok', win, as.integer(bf))))
}
