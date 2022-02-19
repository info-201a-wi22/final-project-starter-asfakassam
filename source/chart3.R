#load packages
library(ggplot2)
library(maps)
library(usdata)
library(dplyr)
library(plotly)
#1)load dataset
data <-read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv",stringsAsFactors = FALSE)

#2)select dataset range we want to focus-year 2008

crime_data_2008 <-data %>% 
  filter(Year=="2008") %>% 
  select(State,Data.Totals.Property.All,Data.Totals.Violent.All) %>% 
  rename(state=State)
  

#3) plot a blank US map

state_shape <- map_data("state") %>%
  rename(state = region)
#Step 3: Prepare state_shape for joining by modifying state to be abbreviations (not full names)
state_shape <- state_shape %>%
  mutate(state = state2abbr(state))

#Step 4: Join your state_shape to your dataframe (replace data with the name of your dataframe)
state_shape <- state_shape %>%
  left_join(crime_data_2008, by = "state")

#Step 5: Create map (replace values with the column name of the values you want to display)
plot <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = Data.Totals.Property.All)
  )

ggplotly(plot)





 

 
  
