library(shiny)
library(lubridate)  # for managing dates
source("RFirst.R")  # some personal R Funcs I like, specifically qw needed here


datafile="LatestWeight.csv"  # personal dates file
weight=read.csv(datafile,header=T)
names(weight)=qw("ts weight fat lean comments")
weight$ts = parse_date_time(weight$ts,"%Y-%m-%d %H:%M %p")

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      p=ggplot(weight,aes(ts,weight),main="Plot") +
        geom_point(alpha=0.8) +
        stat_smooth(method="loess",size=2,se=FALSE,span=input$numspan) +
        xlim(ymd(input$startdate),ymd(input$enddate)) +
        ylab("Weight (in pounds)") +xlab("Date")
      p
     })
  }
)



###  original Shiny server.R text from one of the Coursera Examples, commented out

# shinyServer(
#   function(input, output) {
#     output$newHist <- renderPlot({
#       hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
#       mu <- input$mu
#       lines(c(mu, mu), c(0, 200),col="red",lwd=5)
#       mse <- mean((galton$child - mu)^2)
#       text(63, 150, paste("mu = ", mu))
#       text(63, 140, paste("MSE = ", round(mse, 2)))
#       })
#
#   }
# )
