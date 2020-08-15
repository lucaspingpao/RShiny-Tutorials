library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(flextable)


# Layout/Table of Contents ------------------------------------------------
# 1. Create Header, Sidebar, Body --> UI
# 2. Create/import mathematical/formatting functions
# 3. Instantiate global variables
# 4. Create server that responds to user interaction
# 5. Deploy App
# -------------------------------------------------------------------------


# 1. a) Header ------------------------------------------------------------------
header <- dashboardHeader(title = "Calculator", titleWidth = 600)

# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable = FALSE,
  h5("Here is the sidebar!"),
  h5("All functions in the body also work in the sidebar.")
)

# 1. c) Body -----------------------------------------------------------------
body <- dashboardBody(
  # Tip: don't forget commas between arguments, but don't put a comma after the last argument
  # 1. c) i. Display Layout ------------------------------------------------------------
    
    #a) box() creates a box
    box(
      width=NULL, height=NULL, #Specify the width and height. NULL spans the box across the entire screen.
      h3("Here is a box with examples of Layout Options."),
    
    #b) fluidRow() creates a row
    #c) column() creates a column
      fluidRow(
        column(
          width=4, #Specify the width from 1-16
          h4("FluidRow #1 Column #1")
        ),
        column(
          width=4,
          h4("FluidRow #1 Column #2")
        )
      ),
      fluidRow(
        column(
          width=4, #Specify the width from 1-16
          h4("FluidRow #2 Column #1")
        ),
        column(
          width=4,
          h4("FluidRow #2 Column #2")
        )
      ),
    ),

  # 1. c) ii. Outputs --------------------------------------------------------------
    #a) To insert plain text, wrap the plain text inside an HTML tag like h1,h2,h3,... where the number specifies the size
    #h4("Here is a plain text output."),
    #uiOutput(outputId = "idForUiOutput"),
    #plotOutput(outputId="idForPlotOutput"),
    #tableOutput(outputId="idForTableOutput"),

  # 1. c) iii. Widgets --------------------------------------------------------------
  
  fluidRow(
    column(width=6,
      h3("Input here:"),
      numericInput(inputId = "leftValue", label = "Value of x", value = 0),
      numericInput(inputId = "rightValue", label = "Value of y", value = 0),
      radioButtons(inputId = "operation", label = "Operation", choices = c("+", "-", "*", "/"), inline=TRUE),
      actionButton(inputId = "buttonCompute", label = "Compute!"),
    ),
    column(width=6,
      h3("Output equation x % y:"),
      uiOutput(outputId = "result")),
  ),
  
  #Creates a modular multiplication table
  fluidRow(
    column(12, 
       tableOutput(outputId = "multiplicationTable")
    )
  ),
  
  #Creates a modular addition table
  fluidRow(
    column(12, 
      tableOutput(outputId = "additionTable")
    )
  ),
  
  # 1. c) iv. CSS formatting ----------------------------------------------------
  tags$style("#result{color:red; font-size:20px;}")
)
# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
source("arithmetic.R")


# 3. Instantiate global variables with default values ----------------------
operation <- "+"
leftValue <- 0
rightValue <- 0

# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  

  # a) Initialize starting UI output ----------------------------------------

  #Functions that create default UI settings based on user input values
  #e.g. Input: mod, Output: renders appropriate data tables
  
  # Functions that respond to events in the input
  #observeEvent(input$"inputIDname",{commands})
  
  observeEvent(input$buttonCompute, {
    operation <<- input$operation
    leftValue <<- as.numeric(input$leftValue)
    rightValue <<- as.numeric(input$rightValue)
    output$result <- renderUI(convertEquation(operation, leftValue, rightValue))
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)
#To publish the app to the internet, click "Publish" and follow the instructions on the RShiny website

