# Purpose: Analyse the survival rate
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:


#' Analyse the survival rates
#'
#'
#' @param clinicalMeta  clinical metadata
#' @param timeToEvent time since death
#' @param event death
#' @param factors factors to model based on
#'
#' @returns returns NULL and plots heatmap for the RNA seq count matrix
#'
#' @import survival
#' @import survminer
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(RTCGA.clinical)
#' data(BRCA.clinical)
#' survivalAnalyse(BRCA.clinical,
#' timeToEvent = "patient.days_to_death",
#' event = "patient.clinical_cqcf.consent_or_death_status")
#' }
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>
#'
#' Wickham H, François R, Henry L, Müller K, Vaughan D (2023). _dplyr: A Grammar
#' of Data Manipulation_. R package version 1.1.3,
#' <https://CRAN.R-project.org/package=dplyr>.
#'
#' Therneau T (2023). _A Package for Survival Analysis in R_. R package version
#' 3.5-5, <https://CRAN.R-project.org/package=survival>.
#'
#' Kassambara A, Kosinski M, Biecek P (2021). _survminer: Drawing Survival Curves
#' using 'ggplot2'_. R package version 0.4.9,
#' <https://CRAN.R-project.org/package=survminer>.
#'
#'
#'

survivalAnalyse <- function(clinicalMeta,
                           timeToEvent,
                           event,
                           factors = colnames(clinicalMeta)) {
  if (!missing(clinicalMeta) && !missing(timeToEvent) && !missing(event)){
    stop("Missing clinical metadata or time to event or the interested event")
  }
  else if (ClinicalTranscriptLink::integrityCheckClinical(clinicalMeta) == FALSE){
    stop("Please ensure that clinical dataset is of correct format")
  }
  else{
    if (missing(factors)){
      warning("All factors taken as no specifications were provided")
    }
    clinicalMeta[[timeToEvent]] <- as.numeric(clinicalMeta[[timeToEvent]])
    maxVal = max(clinicalMeta[[timeToEvent]][!is.na(clinicalMeta[[timeToEvent]])])
    clinicalMeta[[timeToEvent]] <- replace(clinicalMeta[[timeToEvent]], is.na(clinicalMeta[[timeToEvent]]), maxVal)

    clinicalMeta[[event]] <- factor(clinicalMeta[[event]])
    # create a survival object
    survivalObj <- survival::Surv(time = clinicalMeta[[timeToEvent]], event = clinicalMeta[[event]])
    print(survivalObj)

    # Kaplan-Meier curve fit
    kmFit <- survfit(survivalObj ~ 1, data=clinicalMeta)
    print(summary(kmFit))

    return(invisible(NULL))

    # #visualise the survival fit
    # survminer::ggsurvplot(kmFit, data=clinicalMeta, pval = TRUE)
  }
}
