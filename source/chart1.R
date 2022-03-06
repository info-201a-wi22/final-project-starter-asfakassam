library(ggplot2)
library(dplyr)
library(plotly)

crime_state <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv")

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
View(plot_data)

crime_plot <- ggplot(plot_data) + 
  geom_col(
    mapping = aes(x = State, y = violent_crimes, fill = Year),
  )+
  ggtitle ("Bar Chart of Total Number of Violence Crime in Each State (2005-2011)")+
  labs(x = "State", y="Total Number of Violence Crime" )
 
bar_chart <- ggplotly(crime_plot)
bar_chart



