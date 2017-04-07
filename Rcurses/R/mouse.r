

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


#' Mouse constants
#'
#' mouse event type masks which may be defined
#'
#' @seealso mouse_events
#' @export
#' @name MOUSE
NULL
delayedAssign('MOUSE', mouse_events())

#' fetch the mouse events masks
#'
#' @export
#' @family mouse
#' @export
mouse_events <- function() {
  nb <- nb_mouse_events()
  if (nb != length(MOUSE_EVENT_NAMES))
    stop('length of MOUSE_EVENT_NAMES does not match nb_mouse_events()')

  res <- .c('_mouse_events', events = integer(nb))

  names(res$events) <- MOUSE_EVENT_NAMES

  as.list(res$events)
}


#' test if the mouse driver has been successfully initialized.
#'
#' @return TRUE iff mouse support is initialized
#' @export
#' @family mouse
#' @export
has_mouse <- function() {
  res <- .c('_has_mouse', out = integer(1))
  as.logical(res$out)
}

#' read the event data and pop the event off the queue
#'
#' @return a R equivalent of the C MEVENT struct as a list, or NULL if no event
#' @export
#' @family mouse
#' @export
getmouse_event <- function() {
  res <- .c('_getmouse',
    id = integer(1),
    x = integer(1),
    y = integer(1),
    z = integer(1),
    bstate = integer(1),
    status = integer(1))

  if (!as.logical(res$status)) return(NULL)
  res$status <- NULL

  res
}


#' set the mouse events to  be  reported.
#'
#' To  make mouse events visible, use the mousemask function.
#' This will set the mouse events to  be  reported.   By  de-
#'        fault,  no  mouse  events are reported.  The function will
#'        return a mask to indicate which  of  the  specified  mouse
#'        events  can be reported; on complete failure it returns 0.
#'        If oldmask is non-NULL, this function fills the  indicated
#'        location  with  the  previous  value of the given window's
#'       mouse event mask.
#'
#'        As a side effect, setting a zero mousemask  may  turn  off
#'        the  mouse pointer; setting a nonzero mask may turn it on.
#'        Whether this happens is device-dependent.
#'
#'
#' @return a named list of effective, old mask:
#'   a mask to indicate which  of  the  specified  mouse events can be reported,
#'  and the previous mask
#' @export
#' @family mouse
#' @export
mousemask <- function(
  mask = bitwOr(MOUSE$ALL_MOUSE_EVENTS, MOUSE$REPORT_MOUSE_POSITION))
{
  res <- .c('_mousemask',
    mask = as.integer(mask),
    effective = integer(1),
    oldmask = integer(1))

  res$mask <- NULL

  invisible(res)
}

