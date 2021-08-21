#    THis is the project for john hoppkins data science course 9 project 3
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Iris data analysis"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("specie",
                        "Select the Specie to generate plot",
                        selected = "versicolor",
                        multiple = FALSE,
                        choices = iris$Species)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
