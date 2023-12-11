# Purpose: This function will be used in other functions to ensure that the data being passed in is of correct formats
# Author: Michelle Lin
# Date: 11 Dec 2023
# Version:
# Bugs and Issues:

#' Ensure that the format of the clinical dataset being passed in is of correct format
#'
#' @param dataset A clinical dataset containing clinical information of interest. Must include patient IDs linking this data to the gene expression data.
#'
#' @returns True if the dataset is error free. False otherwise
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
#' OpenAI. (2023). GPT-3.5: A language model by OpenAI.https://www.openai.com/gpt-3.5
#'
#'
#'
#' @export
#'

integrityCheckClinical <- function(dataset){

  # check if a dataset was passed in
  if (!is.null(dataset)){
    print("A dataset is required. Please pass in a dataset.")
    return(FALSE)
  }
  else{
    # check if the dataset is of correct format - a dataframe
    if (!is.data.frame(dataset)){
      print("The dataset needs to be a dataframe.")
      return(FALSE)
    }
    else{
      # check that it contains all the required data ?
      return(TRUE)
    }
  }
}
