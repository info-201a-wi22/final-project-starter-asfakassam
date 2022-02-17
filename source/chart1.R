data <- read.csv("Documents/state_crime.csv")
library("dplyr")
data <- filter(data, Year >= 2005 & Year <= 2011)
