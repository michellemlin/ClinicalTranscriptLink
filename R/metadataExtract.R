# Purpose: Function to extract relevant metadata from columns
# Author: Michelle Lin
# Date: 11 Dec 2023
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
#' library(RTCGA.clinical)
#' data("BRCA.clinical")
#' ClinicalTranscriptLink::metadataExtract(BRCA.clinical, c("patient.bcr_patient_barcode"))
#' }
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>.
#' OpenAI. (2023). ChatGPT (Version 3.5) [Large language model]. https://chat.openai.com/chat'
#'
#' @note
#' ChatGPT was used to search for useful function - eg. what R function can be used to check for missing arguments?
#'
#' @export
#'

metadataExtract <- function(dataset,
                            metadata=colnames(dataset)){

    # check if dataframe is provided
  if (is.data.frame(dataset)){
    # check for optional argument
    if (base::missing(metadata)){
      warning("No metadata columns were provided. The entire dataset was returned.")
    }
    # extract the metadata information from the corresponding columns
    patientMeta <- dataset[, metadata, drop=FALSE]
    return(patientMeta)
  }
  else{ # Error if data set is not a data frame
    stop("dataset needs to be of form data frame")
  }
}


