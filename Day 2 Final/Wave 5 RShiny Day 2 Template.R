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
sidebar <- dashboardSidebar(disable=FALSE, h4("Here is the sidebar"))

# Tip: don't forget commas between arguments, but don't put a comma after the last argument
# 1. c) Body ------------------------------------------------------------------

# 1. c) i. Display Layout (box, fluidRow, column, splitLayout) ----------------
  #a) box() creates a box
  #b) fluidRow() creates a row
  #c) column() creates a column within a row

# 1. c) ii. Input Widgets (text, numeric, slider, checkbox, radio, button) ----
  # Specify an inputId and a label for each widget, as well as any other parameters specific to the widget type.
  # The inputId is the name which a widget will be referred to in the server section below. 
  # The label is the name of the widget displayed to the user in the app.

# 1. c) iii. Outputs (text, plot, table) --------------------------------------
  # To insert plain text, wrap the plain text inside an HTML tag like h1,h2,h3,... where the number specifies the size
  # h4("Here is a plain text output.") --> this code displays static text that will be unchanged
  # uiOutput(outputId = "idForUiOutput") --> this code displays dynamic text that can be changed in the server section

# 1. c) Body -----------------------------------------------------------------
body <- dashboardBody(
  box(
    width=12,
    h3("Here is a box"),
    fluidRow(
      column(
        width=6,
        h4("Row 1 Col 1")
      ),
      column(
        width=6,
        h4("Row 1 Col 2")
      )
    ),
    fluidRow(
      column(
        width=6,
        h4("Row 2 Col 1")
      ),
      column(
        width=6,
        h4("Row 2 Col 2")
      )
    )
  ),
  fluidRow(
    column(
      width=6,
      h4("Column 1: Input Widgets"),
      textInput(inputId="inputText", label="Text box"),
      numericInput(inputId="inputNumeric", label="Numeric Input", value=0),
      sliderInput(inputId="inputSlider", label="Slider Input", min=0, max=10, value=5),
      checkboxGroupInput(inputId="inputCheckBox", label="Checkbox Input", choices=c("Choice 1", "Choice 2", "Choice 3"), selected="Choice 1", inline=TRUE),
      radioButtons(inputId="inputRadio", label="Radio Buttons", choices=c("Choice 1", "Choice 2"), inline=TRUE),
      splitLayout(
        actionButton(inputId="button", label="Click me!"),
        actionButton(inputId="unbutton", label="Unclick me!")
      )
    ),
    column(
      width=6,
      h4("Column 2: Outputs"),
      uiOutput(outputId="buttonText"),
      uiOutput(outputId="textOutput")
    )
  )
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------



# 3. Instantiate global variables with default values ----------------------



# 4. Create server that responds to user interaction ----------------------
  # observeEvent launches an action immediately when the object specified by its inputId changes
  # You can reference values inside widgets with input$inputId
  # To change text displayed to the user, place your updated message into the renderUI() function
server <- function(session, input, output) {
  observeEvent(input$button, {
    output$buttonText <- renderUI("This button has been clicked!")
  })
  observeEvent(input$unbutton, {
    output$buttonText <- renderUI("This button has been unclicked!")
  })
  observeEvent(input$inputText, {
    output$textOutput <- renderUI(input$inputText)
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



