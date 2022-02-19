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
  rename(state=State) %>% 
  mutate(total_crime=Data.Totals.Property.All+Data.Totals.Violent.All)
  

#3) Create US shapefile and rename region column to state

state_shape <- map_data("state") %>%
  rename(state = region)

#4) Prepare state_shape for joining by modifying state to be abbreviations.
state_shape <- state_shape %>%
  mutate(state = state2abbr(state))

#4): Join state_shape to crime_data_2008 dataframe
state_shape <- state_shape %>%
  left_join(crime_data_2008, by = "state")

#5): Create a map
crime_map <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = total_crime), color="darkred", size=0.2
  )

#add a title to the map
crime_map <-crime_map + ggtitle("Crime map in 2008 USA for both property and violent crime")

#plot out the map
crime_map

#Make the map interactive 
ggplotly(crime_map)





 

 
  
