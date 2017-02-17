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
#library(plyr)
library(dplyr)
data(diamonds)

# Define server logic required to determine the min and max price for a diamond 
# given the input values

shinyServer(function(input, output) {
    
  diamonds_reactive <- reactiveValues(minprice = 0, maxprice = 0, filtered_diamond_set = NULL)
  observeEvent(input$submit, {
    #  names(diamonds)
      
    #  rename(diamonds, 
    #         c("depth" = "total depth",
    #           "x" = "length(mm)", 
    #           "y" = "width(mm)",
    #           "z" = "depth(mm)",
    #           "table" = "top width"))
    #  glimpse(diamonds)  
    isolate({
      
      if(!is.null(input$color))
      {
        color_filter <- as.character(input$color)
      }
      if(!is.null(input$clarity))
      {
        clarity_filter <- as.character(input$clarity)
      }
      if(!is.null(input$cut))
      {
        cut_filter <- as.character(input$cut)
      }
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


