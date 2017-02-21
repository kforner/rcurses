#' perform a cursor movement
#'
#' may die if the position is outside the window
#'
#' @param y			the y position (aka the row)
#' @param x			the x position (aka the column)
#' @export
#' @family cursor
move <- function(y, x) {
  res <- .c('_move', as.integer(y), as.integer(x), status = 0L)

  if (res$status == 0)
    stop('error in move, probably a position outside the window')
  invisible()
}

#' get the cursor position
#'
#'@return a list (y, x)
#' @export
#' @family cursor
getyx <- function() {
  res <- .c('_getyx', y = 0L, x = 0L)

  res
}
