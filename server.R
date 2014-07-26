library(shiny)
library(ggplot2)
library(grid)
library(gridExtra)
library(datasets)
library(RColorBrewer)
library(wordcloud)
library(tm)

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
                        
                print(p)
    
        })
        
        output$plot2 <- renderPlot({
                
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
                
                # plot inverse (what to work on)
                todoplot <- ggplot(todo, aes(Name, Value, fill = factor(Value))) + 
                        geom_bar(stat="identity") + 
                        coord_polar() +
                        theme(legend.position="none") +
                        labs(x="Things to work on for your next training cycle") + 
                        labs(y="") + 
                        scale_y_continuous(limits=c(0,10)) +
                        labs(title="") +     
                        scale_fill_manual(values=palette2(10)) +
                        theme(plot.title = element_text(size = rel(2), face="bold"))
                
                print(todoplot)
        })
        
        output$wordcloud <- renderPlot({
                
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
                
                pcloud <- wordcloud(datasetInput$Name, datasetInput$Value, scale=c(3,.5), 
                                    max.words=100, random.order=TRUE, random.color=FALSE,
                                    rot.per=0.5, use.r.layout=FALSE, colors=rainbow(10))
                
                print(pcloud)
        })
        
        output$wordcloud2 <- renderPlot({
                
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
                
                tcloud <- wordcloud(datasetInput$Name, datasetInput$Value, scale=c(3,.5), 
                                    max.words=100, random.order=TRUE, random.color=FALSE,
                                    rot.per=0.5, use.r.layout=FALSE, colors=rainbow(10))
                
                print(tcloud)         
                
        })
        
        height=900
})