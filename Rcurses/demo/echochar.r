echochar_demo <- function() {
  PAIR_DIGITS <- 1
  PAIR_OTHERS <- 2
  PAIR_FRAMES <- 3

  on.exit(endwin())
  initscr()


  if (has_colors()) {
    start_color()
  }

  printw("coucou\n")
  refresh()

  Sys.sleep(1)


  clear()
  refresh()
}


echochar_demo()
