#load packages
library("dplyr")
install.packages("knitr")
library("knitr")

#1)import dataset
data <-read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-asfakassam/main/data/state_crime.csv",stringsAsFactors = FALSE)

#2)select dataset range we want to focus-year 2005 to year 2011

crime_data <-data %>%
  filter(Year=="2005"|Year=="2006"|Year=="2007"|Year=="2008"|Year=="2009"|Year=="2010"|Year=="2011")

#3)summarize information into a list
summary <-list()

#4)summarize the total number of rows we focus in the crime_data data frame.
summary$total_num_rows <-nrow(crime_data)

#5)summarize the number of differnt states in the crime_data data frame.
summary$num_state <-crime_data %>% 
  select(State) %>% 
  unique() %>% 
  nrow()

kable(summary)



#6)summarize the number of years we focus
summary$num_years <-crime_data %>% 
  select(Year) %>% 
  unique() %>% 
  nrow()

#7)summarize the most number of property crime in a state in 7 years
summary$most_property <-crime_data %>% 
  select(Data.Totals.Property.All) %>% 
  max()

#8)summarize the most number of violent crime in a state in 7 years
summary$most_violent <-crime_data %>% 
  select(Data.Totals.Violent.All) %>% 
  max()

#9)find the state with highest number of property crime in each year
summary$highest_prop_state <-crime_data %>% 
  group_by(Year) %>% 
  filter(Data.Totals.Property.All==max(Data.Totals.Property.All)) %>% 
  select(State, Year)

#10)find the state with lowest number of property crime in each year
summary$lowest_prop_state <-crime_data %>% 
  group_by(Year) %>% 
  filter(Data.Totals.Property.All==min(Data.Totals.Property.All)) %>% 
  select(State, Year)

#11)find the state with highest number of violent crime in each year
summary$highest_vio_state <-crime_data %>% 
  group_by(Year) %>% 
  filter(Data.Totals.Violent.All==max(Data.Totals.Violent.All)) %>% 
  select(State, Year)

#12)find the state with lowest number of violent crime in each year
summary$lowest_vio_state <-crime_data %>% 
  group_by(Year) %>% 
  filter(Data.Totals.Violent.All==min(Data.Totals.Violent.All)) %>% 
  select(State, Year)
  

#13)find the total number of property crime for all states in each year
summary$total_prop <-crime_data %>% 
  group_by(Year) %>%
  summarise(total_property_crime=sum(Data.Totals.Property.All))

#14)find the total number of violent crime for all states in each year
summary$total_vio <-crime_data %>% 
  group_by(Year) %>%
  summarise(total_violent_crime=sum(Data.Totals.Violent.All))

kable(summary)



