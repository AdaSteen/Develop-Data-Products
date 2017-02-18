#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library("ggplot2")
library(dplyr)
data(diamonds)

shinyServer(function(input, output) {
    
  diamonds_reactive <- reactiveValues(filtered_diamond_set = NULL)
  observeEvent(input$submit, {
    
    isolate({
      
      diamonds_reactive$filtered_diamond_set <- dplyr::filter(diamonds,
                                                carat==input$carat,
                                                cut==as.character(input$cut),
                                                clarity==as.character(input$clarity),
                                                color==as.character(input$color))

      names(diamonds_reactive$filtered_diamond_set) = c("carat","cut","color","clarity",
                                                        "total depth",
                                                        "top width",
                                                        "price",
                                                        "length(mm)", 
                                                        "width(mm)",
                                                        "depth(mm)")
      
      diamonds_reactive$filtered_diamond_set<-diamonds_reactive$filtered_diamond_set[,c(1,2,3,4,7,5,6,8,9,10)]
      })
  })
  
  output$diamondssubset<-renderTable(diamonds_reactive$filtered_diamond_set)

  })


