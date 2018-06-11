library(shiny)
library(ggplot2)
library(datasets)

shinyUI(navbarPage("Chick Weights",
        tabPanel("table",
  
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput('Time', 'Time', 0, 21, value=c(0,21)),
      sliderInput('Chick', 'Chick #', 1, 50, value=c(1,50)),
      checkboxGroupInput('Diet', 'Diet #', c("1"=1, "2"=2, "3"=3, "4"=4), selected = c(1:4))
    ),
    
    mainPanel(
      h3("Chick Weights"),
      dataTableOutput('table')
             )
             ) 
               ), 
    tabPanel("plot",
            mainPanel(plotOutput("plot"),
            h4("Number of Observations:"),
            textOutput("obs"))),
   
    tabPanel("about",
            h3("Description: The ChickWeight data frame has 578 rows and 4 columns from an experiment on the 
               effect of diet on early growth of chicks."),
            h4("Format: An object of class containing the following columns:"),
            h4("weight: a numeric vector giving the body weight of the chick (gm)."),
            h4("Time: a numeric vector giving the number of days since birth when the measurement was made."),
            h4("Chick: an ordered factor with levels 18 < ... < 48 giving a unique identifier for the chick. 
               The ordering of the levels groups chicks on the same diet together and orders them according
               to their final weight (lightest to heaviest) within diet."),
            h4("Diet: a factor with levels 1, ..., 4 indicating which experimental diet the chick received."),
            h4("Details: The body weights of the chicks were measured at birth and every second day thereafter
               until day 20. They were also measured on day 21. There were four groups on chicks on different
               protein diets."),
            h4("This dataset was originally part of package nlme, and that has methods (including for 
               [, as.data.frame, plot and print) for its grouped-data classes.")
            
               )
            )
  
                      
           
                ) 
      

