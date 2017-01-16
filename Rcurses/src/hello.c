#include <R.h>
#include <ncurses.h>

void _initscr() { initscr(); }

void _endwin() { endwin(); }

void _print_hello() { printw("Hello World !!!"); }

void _getch() { getch(); }

void _refresh() { refresh(); }

// taken from http://www.tldp.org/HOWTO/html_single/NCURSES-Programming-HOWTO/#HELLOWORLD
void _hello()
{
	initscr();			/* Start curses mode 		  */
	printw("Hello World !!!");	/* Print Hello World		  */
	refresh();			/* Print it on to the real screen */
	getch();			/* Wait for user input */
	endwin();			/* End curses mode		  */
}

