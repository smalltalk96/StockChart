# server.R

library(quantmod)

shinyServer(function(input, output) {
  data <- reactive({getSymbols(input$symb, src = "yahoo", 
                     from = input$dates[1],
                     to = input$dates[2],
                     auto.assign = FALSE)
                    })
  output$plot <- renderPlot({
    cat(input$Theme)
    chartSeries(data(), theme = chartTheme(input$Theme), 
                type = "candlesticks", TA = NULL)
    if (input$MACD) {
      addMACD()
    }
  })
  
})