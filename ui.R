
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Bass Model for Diffusion of Innovations:"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("p", 
                "Coefficient of Innovation (p):", 
                min = 0, 
                max = 0.05, 
                value = 0.03),
    sliderInput("q",
                "Coefficient of Imitation (q):",
                min=0,
                max = 0.6,
                value = 0.4)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3('Accumulated diffusion of an innovation with selected parameters p and q'),
    plotOutput("acumPlot")
  )
))
