context('window')

.box <- function() {
  on.exit(endwin())
  initscr()

  expect_error(box(), NA)
}
test_that('box', .box())



.newwin_delwin <- function() {
  on.exit(endwin())
  initscr()
  win <- newwin()
  expect_is(win, 'externalptr')

  expect_true(delwin(win))
  expect_false(delwin(win))
}
test_that('newwin_delwin', .newwin_delwin())


.subwin <- function() {
  on.exit(endwin())
  initscr()

  win <- newwin()
  sub <- subwin(win, 2, 2, 0, 0)

  delwin(sub)
  delwin(win)
}
test_that('subwin', .subwin())



.derwin <- function() {
  on.exit(endwin())
  initscr()

  win <- newwin()
  sub <- derwin(win, 2, 2, 0, 0)

  delwin(sub)
  delwin(win)
}
test_that('derwin', .derwin())



.mvderwin <- function() {
  on.exit(endwin())
  initscr()

  win <- newwin()
  sub <- derwin(win, 2, 2, 0, 0)

  expect_true(mvderwin(sub, 0, 0))

  delwin(sub)
  delwin(win)
}
test_that('mvderwin', .mvderwin())



.dupwin <- function() {
  on.exit(endwin())
  initscr()

  win <- newwin()
  dup <- dupwin(win)

  delwin(dup)
  delwin(win)
}
test_that('dupwin', .dupwin())


.mvwin <- function() {
  win <- newwin()
  on.exit(delwin(win))

  expect_true(mvwin(win , 0, 0))
}
test_that('mvwin', .mvwin())



.wsyncup <- function() {
  on.exit(endwin())
  initscr()
  wsyncup(stdscr())
}
test_that('wsyncup', .wsyncup())


.syncok <- function() {
  on.exit(endwin())
  initscr()
  expect_true(syncok(stdscr(), TRUE))
}
test_that('syncok', .syncok())
