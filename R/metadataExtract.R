# Purpose: Function to merge the clinical data and transcriptional data based on the unique column linking the two datasets
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:


#' Obtain metadata about each patient through the clincal data
#'
#' @param dataset A clinical dataset containing clinical information of interest - eg. time to death, age of diagnostics. Must include patient IDs linking this data to the gene expression data.
#' @param metadata A vector of column names of metadata of interest. If no parameters provided, default will return the entire dataset
#'
#' @returns A dataframe that contains the clinical metadata for patients
#'
#' @examples
#' \dontrun{
#' metadataExtract(BRCA.clinical, c("patient.bcr_patient_barcode"))
#' }
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>.
#'
#' @export

metadataExtract <- function(dataset,
                            metadata=colnames(dataset)){

  if (is.data.frame(dataset)){

    # extract the metadata information from the corresponding columns
    patientMeta <- dataset[, metadata, drop=FALSE]
  }
  else{ # Error if data set is not a data frame
    stop("dataset needs to be of form data frame")
  }
}


