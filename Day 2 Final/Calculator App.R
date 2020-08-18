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
  fluidRow(
    box(
      width=6,
      h3("Standard Calculator"),
      splitLayout( #Inputs
        textInput(inputId="calcInput1", label="Input 1", width=100),
        radioButtons(inputId="calcOperation", label="Operation", choices=c("+","-")),
        textInput(inputId="calcInput2", label="Input 2", width=100)
      ),
      actionButton(inputId="calcButton", label="Compute!"),
      h4("Result:"),
      uiOutput(outputId="calcResult") #Calculated output
    )
  )
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
calculate <- function(a, b, operation) {
  if(operation == "+") {
    return(a + b)
  }
  if(operation == "-") {
    return(a - b)
  }
}


# 3. Instantiate global variables with default values ----------------------
input1 <- 1
input2 <- 1
operation <- ""


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  observeEvent(input$calcButton, { #Responds to the button
    
    #Assign new values to the global variables
    input1 <<- input$calcInput1
    input2 <<- input$calcInput2
    operation <<- input$calcOperation
    
    if(is.na(as.numeric(input1)) || is.na(as.numeric(input2))) {
      output$calcResult <- renderUI("Error. Inputs must be numbers.") #Error handling message
    } else {
      result <- calculate(as.numeric(input1), as.numeric(input2), operation)
      outputMessage <- paste(input1, operation, input2, "=", result)
      output$calcResult <- renderUI(outputMessage)
    }
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



