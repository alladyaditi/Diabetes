#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library("shinythemes")
library(ggplot2)
library(mlbench)
library(rsconnect)
library(ggplot2)
# Define UI for application that draws a histogram
ui <- navbarPage("Female Pima Indians Diabetes",theme = shinytheme("sandstone"),
                 tabPanel("Descriptive Statistics",
                          fluidPage( titlePanel("Female Pima Indians Diabetes Descriptive Statistics"),sidebarLayout(
                              sidebarPanel(selectInput(inputId = "dataset",
                                                       label = "Choose a dataset:",
                                                       choices = c("Pima Indians Diabetes")),
                                           numericInput(inputId = "obs",
                                                        label = "Number of observations to view:",
                                                        value = 10)
                              ),
                              mainPanel(
                                  verbatimTextOutput("summary"),
                                  tableOutput("view")
                                  
                              )
                          )
                          )
                 ),tabPanel("Visualization",fluidPage(
                     titlePanel("Female Pima Indians Diabetes Visualization"),
                     sidebarLayout(
                         sidebarPanel( selectInput(inputId = "y", 
                                                   label = "Y-axis:",
                                                   choices = names(PimaIndiansDiabetes), 
                                                   selected = "glucose"),
                                       selectInput(
                                           inputId = "x", 
                                           label = "X-axis:",
                                           choices =names(PimaIndiansDiabetes),
                                           selected = "age"), 
                                       selectInput(
                                           inputId = "z", 
                                           label = "Color by:",
                                           choices =names(PimaIndiansDiabetes),
                                           selected = "Diabetes")),
                         mainPanel(
                             plotOutput(outputId = "boxplot")
                         )
                     )
                 )),tabPanel("Statistical Analysis",fluidPage(
                     titlePanel("Female Pima Indians Diabetes Statistical Analysis "),
                     sidebarLayout(
                         sidebarPanel( 
                             selectInput(inputId = "data",
                                         label = "Choose a dataset:",
                                         choices = c("Pima Indians Diabetes")),    
                             selectInput(
                                 inputId = "a", 
                                 label = "Response Variable",
                                 choices =names(PimaIndiansDiabetes)
                             ), 
                             selectInput(
                                 inputId = "b", 
                                 label = "Explanatory Variable",
                                 choices =names(PimaIndiansDiabetes)
                             )
                             
                             
                         ),
                         mainPanel(
                             h2("T- Test two sample"),
                             verbatimTextOutput("stats"),
                             h2("T- Test one sample")  ,
                             verbatimTextOutput("stats1"),
                             h2("Wilcox Test"),
                             verbatimTextOutput("stats3"),
                             p("Are testing the null hypothesis that the mean of population equals to the value you set."),
                             p("A low P value suggests that your sample provides enough evidence that you can reject the null hypothesis for the entire population. This is for the T-test one and Two sample t-test.")
                         )
                     )
                 )
                 )
)
