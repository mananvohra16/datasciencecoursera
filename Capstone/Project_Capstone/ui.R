#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(stringr)

#' Source ngram matching function
source("ngram_load.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("JHU Data Science Capstone Project"),
    p("This application take text words as input and predicts the next words as per the ngram algorithim"),
    p("Author: Manan Vohra"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h2("Instructions of using this application"), 
            h5("1. Enter words in the text box"),
            h5("2. Application will predict the next words below"),
            br(),

        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("word prediction",
                         textInput("user_input", h3("User Input:"), 
                                   value = "user words"),
                         h3("Predicted Next Word:"),
                         h4(em(span(textOutput("ngram_output"), style="color:Green"))))
                
               
            )   
        )
    )
   
))
