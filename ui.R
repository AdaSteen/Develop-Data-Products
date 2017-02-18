#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that receives input from the user

shinyUI(fluidPage(
    
  titlePanel("The cost of diamonds -  Select applicable values for the diamond of your dreams"),
  h3("Please select a single value for each variable and press the Submit Request button"),
  p(em("Note: if an empty output table is shown, 
       there is no such diamond in the set. 
       In such a case select a different combination
       - try carat(0.60), cut(Very Good), color(E), clarity(VS1)")),
 
  # Front-end to receive input 
  
  sidebarLayout(
      sidebarPanel(
          
       sliderInput("carat","CARAT (bt. 0.2 and 5.02)",0.2, 5.02, 0.6,0.01), #sliderinput for carat
       checkboxGroupInput("cut","CUT",c("Fair","Good","Very Good","Premium","Ideal")),
       checkboxGroupInput("color","COLOR (D - best; J - Worst",c("D","E","F","G","H","I","J")),
       checkboxGroupInput("clarity","CLARITY (IF - Best; I1 - Worst)",c("IF","VVS2","VVS1","VS2","VS1","SI2","SI1","I1")),
       actionButton("submit", "Submit Request") 
       ),
  
#
# Render a table with the price for all filtered records in the diamonds dataset
#    

mainPanel(
tableOutput("diamondssubset")
))
))

