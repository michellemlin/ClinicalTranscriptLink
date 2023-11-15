# Purpose: To generate a heatmap that visualises the RNAseq dataset
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:


#' Plot histograms for distributions
#'
#'
#' @param clinicalMeta  clinical metadata
#' @param interest factor of interest
#'
#' @returns returns NULL and plots the histograms
#'
#' @import graphics
#'
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(RTCGA.clinical)
#' library(BRCA.clinical)
#' metadata <- BRCA.clinical
#' metadataDeceased <- subset(metadata,
#' metadata$patient.clinical_cqcf.consent_or_death_status == "deceased")
#' metadataDeceased$patient.days_to_death <- as.numeric(metadataDeceased$patient.days_to_death)
#' survivalExplore(metadataDeceased, "patient.days_to_death")
#' }
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>
#'
#'
#'

survivalExplore <- function(clinicalMeta, interest){
  if (!is.data.frame(clinicalMeta)){
    stop("clinicalMeta is required to be a dataframe")
  }
  else{
    graphics::hist(clinicalMeta[[interest]])
    return(invisible(NULL))
  }
}
