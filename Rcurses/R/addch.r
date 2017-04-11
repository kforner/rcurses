### ncurses curs_addch functions
# cf http://invisible-island.net/ncurses/man/curs_addch.3x.html

#' work much like printf()
#'
#' If you want to move the cursor first and then print using printw() function,
#' use move() first and then use printw()
#'
#' @param ch 		a character to print
#' @export
#' @family output
waddch <- function(ch, win = stdscr()) {
  if (length(ch) != 1 || nchar(ch) != 1)
    stop('give a single character')
  status <- as.logical(.call('_waddch', win, as.character(ch)))

  invisible(status)
}
