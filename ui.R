library(shiny)
shinyUI(fluidPage(
  titlePanel("Pharmacokinetics of Theophylline"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app shows data of theophylline concentrations in different 
               subjects"),
      h3(helpText("Select:")),
      numericInput("Dose",label = h4("Dose"),step = 0.05,value = 4.20),
      numericInput("Time",label = h4("Time"),step = 0.01,value = 5.00)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("PLOT"),
      h4("Predicted Theophylline concentration is:"),
      h3(textOutput("Theoph_conc"))
    )
  )
)
  
)