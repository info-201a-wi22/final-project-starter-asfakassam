library(ggplot2)
library(dplyr)
library(plotly)

crime_state <- read.csv(
  file = "data/state_crime.csv",
)

plot_data <- crime_state %>%
  filter(
    (Year >= 2005 & Year <= 2011)
  ) %>%
  select(State, Year, Data.Totals.Violent.All)%>%

crime_plot <- ggplot(plot_data) + 
  geom_col(
    mapping = aes(x = State, y = Data.Totals.Violent.All, fill = Year),
  )
  
bar_chart <- ggplotly(crime_plot)

crime_plot <- bar_chart %>% layout(
  title = "Bar Chart of Total Number of Violence Crime in Each State (2005-2011)",
  xaxis = list(title = "State"),
  yaxis = list(title = "Total Number of Violence Crime")
)

crime_plot

