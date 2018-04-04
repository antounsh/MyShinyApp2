# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output)
    {
    output$map <- renderPlot({
        input_var <- switch(input$var, 
           "Percent White" = counties$white,
           "Percent Black" = counties$black,
           "Percent Hispanic" = counties$hispanic,
           "Percent Asian" = counties$asian)
      
        input_color <- switch(input$var, 
           "Percent White" = "red",
           "Percent Black" = "black",
           "Percent Hispanic" = "yellow",
           "Percent Asian" = "blue")
      
        input_legend_title <- switch(input$var, 
           "Percent White" = "% White",
           "Percent Black" = "% Black",
           "Percent Hispanic" = "% Hispanic",
           "Percent Asian" = "% Asian")
      
        percent_map(var = input_var, 
                    color = input_color, 
                    legend.title = input_legend_title, 
                    max = input$range[2], 
                    min = input$range[1])
    })
  }
)