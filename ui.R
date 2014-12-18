library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Chart"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
               Information will be collected from yahoo finance."),
      
      textInput("symb", "Symbol", "IBM"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2013-01-01", 
                     end = as.character(Sys.Date())),
      
      actionButton("get", "Get Stock"),
      
      br(),
      br(),
      
      checkboxInput("MACD", "add MACD under the chart", 
                    value = FALSE),
      selectInput("Theme", "Chart Theme", c("white", "black"))
      ),
    
    mainPanel(plotOutput("plot"))
  )
))