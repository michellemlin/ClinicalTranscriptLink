
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ClinicalTranscriptLink

<!-- badges: start -->
<!-- badges: end -->

## Description

`ClinicalTranscriptLink` is a package that aims to identify correlations
between clinical expression of cancers and the transcriptional
expression using bulk RNA sequencing data. Packages currently available
only study one of these and do not provide any correlation between the
clinical expression of diseases and the corresponding gene expression.
As such, this package aims to create that link to help us better
understand the relation.

This package contains functions for analysis of the data and functions
for visualisation of the data. The `ClinicalTranscriptLink` package was
developed using `R version 4.3.1 (2023-06-16)`,
`Platform: x86_64-w64-mingw32/x64 (64-bit)` and
`Running under: Windows 11 x64 (build 22631)`.

## Installation

You can install the development version of ClinicalTranscriptLink from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("michellemlin/ClinicalTranscriptLink")
library(ClinicalTranscriptLink)
```

To run the Shiny app: under construction

## Overview

For an example of use of ClinicalTranscriptLink:

``` r
ls("package:ClinicalTranscriptLink")
data(package = "ClinicalTranscriptLink") 
browseVignettes("ClinicalTranscriptLink")
```

`ClinicalTranscriptLink` provides 3 functions:

## Contributions

This package was created by `Michelle Lin` and contains

## References

- H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
  Springer-Verlag New York, 2016.

- Kosinski M (2023). *RTCGA.clinical: Clinical datasets from The Cancer
  Genome Atlas Project*. <doi:10.18129/B9.bioc.RTCGA.clinical>
  <https://doi.org/10.18129/B9.bioc.RTCGA.clinical>, R package version
  20151101.30.0, <https://bioconductor.org/packages/RTCGA.clinical>.

- Kosinski M (2023). *RTCGA.rnaseq: Rna-seq datasets from The Cancer
  Genome Atlas Project*. <doi:10.18129/B9.bioc.RTCGA.rnaseq>
  <https://doi.org/10.18129/B9.bioc.RTCGA.rnaseq>, R package version
  20151101.30.0, <https://bioconductor.org/packages/RTCGA.rnaseq>.

- 

## Acknowledgements

This package was developed as part of an assessment for Fall 2023
BCB410H1: Applied Bioinformatics course at the University of Toronto,
Toronto, CANADA. ClinicalTranscriptLink welcomes issues, enhancement
requests, and other contributions. To submit an issue, use the GitHub
issues.
