% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raster.mds.R
\name{raster.mds}
\alias{raster.mds}
\title{Raster multidimensional scaling (MDS)}
\usage{
raster.mds(r, s = 5, window.median = FALSE, ...)
}
\arguments{
\item{r}{Raster layer}

\item{s}{Window size (may be a vector of 1 or 2) of n x n dimension. If only one value provided then a square matrix (window) will be used.}

\item{window.median}{(TRUE/FALSE) Return the median of the MDS matrix values. If FALSE then the center value of the matrix is returned and not the median of the matrix}

\item{...}{Additional arguments passed to raster::focal (if you want a file written to disk use filename = "" argument)}
}
\value{
A raster class object or raster written to disk
}
\description{
Multidimensional scaling of raster values within an N x N focal window
}
\note{
An MDS focal function
}
\examples{
 library(raster)
 r <- raster(system.file("external/rlogo.grd", package="raster")) 
   r <- r / cellStats(r, "max")
 
 diss <- raster.mds(r)
 diss.med <- raster.mds(r, window.median = TRUE)
   par(mfrow=c(2,2))
   plot(r)
     title("R logo band-1")
   plot( focal(r, w = matrix(1, nrow=5, ncol=5), fun = var) )
     title("Variance")		 
     plot(diss)
       title("MDS")
     plot(diss.med)
       title("Median MDS")

}
\references{
Quinn, G.P., & M.J. Keough (2002) Experimental design and data analysis for biologists. Cambridge University Press. Ch. 18. Multidimensional scaling and cluster analysis.
}
\author{
Jeffrey S. Evans  <jeffrey_evans@tnc.org>
}
