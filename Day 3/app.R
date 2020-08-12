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
header <- dashboardHeader(title = "Here is the Title", titleWidth = 600)

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
      checkboxInput(inputId = "prime", label = "Primes Only", value = FALSE),
      sliderInput(inputId = 'n', label = 'n', min = 2, max = 50, value = 2, step = 1),
      numericInput(inputId = "leftValue", label = "Value of x", value = 0),
      numericInput(inputId = "rightValue", label = "Value of y", value = 0),
      radioButtons(inputId = "operation", label = "Operation Type", choices = c("+", "-", "*", "/", "^"), inline=TRUE),
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
source("modular.R")


# 3. Instantiate global variables with default values ----------------------
n <- 2
operation <- "+"
leftValue <- 0
rightValue <- 0
prime <- FALSE

# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  

  # a) Initialize starting UI output ----------------------------------------

  #Functions that create default UI settings based on user input values
  #e.g. Input: mod, Output: renders appropriate data tables
  updateTables <- function(n) {
    # numbers from 0 to n - 1 for the table header
    v <- seq(0, n - 1, 1)
    # creates our multiplication table
    # outer: takes in rows, columns, and then applies that function to each combo of row/column
    # cbind it to v so we have our row names because R doesn't let us have rownames
    multbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x * y) %% n)))
    # labels the columns
    colnames(multbldf) <- c("Multiply", v)
    # plotting tool: just pass in a dataframe and it'll render a flextable
    multbl <- flextable(multbldf)
    # calling our getColors helper function
    colors <- getColors(multbldf, 1)
    # for each entry in the colors matrix (num columns in the matrix)
    for (k in 1:length(colors[2,])) {
      # first column is our row names, so we don't want to color that
      # colors[2,][k] is the column coordinate
      # colors[1,][k] is the row coordinate
      if (colors[2,][k] != 1) {
        # bg function colors cells in a flextable
        # i is the row, j is the column
        multbl <- bg(multbl, i = colors[1,][k], j = colors[2,][k], bg = "lightpink")
        # for accessibility, we will also bold it
        multbl <- bold(multbl, i = colors[1,][k], j = colors[2,][k])
      }
    }
    # we're doing the same thing but for addition table
    addtbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x + y) %% n)))
    colnames(addtbldf) <- c("Add", v)
    addtbl <- flextable(addtbldf)
    # different variable name just for good practice
    colors2 <- getColors(addtbldf, 0)
    # same thing, colors2[1,] and colors2[2,] have the same length, so either works
    for (k in 1:length(colors2[1,])) {
      # again, don't color the first column
      if (colors2[2,][k] != 1) {
        addtbl <- bg(addtbl, i = colors2[1,][k], j = colors2[2,][k], bg = "lightpink")
        addtbl <- bold(addtbl, i = colors2[1,][k], j = colors2[2,][k])
      }
    }
    # multiplicationTable was passed in as output, so this is just how you render a table
    output$multiplicationTable <- renderUI({htmltools_value(multbl)})
    output$additionTable <- renderUI({htmltools_value(addtbl)})
  }
  
  # Initialize default UI view
  updateTables(2) #Default view: displays 2x2 tables
  
  # Functions that respond to events in the input
  #observeEvent(input$"inputIDname",{commands})
  
  observeEvent(input$n, {
    n <<- input$n #Reassign values to global variables with "<<-"
    output$result <- renderUI(paste("N changed to", n)) #Change value of uiOutput with renderUI
    updateTables(n)
    if (prime) {
      n <<- closestPrime(n, 2, 50, 0)
      updateSliderInput(session, inputId = "n", value = n)
    }
  })
  
  observeEvent(input$prime, {
    prime <<- input$prime
    if (prime) {
      n <<- closestPrime(n, 2, 50, 0)
      updateSliderInput(session, inputId = "n", value = n)
      updateTables(n)
    }
    output$result <- renderUI("")
  })
  
  observeEvent(input$buttonCompute, {
    n <<- input$n
    operation <<- input$operation
    leftValue <<- as.numeric(input$leftValue)
    rightValue <<- as.numeric(input$rightValue)
    output$result <- renderUI(withMathJax(convertEquation(n, operation, leftValue, rightValue)))
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)
#To publish the app to the internet, click "Publish" and follow the instructions on the RShiny website

