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
header <- dashboardHeader(
  title="Modular Arithmetic",
  titleWidth=400
)



# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable=FALSE,
  h4("Here is the sidebar")
)



# 1. c) Body -----------------------------------------------------------------
  # 1. c) i. Display Layout (box, fluidRow, column) ------------------------------
  # 1. c) ii. Outputs (text, table) ---------------------------------------------
  # 1. c) iii. Widgets (checkbox, slider, numeric, radio, button) ----------------
  # 1. c) iv. CSS formatting ----------------------------------------------------

body <- dashboardBody(
  fluidRow(
    column(
      width=6,
      checkboxInput(inputId="primes", label="Primes Only", value=FALSE),
      sliderInput(inputId="n", label="n", min=2, max=50, value=2),
      numericInput(inputId="x", label="x", value=0),
      numericInput(inputId="y", label="y", value=0),
      radioButtons(inputId="operation", label="Operations", choices=c("+","-","*","/", "^"), selected="+", inline=TRUE),
      actionButton(inputId="computeButton", label="Compute!")
    ),
    column(
      width=6,
      h4("Here is the resulting equation:"),
      uiOutput(outputId="result")
    )
  ),
  fluidRow(
    tableOutput(outputId="multiplicationTable")
  ),
  fluidRow(
    tableOutput(outputId="additionTable")
  ),
  tags$style("#result{color:red}")
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
#source("shinytutorial1.R")


# 3. Instantiate global variables with default values ----------------------
n <- 2
prime <- FALSE
leftValue <- 0
rightValue <- 0
operation <- "+"


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  #Input: mod, Output: renders appropriate data tables
  # updateTables <- function(n) {
  #   v <- seq(0, n - 1, 1)
  #   multbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x * y) %% n)))
  #   colnames(multbldf) <- c("Multiply", v)
  #   multbl <- flextable(multbldf)
  #   colors <- getColors(multbldf, 1)
  #   for (k in 1:length(colors[2,])) {
  #     if (colors[2,][k] != 1) {
  #       multbl <- bg(multbl, i = colors[1,][k], j = colors[2,][k], bg = "lightpink")
  #       multbl <- bold(multbl, i = colors[1,][k], j = colors[2,][k])
  #     }
  #   }
  #   
  #   addtbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x + y) %% n)))
  #   colnames(addtbldf) <- c("Add", v)
  #   addtbl <- flextable(addtbldf)
  #   colors2 <- getColors(addtbldf, 0)
  #   for (k in 1:length(colors2[1,])) {
  #     if (colors2[2,][k] != 1) {
  #       addtbl <- bg(addtbl, i = colors2[1,][k], j = colors2[2,][k], bg = "lightpink")
  #       addtbl <- bold(addtbl, i = colors2[1,][k], j = colors2[2,][k])
  #     }
  #   }
  #   output$multiplicationTable <- renderUI({htmltools_value(multbl)})
  #   output$additionTable <- renderUI({htmltools_value(addtbl)})
  # }
  # 
  # #Initialize
  # updateTables(2)
  # 
  # observeEvent(input$primes, {
  #   n <<- input$n
  #   prime <- input$primes
  #   if(prime) {
  #     n <<- closestPrime(n, low=2, high=50, radius=0)
  #     updateSliderInput(session, inputId="n", value=n)
  #   }
  # })
  # 
  # observeEvent(input$n, {
  #   n <<- input$n
  #   prime <<- input$primes
  #   updateTables(n)
  #   if(prime) {
  #     n <<- closestPrime(n, low=2, high=50, radius=0)
  #     updateSliderInput(session, inputId="n", value=n)
  #   }
  # })
  # 
  # observeEvent(input$computeButton, {
  #   n <<- input$n
  #   leftValue <<- input$x
  #   rightValue <<- input$y
  #   operation <<- input$operation
  #   output$result <- renderUI(withMathJax(convertEquation(n, operation, leftValue, rightValue)))
  # })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



