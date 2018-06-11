library(shiny)
library(ggplot2)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  
  output$table <- renderDataTable({

    Time_seq <- seq(from = input$Time[1], to = input$Time[2], by = 1)
    Chick_seq <- seq(from = input$Chick[1], to = input$Chick[2], by = 1)
    
    data <- filter(ChickWeight, Diet %in% input$Diet, Time %in% Time_seq, Chick %in% Chick_seq)
    data
  },options = list(lengthMenu = c(5, 10, 25), pageLength = 25))
 
  
  output$plot <- renderPlot({
    Time_seq <- seq(from = input$Time[1], to = input$Time[2], by = 1)
    Chick_seq <- seq(from = input$Chick[1], to = input$Chick[2], by = 1)
    
    data <- filter(ChickWeight, Diet %in% input$Diet, Time %in% Time_seq, Chick %in% Chick_seq)
    data
    ggplot(data, aes(x = weight, y = Time, color = Diet)) + geom_point()
    
  })


  data <- reactive({
    Time_seq <- seq(from = input$Time[1], to = input$Time[2], by = 1)
    Chick_seq <- seq(from = input$Chick[1], to = input$Chick[2], by = 1)
    filter(ChickWeight, Diet %in% input$Diet, Time %in% Time_seq, Chick %in% Chick_seq)})
  output$obs <- renderText({ nrow(data()) })
  
  
})