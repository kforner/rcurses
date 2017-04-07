#include <ncurses.h>
#include <assert.h>

int main() {
    int ch, count=0;
    MEVENT event;

    initscr();
//    raw();
    keypad(stdscr, TRUE);
//    noecho();

//    clear();
    //cbreak();

    mousemask(ALL_MOUSE_EVENTS | REPORT_MOUSE_POSITION, NULL);

    while ((ch = getch()) != 'q') {
        count++;
        mvprintw(1, 1, "Has mouse: %d", has_mouse());
        mvprintw(2, 1, "Key code: %x; mouse code:%x, Key Name:%s", ch, KEY_MOUSE,
                 keyname(ch));

        if (ch == KEY_MOUSE) {
            assert(getmouse(&event) == OK);
            mvprintw(3, 3, "Mouse Event: x=%d, y=%d z=%d",
                    event.x, event.y, event.z);
            mvprintw(4, 3, "Mouse device id: %x", event.id);
            mvprintw(5, 3, "Mouse button mask: %x", event.bstate);
        }
        mvprintw(6, 1, "Event number: %4d",count);
        refresh();
    }
    endwin();
}
