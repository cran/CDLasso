\name{cv.l1.reg}
\alias{cv.l1.reg}
\alias{cv.l1.reg.default}
\title{
k-fold Cross Validation
}
\description{
k-fold Cross Validation for L1 Greedy Coordinate Descent 
}
\usage{
cv.l1.reg(x, y, k, lam.vec)
}
\arguments{
  \item{x}{
\code{p} x \code{n} design matrix - Note that the rows of X correspond to predictors and the columns to cases.
}
  \item{y}{
Outcome of length \code{n}
}
  \item{k}{
Number of folds for k-fold cross validation
}
  \item{lam.vec}{
Vector of penalization parameters
}
}
\details{
K-fold cross validation to select optimal lambda for use in greedy coordinate descent for L1 regression \code{\link{l1.reg}}. The optimal value is considered the \code{lambda} value that retuns the lowest prediction error over the cross validation. If more than one \code{lambda} value give the minumum testing error, the smallest \code{lambda} is selected.
Plot of the cross validation can be viewed through \code{\link{plot.cv.l1.reg}}
}

\value{
  \item{k}{
  The value of \code{K} used for the K-fold cross validation.
  }
  \item{lam.vec}{
  The values of lambda tested.
  }
  \item{mean.error}{
  The mean error corresponding to each lambda across k-folds
  }  
  \item{lam.opt}{
  The determined lambda value among \code{lam.vec} that returns the smallest prediction error. This value is the optimal \code{lambda} value for use in \code{\link{l1.reg}}.
  }
  \item{error.cv}{
  The prediction error matrix returned by cross validation method.
  } 
  \item{num.pred}{
  The number of predictors selected for the corresponding \code{lambda} during the cross validation.
  }
}

\references{
	Wu, T.T. and Lange, K. (2008). Coordinate Descent Algorithms for Lasso Penalized Regression. Annals of Applied Statistics, Volume 2, No 1, 224-244.

}
\author{
Edward Grant, Kenneth Lange, Tong Tong Wu

Maintainer: Edward Grant \email{edward.m.grant@gmail.com}
}

\seealso{
\code{\link{l1.reg}}

\code{\link{plot.cv.l1.reg}}
}

\examples{
set.seed(6)
n=50 
p=200
nzfixed = c(1:5)
true.beta<-rep(0,p)
true.beta[nzfixed] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) \%*\% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

crossval<-cv.l1.reg(x,y,10,(0:20)*2)
plot(crossval)
out<-l1.reg(x,y,lambda=crossval$lam.opt)
out
}