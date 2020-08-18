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
  title="Title here",
  titleWidth=400
)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable=FALSE,
  h4("Here is the sidebar")
)


# 1. c) Body ------------------------------------------------------------------
# 1. c) i. Display Layout (box, fluidRow, column, splitLayout) ----------------
# 1. c) ii. Input Widgets (text, numeric, slider, checkbox, radio, button) ----
# 1. c) iii. Outputs (text, plot, table) --------------------------------------

# 1. c) Body -----------------------------------------------------------------
body <- dashboardBody(
  # Tip: don't forget commas between arguments, but don't put a comma after the last argument
  # 1. c) i. Display Layout ------------------------------------------------------------
  
  #a) box() creates a box
  box(
    width=NULL, height=NULL, #Specify the width and height. NULL spans the box across the entire screen.
    h3("Here is a box with examples of Layout Options."),
    
  #b) fluidRow() creates a row
  #c) column() creates a column within a row
    fluidRow(
      column(
        width=4, #Specify the width from 1-12
        h4("FluidRow #1 Column #1")
      ),
      column(
        width=4,
        h4("FluidRow #1 Column #2")
      )
    ),
    fluidRow(
      column(
        width=4, #Specify the width from 1-12
        h4("FluidRow #2 Column #1")
      ),
      column(
        width=4,
        h4("FluidRow #2 Column #2")
      )
    ),
  ),
  
  # 1. c) ii. Widgets --------------------------------------------------------------
  # Specify an inputId and a label for each widget, as well as any other parameters specific to the widget type.
  # The inputId is the name which a widget will be referred to in the server section below. 
  # The label is the name of the widget displayed to the user in the app.
  fluidRow(
    column(
      width=6,
      h3("Column 1: Shiny Widgets"),
      textInput(inputId="textInput", label="Text Box", value="", placeholder="Placeholder"),
      numericInput(inputId="numericInput", label="Numeric Input", value=0),
      sliderInput(inputId="sliderInput", label="Slider", min=0, max=10, value=5, ticks=FALSE),
      checkboxGroupInput(inputId="checkboxInput", label="Checkboxes", choices=c("Choice 1", "Choice 2", "Choice 3"), selected="Choice 1", inline=TRUE),
      radioButtons(inputId="radioInput", label="Multiple Choice Answers", choices=c("Choice 1", "Choice 2", "Choice 3"), selected="Choice 1", inline=TRUE),
      splitLayout(
        actionButton(inputId="button", label="Click Me!"), 
        actionButton(inputId="unbutton", label="Unclick Me!")
      ),
    ),

  # 1. c) iii. Outputs --------------------------------------------------------------
  # To insert plain text, wrap the plain text inside an HTML tag like h1,h2,h3,... where the number specifies the size
  # h4("Here is a plain text output.") --> this code displays static text that will be unchanged
  # uiOutput(outputId = "idForUiOutput") --> this code displays dynamic text that can be changed in the server section
    column(
      width=6,
      h3("Column 2: Outputs"),
      uiOutput(outputId="textOutput"),
      uiOutput(outputId="numericOutput"),
      uiOutput(outputId="sliderOutput"),
      uiOutput(outputId="checkboxOutput"),
      uiOutput(outputId="radioOutput"),
      uiOutput(outputId="buttonOutput"),
    )
  ),
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------


# 3. Instantiate global variables with default values ----------------------


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {

  # observeEvent launches an action immediately when the object specified by its inputId changes
  # You can reference values inside widgets with input$inputId
  # To change text displayed to the user, place your updated message into the renderUI() function
  observeEvent(input$textInput, {
    textInput <- input$textInput
    output$textOutput <- renderUI(paste("The text input is", textInput))
  })
  
  observeEvent(input$numericInput, {
    numericInput <- input$numericInput
    output$numericOutput <- renderUI(paste("The numeric input is", numericInput))
  })
  
  observeEvent(input$sliderInput, {
    sliderInput <- input$sliderInput
    output$sliderOutput <- renderUI(paste("The slider value is", sliderInput))
  })
  
  observeEvent(input$checkboxInput, {
    checkboxInput <- paste(input$checkboxInput, collapse=", ")
    output$checkboxOutput <- renderUI(paste("The checkboxes selected are", checkboxInput))
  })
  
  observeEvent(input$radioInput, {
    radioInput <- input$radioInput
    output$radioOutput <- renderUI(paste("The radio button selected is", radioInput))
  })
  
  observeEvent(input$button, {
    output$buttonOutput <- renderUI("The button has been clicked.")
  })
  
  observeEvent(input$unbutton, {
    output$buttonOutput <- renderUI("")
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



