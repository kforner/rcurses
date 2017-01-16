library(inline)


# taken from http://www.tldp.org/HOWTO/html_single/NCURSES-Programming-HOWTO/#HELLOWORLD
code <- '
	initscr();			/* Start curses mode 		  */
	printw("Hello World !!!");	/* Print Hello World		  */
	refresh();			/* Print it on to the real screen */
	getch();			/* Wait for user input */
	endwin();			/* End curses mode		  */
	return R_NilValue;
'

hello <- cfunction(body = code,
  language = 'C',
  includes = '#include <ncurses.h>',
  libargs = '-lncurses')

