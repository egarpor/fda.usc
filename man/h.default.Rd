\name{h.default}
\Rdversion{1.1}
\alias{h.default}
\title{ Calculation of the smoothing parameter (h) for a functional data}
\description{
Calculation of the smoothing parameter (h) for a functional data using nonparametric kernel estimation.
}
\usage{
h.default(fdataobj, prob=c(0.025,0.25),len=51, metric = metric.lp,
Ker = "AKer.norm", type.S ="S.NW",...)
}

\arguments{
  \item{fdataobj}{ \code{\link{fdata}} class object.}  
  \item{prob}{ Range of probabilities for the quantiles of the distance matrix.}  
  \item{len}{ Vector length of smoothing parameter \code{h} to return.}
  \item{metric}{ If is a function: name of the function to calculate the distance matrix between the curves, by default \code{\link{metric.lp}}. 
  If is a matrix:  distance matrix between the curves.}
	\item{Ker}{ Type of asymmetric kernel used, by default asymmetric normal kernel.}	  
  \item{type.S}{ Type of smothing matrix \code{S}.  Possible values are: Nadaraya-Watson estimator \emph{"S.NW"} and  K nearest neighbors estimator \emph{"S.KNN"}}  
  \item{\dots}{ Arguments to be passed  for metric argument.}
}
\value{
Returns the vector of smoothing parameter or bandwidth \code{h}.
}
\author{
Manuel Febrero-Bande, Manuel Oviedo de la Fuente \email{manuel.oviedo@usc.es}
}
\seealso{
See Also as   \code{\link{metric.lp}}, \code{\link{Kernel}} and \code{\link{S.NW}}. \cr
Function used in \code{\link{fregre.np}} and \code{\link{fregre.np.cv}} function.
}
\examples{
##  Not run 
# data(aemet)
# h1<-h.default(aemet$temp,prob=c(0.025, 0.25),len=2)
# mdist<-metric.lp(aemet$temp)
# h2<-h.default(aemet$temp,len=2,metric=mdist)
# h3<-h.default(aemet$temp,len=2,metric=semimetric.pca,q=2)
# h4<-h.default(aemet$temp,len=2,metric=semimetric.pca,q=4)
# h1;h2;h3;h4
}
\keyword{nonparametric} 