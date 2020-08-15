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



# 1. b) Sidebar --------------------------------------------------------------



# 1. c) Body ------------------------------------------------------------------
# 1. c) i. Display Layout (box, fluidRow, column, splitLayout) ----------------
# 1. c) ii. Input Widgets (text, numeric, slider, checkbox, radio, button) ----
# 1. c) iii. Outputs (text, plot, table) --------------------------------------

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------


# 3. Instantiate global variables with default values ----------------------
data <- cbind(1:5, sin(1:5))

# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



