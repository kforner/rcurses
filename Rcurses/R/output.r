#'  tell the curses system to dump the contents of the buffer to the screen.
#'
#' The philosophy behind all this is to allow the programmer to do multiple
#' updates on the imaginary screen or windows and do a refresh once all his
#'  screen update is done. refresh() checks the window and updates
#'  only the portion which has been changed.
#'  This improves performance and offers greater flexibility too. But, it is sometimes frustrating to beginners. A common mistake committed by beginners is to forget to call refresh() after they did some update through printw() class of functions. I still forget to add it sometimes :-)
#'
#' @export
#' @family output
refresh <- function() .c('refresh')

#' work much like printf()
#'
#' If you want to move the cursor first and then print using printw() function,
#' use move() first and then use printw()
#'
#' @param str 	a string to print
#' @export
#' @family output
printw <- function(str) .c('_printw', str, length(str))

#' perform a cursor movement using wmove then printw()
#'
#' may die if the position is outside the window
#'
#' @param y			the y position (aka the row)
#' @param x			the x position (aka the column)
#' @param str 	a string to print via sprintf
#' @param ...		additiona ars for sprintf
#' @export
#' @family output
mvprintw <- function(y, x, str, ...) {
  str <- sprintf(str, ...)

  if (length(str) != 1) stop("str must be a string")
  status <- 0L

  res <- .c('_mvprintw', as.integer(y), as.integer(x), str, length(str),
    status = status)

  if (res$status == 0)
    stop('error in mvprintw, probably a position outside the window')
  invisible()
}
#' clear the screen
#'
#' The erase and werase routines copy blanks to every position in the window,
#' clearing the screen.
#' The  clear  and wclear routines are like erase and werase,
#'  but they also call clearok, so that the screen is cleared completely
#'  on the next call to wrefresh for that window and repainted from scratch.
#'
#' @export
#' @family output
clear <- function() .c('_clear')
