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


# 1. c) Body ------------------------------------------------------------------
body <- dashboardBody(
  
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------



# 3. Instantiate global variables with default values ----------------------



# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  
  #Responds to the button
  #Assign new values to the global variables
  #Error handling message

}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



