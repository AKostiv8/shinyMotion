library(shiny)
library(shinyMotion)

ui <- MotionTemplate(navigation = list(
                                    list(title = 'Summary 1', routeLink = '16', color = '#fdac02'),
                                    list(title = 'Summary 2', routeLink = '11', color = '#575655')
                                  ),
                     maincontet = mainContent(
                       div(
                       h1('Test'),
                       selectInput('test', 'Test', choices = c(1, 2, 3)),
                       textOutput('Bla'),
                       div(
                       action_buttonInput('Test', 'Test', className = 'bla'),
                       input_fieldInput('Test2', label = 'Address', helperText = 'Brooklyn', styleId = "custom1"),
                       radiobuttonsInput('Test4',
                                         label = 'Test 3',
                                         className = "blabla",
                                         valuesList = list(
                                             list(value = 'street', title = "Street"),
                                             list(value = 'address', title = "Address")
                                           ),
                                         row = TRUE
                                         ),
                       sliderInput('Test5', defaultValue = 15, min = 10, max = 40)
                       ),
                       # div(
                       # select_inputInput('Test1')
                       # )
                       )
                       )

                     )

server <- function(input, output, session) {

  output$Bla <- renderText({
    print(input$Test2)
    print(input$Test5)
    print(input$Test4)
    input$Test1
  })
}

shinyApp(ui, server)
