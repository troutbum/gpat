library(shiny)
library(ggplot2)

library(datasets)
library(RColorBrewer)
colors1 <- brewer.pal(9, "Greens")
palette1 <- colorRampPalette(colors1)
colors2 <- brewer.pal(9, "YlOrRd")
palette2 <- colorRampPalette(colors2)

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
                
                # create a TO DO list, inverse of test results
                todo <- datasetInput
                todo[,2] <- abs(todo[,2] - 10)
                
                # if a Score is 0, make it a 1
                for (i in 1:nrow(todo)) 
                {
                        if (todo[i,2] == 0)  {todo[i,2] <- todo[i,2] + 1}
                }
                
                # plot datasetInput
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
                #print(p)
                
                todoplot <- ggplot(todo, aes(Name, Value, fill = factor(Value))) + 
                        geom_bar(stat="identity") + 
                        coord_polar() +
                        theme(legend.position="none") +
                        labs(x="To Do List") + 
                        labs(y="") + 
                        scale_y_continuous(limits=c(0,10)) +
                        labs(title="") +     
                        scale_fill_manual(values=palette2(10)) +
                        theme(plot.title = element_text(size = rel(2), face="bold"))
                #print(todoplot)
                
                source('~/CourseraHW/R_functions/multiplot.R')
                print(multiplot(p, todoplot, cols=2))
                
                })
        height=700
        })