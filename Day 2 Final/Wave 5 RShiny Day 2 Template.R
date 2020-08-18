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

)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(

)

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
  
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



