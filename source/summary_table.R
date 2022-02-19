library(dplyr)

crime_state <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv")

table_data <- crime_state %>%
  filter(Year >= 2005 & Year <= 2011)%>%
  select(State, Year, Data.Totals.Violent.All, Data.Totals.Property.All)

before_rec <- c(2005:2006)
during_rec <- c(2007:2009)
after_rec <- c(2010:2011)

table_data$Year[table_data$Year %in% before_rec] <- "Before Recession"
table_data$Year[table_data$Year %in% during_rec] <- "During Recession"
table_data$Year[table_data$Year %in% after_rec] <- "After Recession"

table_data <- table_data %>%
  group_by(State, Year) %>%
  summarise(violent_crimes = sum(Data.Totals.Violent.All), property_crimes = sum(Data.Totals.Property.All))
View(table_data)