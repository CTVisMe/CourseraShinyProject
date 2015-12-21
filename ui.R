library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Smoothing parameter plot"),
 
  sidebarPanel(
      dateInput("startdate",label="Start Date",value="2011-11-11"),
      dateInput("enddate",label="End Date",value="2015-10-09"),
      sliderInput("numspan",label="Span of Loess Smooth",min=0.05,max=0.5,step=0.05,value=0.25) 
  ),
  mainPanel(
    plotOutput('newHist')
  )
))
