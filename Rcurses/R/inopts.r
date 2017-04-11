### ncurses input options

#' disable line buffering and erase/kill character-processing
#'
#'      Normally, the tty driver buffers typed characters until a newline or carriage return is typed.
#' The cbreak routine disables line buffering and erase/kill character-processing
#' (interrupt and flow control characters are unaffected), making characters typed by the user
#' immediately available to the program.
#' The nocbreak routine  returns the terminal to normal (cooked) mode.
#'
#'        Initially  the terminal may or may not be in cbreak mode, as the mode is inherited; therefore, a program should
#'        call cbreak or nocbreak explicitly.  Most interactive programs using curses set the  cbreak  mode.
#'  Note  that
#'        cbreak  overrides raw.
#' [See getch(3NCURSES) for a discussion of how these routines interact with echo and noecho.]
#'
#' @param		bf	whether to enable or disable
#' @export
#' @seealso nocbreak
#' @family inopts
cbreak <- function(bf = TRUE) {
  res <- .c('_cbreak', bf = as.integer(bf),status = integer(1))
  if (res$status == 0) stop('error in cbreak')
  invisible()
}

#' returns the terminal to normal (cooked) mode.
#'
#' @export
#' @seealso cbreak
#' @family inopts
nocbreak <- function() cbreak(FALSE)

#' place the terminal into raw mode.
#'
#' Raw mode is similar to cbreak mode, in  that
#' characters typed are immediately passed through to the us-
#'   er program.  The differences are that in raw mode, the in-
#'   terrupt,  quit,  suspend,  and flow control characters are
#' all passed through uninterpreted, instead of generating  a
#' signal.   The  behavior  of the BREAK key depends on other
#' bits in the tty driver that are not set by curses.
#'
#' @param		bf	whether to enable or disable
#' @export
#' @seealso noraw
#' @family inopts
raw <- function(bf = TRUE) {
  res <- .c('_raw', bf = as.integer(bf), status = integer(1))
  if (res$status == 0) stop('error in raw')
}

#' place the terminal out of raw mode.
#'#'
#' @export
#' @seealso raw
#' @family inopts
noraw <- function() raw(FALSE)



#' control whether characters typed by the user are echoed  by  getch()
#'  as  they  are typed.
#'
#' Echoing by the tty driver is always disabled, but
#' initially getch is in echo mode, so characters  typed  are
#' echoed.  Authors of most interactive programs prefer to do
#' their own echoing in a controlled area of the  screen,  or
#' not  to  echo  at  all, so they disable echoing by calling
#' noecho.
#'
#' @param		bf	whether to enable or disable
#' @export
#' @seealso noecho
#' @family inopts
echo <- function(bf = TRUE) {
  res <- .c('_echo', bf = as.integer(bf), status = integer(1))
  if (res$status == 0) stop('error in raw')
}

#' place the terminal out of raw mode.
#'#'
#' @export
#' @seealso echo
#' @family inopts
noecho <- function() echo(FALSE)



#' output queues associated with the INTR, QUIT and SUSP will be flushed when these control
#' characters are read
#'
#' You may want to call noqiflush in  a
#'        signal  handler  if  you want output to continue as though
#'        the interrupt had not occurred, after the handler exits.
#'
#' @param		bf	whether to enable or disable
#' @export
#' @seealso noqiflush
#' @family inopts
qiflush <- function(bf = TRUE) {
  res <- .c('_qiflush', bf = as.integer(bf))
}

#' normal flush of  input and  output queues associated with the INTR, QUIT and SUSP
#'    characters will not be done
#'
#' @export
#' @seealso qiflush
#' @family inopts
noqiflush <- function() qiflush(FALSE)


#' similar to cbreak mode, but blocks for tenths tenths of seconds
#'
#' Use nocbreak to leave half-delay mode.
#'
#' @param tenths	the number of tenths of seconds to block
#' @return FALSE iff nothing  has  been typed during the blocking
#' @export
#' @seealso nocbreak
#' @family inopts
halfdelay <- function(tenths) {
  res <- .c('_halfdelay', tenths = as.integer(tenths), status = integer(1))
  as.logical(res$status)
}

#' enable/disable the interrupt flush mode
#'
#' If  the  intrflush  option is enabled (bf is TRUE), and an
#'        interrupt key  is  pressed  on  the  keyboard  (interrupt,
#'        break,  quit),  all output in the tty driver queue will be
#'        flushed, giving the effect of faster response to  the  in-
#'        terrupt, but causing curses to have the wrong idea of what
#'        is on the screen.  Disabling the option (bf is FALSE) pre-
#'        vents  the flush.  The default for the option is inherited
#'        from the tty driver settings.
#'
#' @param		bf	whether to enable or disable
#' @export
#' @family inopts
intrflush <- function(bf = TRUE) {
  res <- .c('_intrflush', bf = as.integer(bf), status = integer(1))
  if (res$status == 0) stop('error in intrflush')
}

#' enable/disable the keypad of the user's terminal.
#'
#' If enabled (bf is TRUE), the user can press a  func-
#'        tion  key  (such as an arrow key) and wgetch(3x) returns a
#'        single  value  representing  the  function  key,   as   in
#'        KEY_LEFT.   If  disabled  (bf  is  FALSE), curses does not
#'        treat function keys specially and the program has  to  in-
#'        terpret the escape sequences itself.  If the keypad in the
#'        terminal can be turned on (made to transmit) and off (made
#'        to work locally), turning on this option causes the termi-
#'        nal keypad to be turned on when wgetch(3x) is called.  The
#'        default value for keypad is FALSE.
#'
#' @inheritParams window_params
#' @param		bf	whether to enable or disable
#' @export
#' @family inopts
keypad <- function(win = stdscr(), bf = TRUE) {
  status <- as.logical(.call('_keypad', win, bf))
  if (!status) stop('error in keypad()')
  invisible()
}


#' enable/disable the terminal to returns 8 (resp.  7) significant
#'  bits on input
#'
#' Initially, whether the terminal returns 7 or 8 significantss a  func-
#'        bits on input depends on the control mode of the tty driv-and wgetch(3x) returns a
#'        er  [see  termio(7)].  To force 8 bits to be returned, in-function  key,   as   in
#'        voke meta(win, TRUE); this is equivalent, under POSIX,  to FALSE), curses does not
#'        setting  the CS8 flag on the terminal.  To force 7 bits tothe program has  to  in-
#'        be returned, invoke meta(win, FALSE); this is  equivalent,f.  If the keypad in the
#'        under POSIX, to setting the CS7 flag on the terminal.  The transmit) and off (made
#'        window argument, win, is always ignored.  If the  terminfooption causes the termi-
#'        capabilities  smm (meta_on) and rmm (meta_off) are definedetch(3x) is called.  The
#'        for the  terminal,  smm  is  sent  to  the  terminal  when
#'        meta(win,  TRUE)  is called and rmm is sent when meta(win,
#'        FALSE) is called.
#' @param		bf	whether to enable or disable
#' @export
#' @family inopts
meta <- function(bf = TRUE) {
  res <- .c('_meta', bf = as.integer(bf), status = integer(1))
  if (res$status == 0) stop('error in meta()')
  invisible()
}


#' enable/disable the keypad of the user's terminal.
#'
#' If enabled (bf is TRUE), the user can press a  func-
#'        tion  key  (such as an arrow key) and wgetch(3x) returns a
#'        single  value  representing  the  function  key,   as   in
#'        KEY_LEFT.   If  disabled  (bf  is  FALSE), curses does not
#'        treat function keys specially and the program has  to  in-
#'        terpret the escape sequences itself.  If the keypad in the
#'        terminal can be turned on (made to transmit) and off (made
#'        to work locally), turning on this option causes the termi-
#'        nal keypad to be turned on when wgetch(3x) is called.  The
#'        default value for keypad is FALSE.
#'
#' @inheritParams window_params
#' @param		delay		milliseconds if > 0, 0 means non-blocking, < 0 means blocking
#' @export
#' @family inopts
timeout <- function(delay, win = stdscr()) {
  .call('_wtimeout', win, as.integer(delay))
  invisible()
}

#' cause getch to be a non-blocking call
#'
#' If  no input is ready, getch returns ERR.  If disabled (bf
#'     is FALSE), getch waits until a key is pressed.
#'
#' While interpreting an input  escape  sequence,  wgetch(3x)
#' sets a timer while waiting for the next character.  If no-
#'   timeout(win, TRUE) is called, then wgetch does not  set  a
#' timer.  The purpose of the timeout is to differentiate be-
#'   tween sequences received from a  function  key  and  those
#' typed by a user.
#'
#' @inheritParams window_params
#' @param		bf	whether to enable or disable
#' @return FALSE iff nothing  has  been typed during the blocking
#' @export
#' @seealso getch
#' @family inopts
nodelay <- function(bf = TRUE, win = stdscr()) {
  status <- as.logical(.call('_nodelay', win, as.integer(bf)))
  if (!status) stop('error in nodelay()')
  invisible()
}
