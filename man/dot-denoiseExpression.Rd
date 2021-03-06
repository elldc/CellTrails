% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility-methods.R
\name{.denoiseExpression}
\alias{.denoiseExpression}
\title{Denoises expression}
\usage{
.denoiseExpression(x, design)
}
\arguments{
\item{x}{A numeric expression vector}

\item{design}{A numeric matrix describing the factors that should be blocked}
}
\value{
A numeric denoised expression vector
}
\description{
Blocks factors in expression matrix
}
\author{
Daniel C. Ellwanger
}
\keyword{internal}
