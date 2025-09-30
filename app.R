library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0),
            actionButton(inputId = "add",
                         label = "Add"),
            actionButton(inputId = "multiply",
                         label = "Multiply")
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum"),
            h2("The product of the two numbers is:"),
            textOutput("product")
        )
    )
)

server <- function(input, output) {
    a <- eventReactive(input$add, {
        as.numeric(input$number1)
    })
    b <- eventReactive(input$add, {
        as.numeric(input$number2)
    })
    c <- eventReactive(input$multiply, {
        as.numeric(input$number1)
    })
    d <- eventReactive(input$multiply, {
      as.numeric(input$number2)
    })
    output$sum <- renderText({
        x1 <- a()
        x2 <- b()
        x1 + x2
    })
    output$product <- renderText({
        x1 <- c()
        x2 <- d()
        x1 * x2
    })
}

shinyApp(ui = ui, server = server)


