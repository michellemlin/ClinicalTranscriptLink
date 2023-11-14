# Purpose: Function to merge the clinical data and transcriptional data based on the unique column linking the two datasets
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:

mergeClinicalRNA <- function(clinical,
                             rnaseq,
                             caseID){
  # obtain the data sets
  ClinicalData <- clinical
  RNASeqData <- rnaseq

  # merge the data sets based on the patientLink identifier column
}
