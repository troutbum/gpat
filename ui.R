library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
        
        headerPanel("GPAT - General Physical Attributes Test"),
        
        sidebarPanel(
                dateInput("date", "Test Date:"),               
                sliderInput("accuracy", "Accuracy", min=1, max=10, value=1),
                sliderInput("agility", "Agility", min=1, max=10, value=1),
                sliderInput("balance", "Balance", min=1, max=10, value=1),
                sliderInput("coordination", "Coordination", min=1, max=10, value=1),
                sliderInput("endurance", "Endurance", min=1, max=10, value=1),
                sliderInput("flexibility", "Flexibility", min=1, max=10, value=1),
                sliderInput("power", "Power", min=1, max=10, value=1),            
                sliderInput("speed", "Speed", min=1, max=10, value=1),
                sliderInput("stamina", "Stamina", min=1, max=10, value=1),
                sliderInput("strength", "Strength", min=1, max=10, value=1)
        ),
        
        mainPanel(
                
                plotOutput('plot')          
        )
))