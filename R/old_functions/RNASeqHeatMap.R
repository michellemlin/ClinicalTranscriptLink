# Purpose: To generate a heatmap that visualises the RNAseq dataset
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:


#' Plots a heatmap for the normalised count matrix for explanatory analysis of RNASeq expression data
#'
#'
#' @param countMatrix Normalised Count Matrix
#'
#' @returns returns NULL and plots heatmap for the RNA seq count matrix
#'
#'
#'
#' @import DESeq2
#' @import stats
#' @export
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>
#'
#' Love, M.I., Huber, W., Anders, S. Moderated estimation of fold change and
#' dispersion for RNA-seq data with DESeq2 Genome Biology 15(12):550 (2014)


RNASeqHeatMap <- function(countMatrix){
  if (!is.matrix(countMatrix)){
    stop("countMatrix is required to be a matrix")
  }
  if (!all(is.numeric(countMatrix))){
    stop("countMatrix is required to be a numeric count matrix")
  }
  if (any(countMatrix) < 0 ){
    stop(" raw counts have values less than 0")
  }
  else{
    # stats::heatmap(countMatrix, scale = 'row')
    return(invisible(NULL))
  }
}
