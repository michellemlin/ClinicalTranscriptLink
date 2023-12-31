% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survivalAnalyse.R
\name{survivalAnalyse}
\alias{survivalAnalyse}
\title{Analyse the survival rates}
\usage{
survivalAnalyse(
  clinicalMeta,
  timeToEvent,
  event,
  factors = colnames(clinicalMeta)
)
}
\arguments{
\item{clinicalMeta}{clinical metadata}

\item{timeToEvent}{time since death}

\item{event}{death}

\item{factors}{factors to model based on}
}
\value{
returns NULL and plots heatmap for the RNA seq count matrix
}
\description{
Analyse the survival rates
}
\examples{
\dontrun{
library(RTCGA.clinical)
data(BRCA.clinical)
survivalAnalyse(BRCA.clinical,
timeToEvent = "patient.days_to_death",
event = "patient.clinical_cqcf.consent_or_death_status")
}

}
\references{
R Core Team (2023). \emph{R: A Language and Environment for Statistical Computing}.
R Foundation for Statistical Computing, Vienna, Austria.
\url{https://www.R-project.org/}

Wickham H, François R, Henry L, Müller K, Vaughan D (2023). \emph{dplyr: A Grammar
of Data Manipulation}. R package version 1.1.3,
\url{https://CRAN.R-project.org/package=dplyr}.

Therneau T (2023). \emph{A Package for Survival Analysis in R}. R package version
3.5-5, \url{https://CRAN.R-project.org/package=survival}.

Kassambara A, Kosinski M, Biecek P (2021). \emph{survminer: Drawing Survival Curves
using 'ggplot2'}. R package version 0.4.9,
\url{https://CRAN.R-project.org/package=survminer}.
}
