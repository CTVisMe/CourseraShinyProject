### ui.R includes start and end date of data, plus selector for span of smoother
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("My Shiny Project"),
  sidebarPanel(
      p("this is some p text"),
      dateInput("startdate",label="Start Date",value="2011-11-11"),
      dateInput("enddate",label="End Date",value="2015-10-09"),
      sliderInput("numspan",label="Span of Loess Smooth",min=0.05,max=0.5,step=0.05,value=0.25)
  ),
  mainPanel(
    p("This is a plot of my personal weight, measured daily, for the last 4 years"),
    p("You can use the Shiny widgets to select the date range."),
    p("Also, you can change the smoothing paramter used for the LOESS smoothing spline"),
    plotOutput('newHist')
  )
))
