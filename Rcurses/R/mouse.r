

nb_mouse_events <- function() {
  res <- .c('_nb_mouse_events', nb = integer(1))
  res$nb
}

MOUSE_EVENT_NAMES <- c('BUTTON1_PRESSED',
'BUTTON1_RELEASED',
'BUTTON1_CLICKED',
'BUTTON1_DOUBLE_CLICKED',
'BUTTON1_TRIPLE_CLICKED',
'BUTTON2_PRESSED',
'BUTTON2_RELEASED',
'BUTTON2_CLICKED',
'BUTTON2_DOUBLE_CLICKED',
'BUTTON2_TRIPLE_CLICKED',
'BUTTON3_PRESSED',
'BUTTON3_RELEASED',
'BUTTON3_CLICKED',
'BUTTON3_DOUBLE_CLICKED',
'BUTTON3_TRIPLE_CLICKED',
'BUTTON4_PRESSED',
'BUTTON4_RELEASED',
'BUTTON4_CLICKED',
'BUTTON4_DOUBLE_CLICKED',
'BUTTON4_TRIPLE_CLICKED',
#'BUTTON5_PRESSED',
#'BUTTON5_RELEASED',
#'BUTTON5_CLICKED',
#'BUTTON5_DOUBLE_CLICKED',
#'BUTTON5_TRIPLE_CLICKED',
'BUTTON_SHIFT',
'BUTTON_CTRL',
'BUTTON_ALT',
'ALL_MOUSE_EVENTS',
'REPORT_MOUSE_POSITION')

#' fetch the mouse events values
#'
#' @export
#' @family mouse
mouse_events <- function() {
  nb <- nb_mouse_events()
  if (nb != length(MOUSE_EVENT_NAMES))
    stop('length of MOUSE_EVENT_NAMES does not match nb_mouse_events()')

  res <- .c('_mouse_events', events = integer(nb))

  names(res$events) <- MOUSE_EVENT_NAMES

  res$events
}
