#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

initial_map <- readRDS('../example/data/initial_map.rds')
# Define UI for application that draws a histogram
ui <- div(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    div(
        div(
            numericInput("bins",
                        "Number of bins:",
                        value = 30)
        ),

        # Show a plot of the generated distribution
        div(
           plotOutput("distPlot"),
           leafletOutput("clusterMap")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })

    # create the datasetbased on the choice of "First" or "Second"
    clusterMap <- reactiveValues(map = NULL)

    observeEvent(input$first, {
        myDataSet$data <- dataframe1
    })


    output$clusterMap <- renderLeaflet({
      initial_map@map
    })

}

# Run the application
shinyApp(ui = ui, server = server)
