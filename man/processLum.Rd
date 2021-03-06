% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processLum.R
\name{processLum}
\alias{processLum}
\title{Process raw Luminex files}
\usage{
processLum(antigen, fname, fdir = NULL, plotdir = NULL,
  xvar = "logConc", yvar = "logMFI", model = "sigmoid",
  Alow = NULL, asym = TRUE, trim.flat = TRUE,
  extrapolate.low = FALSE, extrapolate.up = FALSE,
  interactive = TRUE, monot.prompt = FALSE, rm.before = FALSE,
  rm.after = interactive, maxrm = 2, set.bounds = interactive,
  overwrite.bounds = FALSE, ifix = NULL, dtype = "Median",
  stdstr = "std|stand", bgstr = "blank|background", stddil = NULL,
  smpdil = 1000, optmethod = "Nelder-Mead", maxit = 5000,
  nwells = NULL, nsep = 2, ncolmax = 105, dformat = "\%m/\%d/\%Y",
  width = 6, height = 6, ptcol = "firebrick3",
  rugcols = c("cadetblue", "purple", "red"), ...)
}
\arguments{
\item{antigen}{character string.}

\item{fname}{name of the file that contains raw data.}

\item{fdir}{directory where the file is located (alternatively, full path can
be included in \code{fname}).}

\item{plotdir}{directory for the plots to be saved.}

\item{xvar, yvar}{character strings for the variables used to fit a standard
curve.}

\item{model}{the model to be fit.}

\item{Alow}{lower asymptote for the sigmoid model. If \code{NULL}, the lower
asymptote will be estimated, adding an extra parameter to the model. To fix
the asymptote at the level of background, specify \code{"bg"}. Numeric
value of \code{Alow} will force the asymptote to be fixed at the provided
level.}

\item{asym}{if \code{TRUE}, asymmetry in the fit is allowed, adding an extra
parameter to the model.}

\item{trim.flat}{logical value determining how the values of \code{yvar} are
trimmed. If \code{TRUE}, they will be trimmed at the bounds where the curve
starts to flatten out (automatically determined as maxima of the third
derivative of the function). If \code{FALSE}, \code{yvar} will be trimmed
at extrema, defined as the range of standards or asymptotes of the fit
(whichever are less extreme).}

\item{extrapolate.low}{if \code{TRUE}, sample values beyond lower bounds will
be processed by extrapolation of the standard curve. Takes precedence over
\code{trim.flat} value.}

\item{extrapolate.up}{if \code{TRUE}, sample values beyond upper bounds will
be processed by extrapolation of the standard curve. Takes precedence over
\code{trim.flat} value.}

\item{interactive}{logical value. If \code{TRUE}, the user is prompted to
evaluate the standards (and/or the fit) and asked to remove outliers if
needed. \code{TRUE} value takes precedence over \code{rm.before} and
\code{rm.after}: if both are \code{FALSE}, \code{rm.after} is reset to
\code{TRUE}.}

\item{monot.prompt}{if \code{TRUE}, the user is prompted to evaluate the
standards and possibly remove outliers if the standards are not monotonic
(increasing). \code{FALSE} value is ignored if \code{interactive} is
\code{TRUE}.}

\item{rm.before}{logical value indicating if potential outliers should be
removed before the model is fitted. Ignored if \code{interactive} is
\code{FALSE}.}

\item{rm.after}{logical value indicating if potential outliers should be
removed after the model is fitted. Ignored if \code{interactive} is
\code{FALSE}.}

\item{maxrm}{maximum number of outliers to remove.}

\item{set.bounds}{if \code{TRUE}, the user is given the option to manually
set the bound that is not set automatically. In that case, the prompt
appears even if \code{interactive} is \code{FALSE}.}

\item{overwrite.bounds}{logical value indicating the option to overwrite
automatically set bounds. Ignored if \code{interactive} is \code{FALSE}.}

\item{ifix}{sorted integer vector of length 3 with indices of standards to be
used for getting starting values for optimization.}

\item{dtype}{character string for data type in the file.}

\item{stdstr}{character string indicating standards in the file's "Sample"
column. Not case sensitive. If \code{""} (empty string), standards will be
determined by the pattern "1/" only.}

\item{bgstr}{character string indicating background in the file's "Sample"
column. Not case sensitive.}

\item{stddil}{a vector of standard dilutions. If \code{NULL}, dilutions are
inferred from the file's "Sample" column. Non-null value can be used to
exclude some dilutions from model fitting.}

\item{smpdil}{dilution used for the samples.}

\item{optmethod}{method to be used in optimization.}

\item{maxit}{maximum number of iterations in optimization.}

\item{nwells}{number of wells. If \code{NULL}, inferred from the file.}

\item{nsep}{number of lines separating different data types in the file.}

\item{ncolmax}{maximum number of columns in the file.}

\item{dformat}{date format in the file.}

\item{width, height}{optional parameters for the final saved plot.}

\item{ptcol}{color of the standard points on the plot.}

\item{rugcols}{vector of three colors for the rugplot, which indicates sample
values (inside the bounds, between the bounds and extrema, and beyond
extrema).}

\item{...}{further graphical parameters.}
}
\value{
A list of length two. The first element is a data frame that contains
  the results; the second is a character string with a flag containing
  information about removed points, failure to fit the model, manually set
  bounds, and/or an optional custom note provided by the user during an
  interactive model-fitting procedure. ***optional return of the number of
  trimmed samples (then a list of length three)***
}
\description{
Process data for a single antigen: fit a standard curve, establish bounds,
normalize samples, and save a plot showing the fit and the samples.
}
\details{
details to be added
}
\examples{

}
