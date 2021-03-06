% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R
\docType{methods}
\name{fitTrajectory}
\alias{fitTrajectory}
\alias{fitTrajectory,SingleCellExperiment-method}
\title{Align samples to trajectory}
\usage{
fitTrajectory(sce)
}
\arguments{
\item{sce}{A \code{SingleCellExperiment} object}
}
\value{
An updated \code{SingleCellExperiment} object
}
\description{
Orthogonal projection of each sample to the trajectory backbone.
}
\details{
The previously selected component (with \emph{k} states) defines
the trajectory backbone. With this function CellTrails embeds the trajectory
structure in the latent space by computing \emph{k}-1 straight lines passing
through \emph{k} mediancentres (Bedall & Zimmermann, 1979) of adjacent
states. Then, a fitting function is learned. Each sample is projected to
its most proximal straight line passing through the mediancentre of its
assigned state. Here, whenever possible, projections on line segments
\emph{between} two mediancentres are preferred. Residuals
(fitting deviations) are given by the Euclidean distance between the
sample's location and the straight line. Finally, a weighted acyclic
trajectory graph can be constructed based on each sample’s position along
its straight line. In addition, data vectors are connected to mediancentres
to enable the proper determination of branching points. Each edge is
weighted by the distance between each node
(sample) after orthogonal projection.
\cr \cr
Of note, the fitting function implies potential side branches in the
trajectory graph; those could be caused due to technical variance or
encompass samples that were statistically indistinguishable from the main
trajectory given the selected genes used for trajectory reconstruction.
\cr \cr
\emph{Diagnostic messages}
\cr \cr
An error is thrown if an trajectory graph component was not
computed or selected yet; functions \code{connectStates}
and \code{selectTrajectory} need to be run first.
}
\examples{
# Example data
data(exSCE)

# Align samples to trajectory
exSCE <- fitTrajectory(exSCE)
}
\references{
Bedall, F.K., and Zimmermann, H. (1979).
Algorithm AS143. The mediancentre. Appl Statist 28, 325-328.
}
\seealso{
\code{connectStates} \code{selectTrajectory}
}
\author{
Daniel C. Ellwanger
}
