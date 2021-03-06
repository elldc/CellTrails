% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/accessor-methods.R
\docType{methods}
\name{trajResiduals}
\alias{trajResiduals}
\alias{trajResiduals,SingleCellExperiment-method}
\title{GET trajectory fitting residuals}
\usage{
trajResiduals(object)
}
\arguments{
\item{object}{A \code{SingleCellExperiment} object}
}
\value{
A \code{numeric} vector
}
\description{
Returns trajectory fitting residuals from \code{SingleCellExperiment} object
}
\details{
The trajectory fitting deviation is defined as the
vector rejection from a sample in the latent space to the trajectory
backbone. The trajectory backbone is defined by a tree spanning all
relevant states. Samples get orthogonally projected onto straight lines
connecting related states. This function quantifies the distance between
the actual positon of a sample in the latent space and its projectd position
on the trajectory backbone. In other words, the higher the distance, the
higher its deviation (residual) from the trajectory fit. This function
returns all residuals for each projected sample. Residuals of samples which
were exluded for trajectory reconstruction are \code{NA}.
}
\examples{
# Example data
data(exSCE)

trajResiduals(exSCE)[seq_len(5)]
}
\seealso{
\code{fitTrajectory} \code{trajSampleNames}
}
\author{
Daniel C. Ellwanger
}
