% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/windows.r
\name{syncok}
\alias{syncok}
\title{setup automatic window wync}
\usage{
syncok(win, bf)
}
\arguments{
\item{win}{a window object as an external pointer}

\item{bf}{if TRUE then wsyncup is called automatically whenever
there is a change in the window.}
}
\value{
TRUE on success
}
\description{
setup automatic window wync
}
\seealso{
Other window: \code{\link{delwin}}, \code{\link{derwin}},
  \code{\link{dupwin}}, \code{\link{mvderwin}},
  \code{\link{mvwin}}, \code{\link{newwin}},
  \code{\link{subwin}}, \code{\link{wsyncup}}
}

