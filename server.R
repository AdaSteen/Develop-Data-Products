#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

# Define server logic required to show the graph for the combination 
# number of coinflips * number of simulations

shinyServer(function(input, output) {
    
    output$numberPlot <- renderPlot({
        
        library(ggplot2)
        
        set.seed = "2017-01-14"

        number <- input$number
        nosim <- input$nosim
        
        # code provided by Brian Caffo, Jeff Leek, Roger Peng
        # in lecture for Statistical Inference - Asymptotia 
        # changed the code to accept input values 
       
        cfunc <- function(x, n) sqrt(n) * (mean(x) - 3.5) / 1.71
        dat <- data.frame(
            x = c(apply(matrix(sample(1 : 6, nosim * number, replace = TRUE), 
                               nosim), 1, cfunc, number)
            ),
            size = factor(rep(c(number), rep(nosim, 1))))
        g <- ggplot(dat, aes(x = x)) + geom_histogram(alpha = .20, binwidth=.05, colour = "black", aes(y = ..density..)) +
                xlab("sample size - nr of simulations * nr of coin flips") 
        g <- g + stat_function(fun = dnorm, size = 2)
        g + facet_grid(. ~ size)
        g + theme_bw()
        
    })
    
})
