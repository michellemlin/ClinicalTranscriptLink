# Purpose: Function to merge the clinical data and transcriptional data based on the unique column linking the two datasets
# Author: Michelle Lin
# Date: 11 Dec 2023
# Version:
# Bugs and Issues:


#' Merge the Clinical and RNASeq data based on unique column - the patient barcode
#'
#' @param clinical A clinical dataset containing clinical information of interest. Must include patient IDs linking this data to the gene expression data.
#' @param RNA A RNA-seq dataset containing gene expression
#' @param ID - the name of the column to merge on
#'
#' @returns The merged dataset
#'
#' @examples
#' \dontrun{
#' library(RTCGA.clinical)
#' library(RTCGA.rnaseq)
#' data(BRCA.clinical)
#' data(BRCA.rnaseq)
#'
#' ClinicalTranscriptLink::mergeClinicalRNA(clinical = metadata,
#' RNA = BRCA.rnaseq,
#' ID1 = "patient.bcr_patient_barcode",
#' ID2 = "bcr_patient_barcode")
#' }
#'
#' @note
#' Generative AI - ChatGPT was used to assist in providing a base code on how
#' to use different functions and debugging
#'
#' Note that this function takes a while to run because of the huge datasets.
#' The merged output for reference can be found in ext/data in a file named "merged"
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>.
#' OpenAI. (2023). GPT-3.5: A language model by OpenAI.https://www.openai.com/gpt-3.5
#'
#' @export
#'


mergeClinicalRNA <- function(clinical, RNA,  ID1, ID2 = ID1){

  # check that 3 pieces of information are provided
  if (!missing(clinical) && !missing(RNA) && !missing(ID1)) {

    if(ClinicalTranscriptLink::integrityCheckClinical(clinical) == FALSE){
      stop("Please ensure that clinical dataset is of correct format")
    }

    if(ClinicalTranscriptLink::integrityCheckClinical(RNA) == FALSE){
      stop("Please ensure that the RNAseq dataset is of correct format")
    }

    if (missing(ID2)){
      # warning if one of the columns to match upon not given
      warning("ID2 not provided. Assumes that ID1 and ID2 are the same for merging")
    }

    # merge 2 tables
    clinical[[ID1]] <- base::tolower(clinical[[ID1]])
    RNA[[ID2]] <- base::tolower(RNA[[ID2]])

    # order the columns to make loop faster
    clinical <- clinical[order(clinical[[ID1]]), ]
    RNA <- RNA[order(RNA[[ID2]]), ]

    # merged table create
    merged <- as.data.frame(matrix(NA,
                                   ncol = ncol(RNA) + ncol(clinical)),
                                   nrow = nrow(RNA))

    colnames(merged) <- c(names(clinical), names(RNA))

    for (i in 1:nrow(RNA)){
      for(j in 1:nrow(clinical)){
        cat(paste(i, j, sep = "-"))
        print("\n")
        if (base::startsWith(RNA[[ID2]][i], clinical[[ID1]][j])){
          merged[i,] <- c(clinical[j, ], RNA[i, ])
          break
        }
      }
    }
    return(merged)
  }
  else {
    stop("Please provide exactly three arguments - a clinical dataset, an RNAseq
         dataset and a column on which to merge the datasets.")
  }
}
