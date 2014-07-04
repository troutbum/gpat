library(shiny)
library(ggplot2)

library(datasets)
library(RColorBrewer)
colors1 <- brewer.pal(9, "Greens")
palette1 <- colorRampPalette(colors1)
colors2 <- brewer.pal(9, "YlOrRd")
palette2 <- colorRampPalette

shinyServer(function(input, output) {
        
        output$plot <- renderPlot({
                
                datasetInput <- data.frame(
                        Name = c("Accuracy",
                                 "Agility",
                                 "Balance",
                                 "Coordination",
                                 "Endurance",
                                 "Flexibility",
                                 "Power",
                                 "Stamina",
                                 "Strength",
                                 "Speed"),
                        Value = c(input$accuracy,
                                  input$agility,
                                  input$balance,
                                  input$coordination,
                                  input$endurance,
                                  input$flexibility,
                                  input$power,        
                                  input$stamina,
                                  input$strength,
                                  input$speed), stringsAsFactors=FALSE)               
                
                p <- ggplot(datasetInput, aes(Name, Value, fill = factor(Value))) + 
                        geom_bar(stat="identity") + 
                        coord_polar() +
                        theme(legend.position="none") +
                        labs(x=format(input$date, format="%A %B %d, %Y")) + 
                        labs(y="") + 
                        scale_y_continuous(limits=c(0,10)) +
                        labs(title="") +     
                        scale_fill_manual(values=palette1(10)) +
                        theme(plot.title = element_text(size = rel(2), face="bold"))
                print(p)
                
                })
        height=700
        })