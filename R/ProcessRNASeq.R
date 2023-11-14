# Purpose: To process the RNASeq Dataset
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:

#' Clean and preprocess the RNA sequencing data. Prints information about the normalisation
#'
#' @import DESeq2
#'
#' @param dataset A count matrix of gene expression where each row is the expression of genes for a patient
#' @param normMethod Method of Normalisation
#'
#'
#' @returns A processed count matrix that was normalised.
#' @examples
#' \dontrun{
#' processRNASeq(BRCA.clinical)
#' }
processRNASeq <- function(dataset){
  countMatrix <- as.matrix(dataset)

  # create the DESeqDataSet object
  DESeqObj <- DESeqDataSetFromMatrix(countData = countMatrix,
                                     colData = NULL,
                                     design ~ 1)
  DESeqObjDE <- DESeq(DESeqObj)

  # obtain the normalised count matrix
  normRNA <- counts(DESeqObjDE, normalized=TRUE)

  return(normRNA)
}
