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
  title="Title here",
  titleWidth=400
)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable=FALSE,
  h4("Here is the sidebar")
)



# 1. c) Body -----------------------------------------------------------------
  # 1. c) i. Display Layout (box, fluidRow, column) ------------------------------
  # 1. c) ii. Outputs (text, plot, table) ---------------------------------------------
  # 1. c) iii. Widgets (checkbox, slider, numeric, radio, button) ----------------
  # 1. c) iv. CSS formatting ----------------------------------------------------

body <- dashboardBody(
  fluidRow(
    box(
      width=12,
      h3("Here is a box.")
    )
  ),
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
        actionButton(inputId="unbutton", label="Unclick Me!"),
        actionButton(inputId="plotButton", label="Plot sin(x)!")
      )
    ),
    column(
      width=6,
      h3("Column 2: Outputs"),
      uiOutput(outputId="textOutput"),
      uiOutput(outputId="numericOutput"),
      uiOutput(outputId="sliderOutput"),
      uiOutput(outputId="checkboxOutput"),
      uiOutput(outputId="radioOutput"),
      uiOutput(outputId="buttonOutput"),
      hr(),
      plotOutput(outputId="plot")
    )
  ),
  tags$style("#result{color:red}")
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
#source("shinytutorial1.R")


# 3. Instantiate global variables with default values ----------------------


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {

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
  
  observeEvent(input$plotButton, {
    output$plot <- renderPlot(curve(sin))
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



