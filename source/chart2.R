# 1) load the library and Dataset 
library(ggplot2)
library(dplyr)
library(plotly)
crime_state <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv")

# 2) Sort and classify the data into before, during, and after the Recession
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
View(sorted_data)

crime_plot <- ggplot(sorted_data) + 
  geom_point(
    mapping = aes(x = State, y = property_crimes, fill = Year),
  )

scatter_plot <- ggplotly(crime_plot)

crime_plot <- scatter_plot %>% layout(
  title = "Scatter Plot of Total Number of Property Crime in Each State (2005-2011)",
  xaxis = list(title = "State"),
  yaxis = list(title = "Total Number of Property Crime")
)

crime_plot