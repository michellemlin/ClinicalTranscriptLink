# Purpose: To test the packages as we are developing them
# Author: Michelle Lin
# Date: 14 Nov 2023
# Version:
# Bugs and Issues:

library(RTCGA.clinical)
data(package = "RTCGA.clinical")

library(RTCGA.rnaseq)
data(package = "RTCGA.rnaseq")
BRCA_data <- data("BRCA.rnaseq")
BRCA_data
