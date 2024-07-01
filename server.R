library(shiny)
data("Theoph")

shinyServer(function(input, output) {
    output$PLOT <- renderPlot({
      model <- nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl),data = Theoph)
      predictions <- predict(model, 
                             newdata = data.frame(Dose=input$Dose,
                                                  Time = input$Time))
      g<- plot(conc~Time, data = Theoph,col=Subject,
               main="Theophylline concentration vs. Time", xlab = "Time(h)", 
               ylab="conc(mg/L)",pch=16)
      g
      points(x=input$Time, y=input$Dose, pch=19,col="red",lwd=10)
    })
    output$Theoph_conc <- renderText({
      model <- nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl),data = Theoph)
      predictions <- predict(model, 
                             newdata = data.frame(Dose=input$Dose,
                                                  Time = input$Time))
      result <- paste(round(predictions,2)," mg/L")
      result
    })
})

