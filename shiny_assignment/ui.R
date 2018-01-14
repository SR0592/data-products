#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Venn diagram setting"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("num", "Number of lists:", 
                  choices = c(2,3,4)),
      
      textInput("caption", "Plot title:", ""),
      em(">"),
      textInput("a", "List 1:", "Input e.g. a b "),
      em("*seperate with Non-word characters."),
      textInput("l1", "Name 1", ""),
      em(">"),
      
      textInput("b", "List 2:", "Input e.g. c d "),
      em("*seperate with Non-word characters."),
      textInput("l2", "Name 2", ""),
      em(">"),
      
      textInput("c", "List 3:", "Input e.g. e f"),
      em("*seperate with Non-word characters."),
      textInput("l3", "Name 3", ""),
      em(">"),
      
      textInput("d", "List 4:", "Input e.g. g h"),
      em("*seperate with Non-word characters."),
      textInput("l4", "Name 4", ""),
      
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput('out1'),
      plotOutput("VennPlot")
    )
  )
))
