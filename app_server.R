library(dplyr)
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

  
}