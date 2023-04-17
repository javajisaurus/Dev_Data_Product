#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  titlePanel("Simulation of Rolling Ball on Slope"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("mass", "Mass of Ball (kg):", 1),
      checkboxInput("friction", "Friction ?", FALSE),
      sliderInput("velocity", "first velocity of ball :", min = 1, max = 35, value = 5),
      sliderInput("angle", "tilt angle:", min = 0, max = 90, value = 45),
      radioButtons(inputId = "friction_", label = "Friction:", choices = c("yes", "no"), selected = "no"),
      actionButton(inputId = "reset", label = "Reset"),
      
    ),
    
    mainPanel(
      plotOutput("plot"),
      h3("Information"),
      verbatimTextOutput(outputId = "info_gesekan"),
      h3("Maximum High (m)"),
      verbatimTextOutput(outputId = "nilai_maks")
    )
  )
)