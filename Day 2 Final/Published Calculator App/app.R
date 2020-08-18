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
# 1. c) i. Display Layout (box, fluidRow, column, splitLayout) ----------------
# 1. c) ii. Input Widgets (text, numeric, slider, checkbox, radio, button) ----
# 1. c) iii. Outputs (text, plot, table) --------------------------------------

body <- dashboardBody(
  fluidRow(
    box(
      width=6,
      h3("Standard Calculator"),
      splitLayout(
        textInput(inputId="calcInput1", label="Input 1", width=100),
        radioButtons(inputId="calcOperation", label="Operation", choices=c("+","-","*","/","^")),
        textInput(inputId="calcInput2", label="Input 2", width=100)
      ),
      actionButton(inputId="calcButton", label="Compute!"),
      h4("Result:"),
      uiOutput(outputId="calcResult")
    ),
    box(
      width=6,
      h3("Prime Factorization"),
      textInput(inputId="primeInput", label="Enter an integer greater than 2."),
      splitLayout(
        actionButton(inputId="factorButton", label="Find all factors!"),
        actionButton(inputId="primeButton", label="Find Prime Factorization!")
      ),
      hr(),
      uiOutput(outputId="factorResult"),
      uiOutput(outputId="primeResult")
    )
  ),
  fluidRow(
    box(
      width=6,
      h3("Modular Calculator"),
      splitLayout(
        textInput(inputId="modInput1", label="Input 1", width=100),
        radioButtons(inputId="modOperation", label="Operation", choices=c("+","-","*","/","^")),
        textInput(inputId="modInput2", label="Input 2", width=100)
      ),
      textInput(inputId="mod", label="Mod"),
      actionButton(inputId="modButton", label="Compute!"),
      h4("Result:"),
      uiOutput(outputId="modResult")
    ),
    box(
      width=6,
      h3("Binary Calculator"),
      textInput(inputId="binaryInput", label="Enter a positive number in binary or decimal."),
      splitLayout(
        actionButton(inputId="binaryButton", label="Convert to Binary!"),
        actionButton(inputId="decimalButton", label="Convert to Decimal!")
      ),
      hr(),
      uiOutput(outputId="binaryResult")
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
  if(operation == "*") {
    return(a * b)
  }
  if(operation == "/") {
    return(a / b)
  }
  if(operation == "^") {
    return(a ^ b)
  }
}

factorize <- function(number) {
  if(number < 2 || number != round(number)) {
    return("Error. Input must be an integer greater than 2.")
  }
  factors <- c()
  for(i in 1:number) {
    if(number %% i == 0) {
      factors <- c(factors, i)
    }
  }
  factorsString <- paste(factors, collapse=", ")
  message <- paste("The factors of", number, "are:", factorsString)
  return(message)
}
#factorize(24)

library(primes) #Run this command
primefactorize <- function(number) {
  if(number < 2 || number != round(number)) {
    return("Error. Input must be an integer greater than 2.")
  }
  primes <- generate_primes(0, number)
  n <- number
  primefactors <- c()
  for(i in primes) {
    while(n %% i == 0) {
      n = n/i
      primefactors <- c(primefactors, i)
    }
  }
  primefactorsString <- paste(primefactors, collapse=" x ")
  message <- paste("The prime factorization of", number, "is:", primefactorsString)
  return(message)
}
#primefactorize(360)


# 3. Instantiate global variables with default values ----------------------
input1 <- 1
input2 <- 1
operation <- ""

# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  observeEvent(input$calcButton, {
    input1 <<- input$calcInput1
    input2 <<- input$calcInput2
    operation <<- input$calcOperation
    
    if(is.na(as.numeric(input1)) || is.na(as.numeric(input2))) {
      output$calcResult <- renderUI("Error. Inputs must be numbers.")
    } else {
      result <- calculate(as.numeric(input1), as.numeric(input2), operation)
      outputMessage <- paste(input1, operation, input2, "=", result)
      output$calcResult <- renderUI(outputMessage)
      
      if(input2 == 0 & operation == "/") {
        output$calcResult <- renderUI("Error. Cannot divide by 0.")
      }
    }
  })
  
  observeEvent(input$factorButton, {
    input <- input$primeInput
    if(is.na(as.numeric(input))) {
      output$factorResult <- renderUI("Error. Inputs must be numbers.")
    } else {
      output$factorResult <- renderUI(factorize(as.numeric(input)))
    }
  })
  
  observeEvent(input$primeButton, {
    input <- input$primeInput
    if(is.na(as.numeric(input))) {
      output$primeResult <- renderUI("Error. Inputs must be numbers.")
    } else {
      output$primeResult <- renderUI(primefactorize(as.numeric(input)))
    }
  })
  
  observeEvent(input$modButton, {
    input1 <<- input$modInput1
    input2 <<- input$modInput2
    operation <<- input$modOperation
    mod <- input$mod
    
    if(is.na(as.numeric(input1)) || is.na(as.numeric(input2)) || is.na(as.numeric(mod))) {
      output$modResult <- renderUI("Error. Inputs must be numbers.")
    } else {
      result <- calculate(as.numeric(input1), as.numeric(input2), operation) %% as.numeric(mod)
      outputMessage <- paste("(", input1, operation, input2, ") mod", mod, "=", result)
      output$modResult <- renderUI(outputMessage)
      
      if(input2 == 0 & operation == "/") {
        output$modResult <- renderUI("Error. Cannot divide by 0.")
      }
    }
  })
  
  observeEvent(input$binaryButton, {
    output$binaryResult <- renderUI("*** WORK IN PROGRESS ***")
  })
  observeEvent(input$decimalButton, {
    output$binaryResult <- renderUI("*** WORK IN PROGRESS ***")
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



