#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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
  
# Define server logic required to draw a histogram
server <- function(input, output) {
    
    
    datasetInput <- reactive({
        switch(input$dataset,
               "Pima Indians Diabetes" = PimaIndiansDiabetes 
        )
    })
    
    
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
    
    output$view <- renderTable({
        head(datasetInput(), n = input$obs)
    })
    output$boxplot <- renderPlot({
        ggplot(data = PimaIndiansDiabetes, aes_string(x =input$x, y = input$y, color= input$z)) +
            geom_boxplot(fill="peachpuff")+theme_minimal()
    })
    data<- reactive({
        switch(input$data,
               "Pima Indians Diabetes" = PimaIndiansDiabetes 
        )
        
    })
    ttest<- reactive({
        var1 <- data()[,input$a]
        var2 <- data()[,input$b]
        t.test(var1,var2)
    })
    ttest1<- reactive({
        var <- data()[,input$a]
        var1 <- data()[,input$b]
        diff<-var-var1
        t.test(diff)
    })
    ttest2<- reactive({
        var <- data()[,input$a]
        var1 <- data()[,input$b]
        wilcox.test(var,var1)
    })
    output$stats <- renderPrint({
        #x<-as.numeric(ttest())
        x<-ttest()
        x
    })
    output$stats1 <- renderPrint({
        
        x<-ttest1()
        x
        
    })
    output$stats3 <- renderPrint({
        
        x<-ttest2()
        x
        
    })
}
