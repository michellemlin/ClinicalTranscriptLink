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
#' TODO
#' }
#'
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>.
#'
#' @export
#'

mergeClinicalRNA <- function(clinical, RNA,  ID){

  # check that 3 pieces of information are provided

  # run the previous function to test that the clinical data and RNA data are
  # forms

  # merge the datasets based on column ID and return

}
