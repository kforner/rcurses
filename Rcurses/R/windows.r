#' get the stdscr window as am external pointer
#'
#' @export
#' @family window
stdscr <- function() {
  .call('_stdscr')

}

