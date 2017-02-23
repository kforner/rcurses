.c <- function(...)   invisible(.C(..., PACKAGE = 'Rcurses'))

.call <- function(...)   invisible(.Call(..., PACKAGE = 'Rcurses'))