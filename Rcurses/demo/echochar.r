echochar_demo <- function() {
  PAIR_DIGITS <- 1
  PAIR_OTHERS <- 2
  PAIR_FRAMES <- 3

  on.exit(endwin())
  initscr()

  nb_cols <- COLORS()

  PAIRS <- integer(nb_cols * nb_cols +10)
  .set_color <- function(fg, bg) {
    pair <-  (fg * nb_cols) + bg
    if (PAIRS[pair + 1] == 0) {
      init_pair(pair + 1, fg, bg)
    }
    attron(COLOR_PAIR(pair))
  }

  use_colors <- FALSE
  if (has_colors()) {
    start_color()
    use_colors <- TRUE
  }

  #curs_set(0);

  r <- LINES() - 4
  c <- COLS() - 4
  last_fg <-  0;
  last_bg <-  0

  keypad()
  nodelay()
  while (getch() != KEYS$q) {
	  x <-  as.integer(c * runif(1) + 2)
	  y <- as.integer(r * runif(1) + 2)
    p <-  if (runif(1) > 0.9) '*' else ' '

    move(y, x)

    if (use_colors) {
	    z <- as.integer(runif(1) * nb_cols)
	    if (runif(1) > 0.01) {
		    .set_color(z, last_bg)
		    last_fg <-  z;
	    } else {
		    .set_color(last_fg, z)
		    last_bg <-  z
        Sys.sleep(0.001)
	    }
	  } else {
	    if (runif(1) <= 0.01) {
		    if (runif(1) > 0.6)
		      attron(A_REVERSE)
		    else
		      attroff(A_REVERSE)
		    #napms(1);
        Sys.sleep(0.001)
	    }
	  }

    echochar(p)
  }


  clear()
  refresh()
}


echochar_demo()
