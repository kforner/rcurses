#' get the stdscr window as am external pointer
#'
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