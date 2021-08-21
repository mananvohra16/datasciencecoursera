
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
    
        ggplot(iris[iris$Species == input$specie,], aes(x=Sepal.Width, y=Sepal.Length)) + 
            geom_point() +
            labs(title = paste0("Sepal width vs Sepal length plot for specie = ", input$specie))
    })

})
