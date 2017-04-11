gdc <- function() {
  PAIR_DIGITS <- 1
  PAIR_OTHERS <- 2
  PAIR_FRAMES <- 3

  on.exit(endwin())
  initscr()
  keypad()

  cbreak()
  noecho()
  nodelay()
  #curs_set(0)

  if (has_colors()) {
    bg <- COLOR$BLACK

    res <- try(use_default_colors())
    if (!inherits(res, 'try-error')) {
      bg <- -1
    }

    init_pair(PAIR_DIGITS, COLOR$BLACK, COLOR$RED);
    init_pair(PAIR_OTHERS, COLOR$RED, bg);
    init_pair(PAIR_FRAMES, COLOR$WHITE, bg);

    # (void) attrset(AttrArg(COLOR_PAIR(PAIR_OTHERS), 0))

  }


  clear()
  refresh()
}


gdc()