library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
        
        headerPanel("GPAT - General Physical Attributes Test"),
        
        sidebarPanel(
                dateInput("date", "Test Date"),               
                sliderInput("accuracy", "Accuracy", min=1, max=10, value=5),
                sliderInput("agility", "Agility", min=1, max=10, value=5),
                sliderInput("balance", "Balance", min=1, max=10, value=5),
                sliderInput("coordination", "Coordination", min=1, max=10, value=5),
                sliderInput("endurance", "Endurance", min=1, max=10, value=5),
                sliderInput("flexibility", "Flexibility", min=1, max=10, value=5),
                sliderInput("power", "Power", min=1, max=10, value=5),            
                sliderInput("speed", "Speed", min=1, max=10, value=5),
                sliderInput("stamina", "Stamina", min=1, max=10, value=5),
                sliderInput("strength", "Strength", min=1, max=10, value=5)
        ),
        
        mainPanel(
                
                tabsetPanel(type = "tabs", 
                            tabPanel("Plot Results", plotOutput("plot")),
                            tabPanel("Wordcloud", plotOutput("wordcloud")),
                            tabPanel("To Do Plot", plotOutput("plot2")),
                            tabPanel("To Do Words", plotOutput("wordcloud2"))
                ),
                p(),
                p(""),
                strong("Directions:"),
                p("The purpose of this app is to visualize your scores from the 
                  General Physical Attributes Test (GPAT) you performed in the 
                  gym.  Each attribute is scored from 1 to 10 to reflect your 
                  relative strengths and weaknesses."),
                p("You can enter your when the test was performed in the 
                  'Test Date' box on the top left of the window.  Adjust the 
                  sliders to enter your score for each attribute."),
                p("The 'Plot Results' tab displays your results in a polar graph."),
                p("The 'Wordcloud' tab shows your entries as words."),
                p("The 'To Do Plot' tab gives you a graphic of the weaknesses you 
                  should work on."),
                p("The 'To Do Words' tab gives you wordcloud of where to improve.")
        )
))