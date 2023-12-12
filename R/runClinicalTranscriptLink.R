#' Launch Shiny App for ClinicalTranscriptLink
#'
#' A function that launches the Shiny app for ClinicalTranscriptLink.
#' This app will allow users to create visualisations gene expression
#' based on different clinical attributes.
#' The code has been placed in \code{./inst/shiny-scripts}.
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#' ClinicalTranscriptLink::runClinicalTranscriptLink()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' @export
#' @importFrom shiny runApp

runClinicalTranscriptLink <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "ClinicalTranscriptLink")
  actionShiny <- shiny::runApp(appDir, display.mode = "normal")
  return(actionShiny)
}
# [END]
