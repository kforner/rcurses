#' refresh the default window
#' @export
#' @family output
refresh <- function() .c('refresh')

#' refresh a window
#' @inheritParams window_params
#' @export
#' @family output
wrefresh <- function(win) {
  invisible(.call('_wrefresh', win))
}
