### initialization functions

#' initializes the terminal in curses mode.
#'
#' In some implementations, it clears the screen and presents a blank screen.
#'
#' @export
#' @seealso endwin
#' @family init
initscr <- function() .c('_initscr')


#' evaluate some code inside an initialized screen
#'
#' @param code	the code to evaluate
#' @export
#' @family init
with_initscr <- function(code)
{
  initscr()
  on.exit(endwin(), add = TRUE)
  force(code)
}


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
