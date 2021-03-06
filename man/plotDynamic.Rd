% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R
\docType{methods}
\name{plotDynamic}
\alias{plotDynamic}
\alias{plotDynamic,SingleCellExperiment-method}
\title{Visualize dynamics}
\usage{
plotDynamic(sce, feature_name, trail_name)
}
\arguments{
\item{sce}{A \code{SingleCellExperiment} object}

\item{feature_name}{Name of one or multiple features}

\item{trail_name}{Name of trail}
}
\value{
A \code{ggplot} object
}
\description{
Shows dynamics of one or multiple features along a given trail
}
\details{
An error is thrown if the \code{trail_name} or \code{feature_name} are
unknown. The function is case-sensitiv. All available trails can be
listed by \code{trailNames}, all features with \code{featureNames}.
}
\examples{
# Example data
data(exSCE)

# Plot dynamic of feature_10
plotDynamic(exSCE, trail_name="Tr1", feature_name="feature_1")
# Plot dynamic of feature_1 and feature_10
plotDynamic(exSCE, trail_name="Tr1",
            feature_name=c("feature_1", "feature_10"))
}
\seealso{
\code{addTrail} \code{trailNames} \code{featureNames}
}
\author{
Daniel C. Ellwanger
}
