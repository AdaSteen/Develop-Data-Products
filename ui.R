#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' in RStudio.
#

library(shiny)

# Define UI for application that plot a graph showing the Central Limit Theory 
# interactively 

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Central Limit Theorem"),
    
    # Sidebar with a slider input for number of coniflips and simulations
    sidebarLayout(
        sidebarPanel(
            sliderInput("number",
                        "How many coinflips:",
                        min = 10,
                        max = 100,
                        value = 20,step = 10
                        
                        ),
            sliderInput("nosim",
                        "How many simulations:",
                        min = 0,
                        max = 1000, value = 200, step = 50)
        ),
        # Show the plot
        mainPanel(
            plotOutput("numberPlot")
        )
    )
))

