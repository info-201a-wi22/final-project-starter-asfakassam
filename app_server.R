library(dplyr)
library(plotly)
library(ggplot2)

server <- function(input, output){
  timeout = 9000
  crime_state <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv")

  sorted_data <- crime_state %>%
    filter(Year >= 2005 & Year <= 2011)%>%
    select(State, Year, Data.Totals.Property.All)
  
  before_rec <- c(2005:2006)
  during_rec <- c(2007:2009)
  after_rec <- c(2010:2011)
  
  sorted_data$Year[sorted_data$Year %in% before_rec] <- "Before the Recession"
  sorted_data$Year[sorted_data$Year %in% during_rec] <- "During the Recession"
  sorted_data$Year[sorted_data$Year %in% after_rec] <- "After the Recession"
  
  sorted_data <- sorted_data %>%
    group_by(State, Year) %>%
    summarise(property_crimes = sum(Data.Totals.Property.All))
  
  plot_data <- crime_state %>%
    filter(Year >= 2005 & Year <= 2011)%>%
    select(State, Year, Data.Totals.Violent.All)
  
  before_rec <- c(2005:2006)
  during_rec <- c(2007:2009)
  after_rec <- c(2010:2011)
  
  plot_data$Year[plot_data$Year %in% before_rec] <- "Before Recession"
  plot_data$Year[plot_data$Year %in% during_rec] <- "During Recession"
  plot_data$Year[plot_data$Year %in% after_rec] <- "After Recession"
  
  plot_data <- plot_data %>%
    group_by(State, Year) %>%
    summarise(violent_crimes = sum(Data.Totals.Violent.All))
  
  output$scatter <- renderPlotly({
    p <- ggplot(
      data = sorted_data, 
      mapping = aes (x = State, y = property_crimes, fill = Year)
    ) + 
      geom_point(size = input$size)+
      ggtitle("Relationship Between CO2 Emission and the Variables") +
      labs(x = "state", y = "number of property crimes", colour ="year")
    p
  })
  
  output$bar <- renderPlotly({
    crime_plot <- ggplot(
      data = plot_data,  
      mapping = aes(x = input$state, y = violent_crimes, fill = Year),
      )+
      geom_col()+
      ggtitle ("Bar Chart of Total Number of Violence Crime  (2005-2011)")+
      labs(x = "State", y="Total Number of Violence Crime", colour = "year")  
      crime_plot
  
  })
  

  
}
