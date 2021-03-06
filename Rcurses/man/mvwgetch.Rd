% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getch.r
\name{mvwgetch}
\alias{mvwgetch}
\title{move and wait for user input in window}
\usage{
mvwgetch(win, y, x)
}
\arguments{
\item{win}{a window object as an external pointer}

\item{y}{the upper y position}

\item{x}{the left x position}
}
\value{
the keycode, or <= 0 on error or timeout
}
\description{
move and wait for user input in window
}
\seealso{
\code{\link{KEYS}}

Other getch: \code{\link{getch}}, \code{\link{has_key}},
  \code{\link{mvgetch}}, \code{\link{ungetch}},
  \code{\link{wgetch}}
}

