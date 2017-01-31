### initialization functions

#' initializes the terminal in curses mode.
#'
#' In some implementations, it clears the screen and presents a blank screen.
#'
#' @export
#' @seealso endwin
#' @family init
initscr <- function() .c('_initscr')

#' disable line buffering and signals by keystrokes
#'
#' Normally the terminal driver buffers the characters a user types
#' until a new line or carriage return is encountered.
#' This function disables this buffering.
#'
#' Control characters like suspend (CTRL-Z), interrupt and quit (CTRL-C)
#' are directly passed to the program without generating a signal.
#'
#' @export
#' @seealso cbreak
#' @family init
raw <- function() .c('_raw')

#' end the curses mode
#'
#' endwin() frees the memory taken by curses sub-system and its data structures
#' 	and puts the terminal in normal mode.
#' This function must be called after you are done with the curses mode.
#'
#' @export
#' @seealso initscr
#' @family init
endwin <- function() .c('_endwin')


##' delete the standard screen
##'
##'
##' @export
##' @seealso initscr
##' @family init
#del_std_screen <- function() .c('_del_std_screen')
