library(shiny)
library(shinyjs)


# UI
ui <- fluidPage(

  # Change title
  titlePanel("Generate Heatmaps for gene expression for different clinical factors"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("This is a Shiny App that is used to Generate Heatmaps for gene
             expression for different clinical factors."),
      # br() element to introduce extra vertical spacing ----
      br(),

      tags$b("Description: This package helps users to better understand the
             the genetic expression of genes for cancers and various clinical
             factors"),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      fileInput(inputId = "file",
                label = "Upload CSV file for merged data"),
      selectInput(inputId = "feature",
                  label = "Select Feature Column", ""),
      selectInput(inputId = "firstGeneCol",
                  label = "Input the name of the first gene column", ""),
      actionButton(inputId = "button1",
                   label = "Run"),
      useShinyjs()
      ),

  # Main panel for displaying outputs ----
  mainPanel(
    # Output: Tabset w/ plot, summary, and table ----
    tabsetPanel(type = "tabs",
                tabPanel("Heatmap of RNAseq Dataset",
                         h3("Instructions: Enter the merged file, clinical feature and firstGeneCol and Run"),
                         br(),
                         plotOutput("heatmap"))
    )
    )
  )
)

# Server
server <- function(input, output, session) {
  data <- reactiveVal(NULL)

  observeEvent(input$file, {
    data(read.csv(input$file$datapath))
    updateSelectInput(session, "feature", choices = names(data()))
    updateSelectInput(session, "firstGeneCol", choices = names(data()))
  })

  observeEvent(input$actionButton, {
    print("Generating heatmap")
    output$heatmap <- renderPlot({ClinicalTranscriptLink::heatmapGenerate(input$file,
                                                              input$feature,
                                                              input$firstGeneCol)
    })
  })
}

shinyApp(ui, server)

# END
