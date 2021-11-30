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
ui <- navbarPage("Diabetes",theme = shinytheme("sandstone"),
                 tabPanel("Descriptive Statistics",
                          fluidPage( titlePanel("Female Pima Indians Diabetes Descriptive Statistics"),
                            sidebarLayout(
                              sidebarPanel(  
                                           tags$div(tags$label(h4("1. Choose a dataset"))),
                                           selectInput(inputId = "dataset",
                                                       label = " ",
                                                       choices = c("Pima Indians Diabetes")),
                                           tags$div(tags$label(h4("2. Select Number of Observations"))),
                                           numericInput(inputId = "obs",
                                                        label = "",
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
                                           label = "Filter by:",
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
                           tags$div(tags$label(h4("1. Choose a dataset"))),
                             selectInput(inputId = "data",
                                         label = "",
                                         choices = c("Pima Indians Diabetes")), 
                           tags$div(tags$label(h4("2. Choose a Response Variable"))),
                             selectInput(
                                 inputId = "a", 
                                 label = " ",
                                 choices =names(PimaIndiansDiabetes)
                             ), 
                             tags$div(tags$label(h4("3. Choose a Explanatory Variable"))),
                             selectInput(
                                 inputId = "b", 
                                 label = " ",
                                 choices =names(PimaIndiansDiabetes)
                             ),
                            tags$div(tags$label(h4("4. Select a Confidence Level "))),
                             numericInput(
                                 inputId="c",
                                 label=" ",
                                 value=0.95,
                                 min=0,
                                 max=0.99,
                                 step=0.01
                             )
                             
                             
                         ),
                         mainPanel(
                             h2("T- Test Two sample"),
                             verbatimTextOutput("stats"),
                             h2("T- Test One sample")  ,
                             verbatimTextOutput("stats1"),
                             h2("Wilcox Test"),
                             verbatimTextOutput("stats3"),
                             p("Are testing the null hypothesis that the mean of population equals to the value you set."),
                             p("A low P value suggests that your sample provides enough evidence that you can reject the null hypothesis for the entire population. This is for the One and Two sample t-test.")
                         )
                     )
                 )
                 )
)
