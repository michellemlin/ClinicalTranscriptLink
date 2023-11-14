# Purpose: To generate a heatmap that visualises the RNAseq dataset
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:


#' Plots a heatmap for the normalised count matrix for explanatory analysis of RNASeq expression data
#'
#' @param countMatrix Normalised Count Matrix
#'
#' @returns returns NULL and plots heatmap for the RNA seq count matrix


RNASeqHeatMap <- function(countMatrix){
  heatmap(countMatrix, scale = 'row')
}
