% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Selbal_Functions.R
\name{selbal.cv}
\alias{selbal.cv}
\title{Cross - validation process for the selection of the optimal number of
variables and robustness evaluation}
\usage{
selbal.cv(x, y, n.fold = 5, n.iter = 10, seed = 31415,
  covar = NULL, col = c("steelblue1", "tomato1"),
  col2 = c("darkgreen", "steelblue4", "tan1"), logit.acc = "AUC",
  maxV = 20, zero.rep = "bayes", opt.cri = "1se",
  user_numVar = NULL)
}
\arguments{
\item{x}{a \code{matrix} object with the information of variables
(\emph{columns}) for each sample (\emph{rows}).}

\item{y}{the response variable, either continuous or dichotomous.}

\item{n.fold}{number of folds in which to divide the whole data set.}

\item{n.iter}{number of iterations for the cross - validation process.}

\item{seed}{a seed to make the results reproducible.}

\item{covar}{\code{data.frame} with the variables to adjust for
(\emph{columns}).}

\item{col}{\code{vector} of two colours for differentiate the variables
appearing in the numerator and in the denominator of the balances.}

\item{col2}{\code{vector} of three colours for the lines of the barplot with
the aim of identifying if each variable appears in the Global balance, in the
CV - balance or in both of them.}

\item{logit.acc}{when \code{y} is dichotomous, the measure to compute for
the correlation between \code{y} and the proposed \emph{balance}
adjusting for covariates. One of the following values: \code{"AUC"} (default),
 \code{"Dev"}, \code{"Rsq"} or \code{"Tjur"}.}

\item{maxV}{\code{numeric} value defining the maximum number of variables
composing the balance. Default 1e10 to give prevalence to \code{th.imp}
parameter.}

\item{zero.rep}{a value defining the method to use for zero - replacement.
\code{"bayes"} for BM-replacement or \code{"one"} to add one read tho each
cell of the matrix.}

\item{opt.cri}{parameter indicating the method to determine the optimal
number of variables. \code{"max"} to define this number as the number of
variables which maximizes the association value or \code{"1se"} to take also
the standard error into account.}

\item{user_numVar}{parameter to modify the choosen optimal number of variables. 
If it is used, it is the final number of variables used in the method.}

\item{th.imp}{the minimum increment needed when adding a new variable into
the balance in order to consider an improvement.}
}
\value{
A \code{list} with the following objects:

\itemize{
\item a boxplot with the mean squared errors (numeric responses) or AUC
values (dichotomous responses) for the test data sets using the balances
resulted in the cross - validation. Branches represent the standard error and
the optimal number of components according with the \code{opt.cri} criteria
is highlighted with a dashed line.
\item barplot with the proportion of times a variable appears in the
cross - validation balances.
\item a graphical representation of the Global Balance (draw it using
\code{grid.draw} function).
\item a table with the infromation of Global Balance, CV Balance and the
three most repeated balances in the cross - validation process (draw it using
\code{plot.tab} function).
\item a vector with the accuracy values (MSE for continuous variables and
AUC for dichotomous variables) obtained in the cross - validation procedure.
\item a table with the variables appearing in the Global Balance in a useful
format for \code{bal.value} function in order to get the balance score for
new datasets.
\item the regression model object where the covariates and the final balance
are the explanatory variables and \code{y} the response variable.
\item the optimal number of variables estimated in the cross -
validation.

}
}
\description{
Cross - validation process for the selection of the optimal number of
variables and robustness evaluation
}
\examples{
# Load data set
  load("HIV.rda")
# Define x and y
  x <- HIV[,1:60]
  y <- HIV[,62]
# Run the algorithm
  CV.Bal <- selbal.cv(x,y)
}
