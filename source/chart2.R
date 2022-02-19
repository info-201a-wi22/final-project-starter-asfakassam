library(ggplot2)
library(dplyr)
library(plotly)

crime_state <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv")

plot_data <- crime_state %>%
  filter(Year >= 2005 & Year <= 2011)%>%
  select(State, Year, Data.Totals.Property.All)

before_rec <- c(2005:2006)
during_rec <- c(2007:2009)
after_rec <- c(2010:2011)

plot_data$Year[plot_data$Year %in% before_rec] <- "Before Recession"
plot_data$Year[plot_data$Year %in% during_rec] <- "During Recession"
plot_data$Year[plot_data$Year %in% after_rec] <- "After Recession"

plot_data <- plot_data %>%
  group_by(State, Year) %>%
  summarise(property_crimes = sum(Data.Totals.Property.All))
View(plot_data)

crime_plot <- ggplot(plot_data) + 
  geom_point(
    mapping = aes(x = State, y = property_crimes, fill = Year),
  )

bar_chart <- ggplotly(crime_plot)

crime_plot <- bar_chart %>% layout(
  title = "Scatter Plot of Total Number of Property Crime in Each State (2005-2011)",
  xaxis = list(title = "State"),
  yaxis = list(title = "Total Number of Property Crime")
)

crime_plot