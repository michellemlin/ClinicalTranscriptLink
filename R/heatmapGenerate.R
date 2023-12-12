# Purpose: Function to generate a heatmap of gene expression in different cancer types
# Author: Michelle Lin
# Date: 11 Dec 2023
# Version:
# Bugs and Issues:


#' Generate a heatmap for gene expression in different cancer types
#'
#' @import gplots
#'
#' @param data a dataframe containing the data for the heatmap generation
#' @param feature the column on which to get the feature for heat map
#' @param geneExpStart the first column of gene expression data
#'
#' @returns NULL and prints the heatmap
#'
#' @examples
#' \dontrun{
#' library(TCGA)
#' }
#'
#' @note
#' ChatGPT was used to assist in searching for appropriate functions to use
#'
#' @references
#' R Core Team (2023). _R: A Language and Environment for Statistical Computing_.
#' R Foundation for Statistical Computing, Vienna, Austria.
#' <https://www.R-project.org/>.
#' OpenAI. (2023). GPT-3.5: A language model by OpenAI.https://www.openai.com/gpt-3.5
#'
#' @export
#'
#'


heatmapGenerate <- function(dataset, feature, geneExpStart){

  ## do the error checking
  if(ClinicalTranscriptLink::integrityCheckClinical(dataset) == FALSE){
    stop("Please ensure that clinical dataset is of correct format")
  }
  else if(missing(feature)){
    stop("Please provide a feature on which to create heatmap")
  }
  else if(missing(geneExpStart) || !is.character(geneExpStart)){
    stop("Please provide the name of first column for gene expression data")
  }
  else{
    ## create the heat map

    # Extract columns for heatmap
    feature_col <- base::which(colnames(merged) == feature)
    RNAStart_col <- base::which(colnames(merged) == geneExpStart)
    geneExp <- merged[, c(feature_col, RNAStart_col: ncol(merged))]

    # in case of NA present
    if (length(is.na(geneExp[[feature]])) > 0){
      warning("Missing inforation in feature column")
      if (is.numeric(geneExp[[feature]])){
        geneExp[[feature]][is.na(geneExp[[feature]])] <- -999
      }
      else if (is.character(geneExp[[feature]])){
        geneExp[[feature]][is.na(geneExp[[feature]])] <- "Unknown"
      }
    }

    for (i in 2:ncol(geneExp)){
      if (length(is.na(geneExp[, i])) > 0){
        geneExp[, i][is.na(geneExp[, i])] <- 0
      }
    }


    # aggregate data
    geneExp <- stats::aggregate(. ~ geneExp[[feature]], data = geneExp, mean)


    # Set the color palette
    palette <- grDevices::colorRampPalette(c("blue", "white", "red"))(20)

    # Create the heat map
    gplots::heatmap.2(as.matrix(geneExp[,-1]),
                    col = palette,  # Use a color palette
                    scale = "column",  # Scale columns
                    trace = "none",    # Disable trace lines
                    margins = c(5, 10),  # Adjust margins
                    main = paste0("Heatmap of ", feature ," and Gene Expression")
                    )

    return(invisible(NULL))
  }
}

