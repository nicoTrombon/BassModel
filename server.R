
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
library(ggplot2)
library(shiny)

shinyServer(function(input, output) {
   
  output$acumPlot <- renderPlot({
     
    # generate and plot an rnorm distribution with the requested
    # number of observations
    q=input$q
    p=input$p
    Year<-seq(2014,2034,by=1)
    t<-Year-min(Year)
    MarketShare<-(1-exp(-(p+q)*t))/(1+(q/p)*exp(-(p+q)*t))
    dataset=data.frame(Year, MarketShare)
    p<-ggplot(data=dataset,aes(x=Year,y=MarketShare)) + geom_line(size=2, colour="red") + geom_point(size=6, fill="white") + scale_shape_manual(values=c(22,21))
    print(p)
  })
  
})
