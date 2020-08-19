library(shiny)
library(shinydashboard)
library(shinyWidgets)


# Layout/Table of Contents ------------------------------------------------
# 1. Create Header, Sidebar, Body --> UI
# 2. Create/import mathematical/formatting functions
# 3. Instantiate global variables
# 4. Create server that responds to user interaction
# 5. Deploy App
# -------------------------------------------------------------------------


# 1. a) Header ------------------------------------------------------------------
header <- dashboardHeader(
  title="Calculators by Lucas Pao",
  titleWidth=400
)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable=TRUE
)


# 1. c) Body ------------------------------------------------------------------
body <- dashboardBody(
  box(
    width = 6,
    h3("Standard Calculator"),
    splitLayout(
      textInput(inputId="input1", label="Input 1"),
      radioButtons(inputId="operation", label="Operation", choices=c("+","-")),
      textInput(inputId="input2", label="Input 2")
    ),
    actionButton(inputId="compute", label="Compute!"),
    h3("Result:"),
    uiOutput(outputId="result")
  )
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
calculate <- function(first, second, operation) {
  if(operation == "+") {
    return(first + second)
  }
  if(operation == "-") {
    return(first - second)
  }
}


# 3. Instantiate global variables with default values ----------------------



# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  
  #Responds to the button
  #Assign new values to the global variables
  observeEvent(input$compute, {
    first <- input$input1
    second <- input$input2
    operation <- input$operation
    result <- calculate(as.numeric(first), as.numeric(second), operation)
    output$result <- renderUI(paste(first, operation, second, "=", result))
  })

}

# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



