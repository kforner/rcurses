

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
#' @param ...		additional args for sprintf
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
