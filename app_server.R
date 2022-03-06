library(dplyr)
library(plotly)
library(ggplot2)
library(maps)
library(usdata)
library(stringr) 

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
  
  crime_data_2008 <-crime_state %>% 
    filter(Year=="2008") %>% 
    select(State,Data.Totals.Property.All,Data.Totals.Violent.All) %>% 
    rename(state=State) %>% 
    mutate(total_crime=Data.Totals.Property.All+Data.Totals.Violent.All)
  
  state_shape <- map_data("state") %>%
    rename(state = region)%>%
    mutate(state = state2abbr(state)) %>%
    left_join(crime_data_2008, by = "state")
  
  output$scatter <- renderPlotly({
    p <- ggplot(
      data = sorted_data, 
      mapping = aes (x = State, y = property_crimes, fill = Year)
    ) + 
      geom_point(size = input$size)+
      ggtitle("Scatter Plot of Total Number of Property Crime") +
      labs(x = "state", y = "number of property crimes", colour ="year")
    p
  })
  
  output$bar <- renderPlotly({
    crime_plot <- ggplot(
      data = plot_data,  
      mapping = aes(x = input$state, y = violent_crimes, fill = Year),
      )+
      geom_col()+
      ggtitle ("Bar Chart of Total Number of Violence Crime")+ 
      labs(x = "State", y="Total Number of Violence Crime", colour = "year")  
      crime_plot
  
  })
  
  output$map <- renderPlotly({
    crime_map <- ggplot(
      data = state_shape,  
      mapping = aes(x = long, y = lat, group = group, fill = total_crime), color = "darkred", size = 0.2
    )+
      geom_polygon()+
      ggtitle ("Crime map in 2008 USA for both property and violent crime")
    crime_map
    
  })
  
  filtered <- function(states){
      state_shape%>%
      filter(str_detect(states, state))%>% 
      pull(total_crime)%>%
      unique()
  }
  
  filtered1 <- function(states){
    state_shape%>%
      filter(str_detect(states, state))%>% 
      pull(Data.Totals.Property.All)%>%
      unique()
  }
  
  filtered2 <- function(states){
    state_shape%>%
      filter(str_detect(states, state))%>% 
      pull(Data.Totals.Violent.All)%>%
      unique()
  }

  output$text_choice <- renderPrint({
    return(paste("You have chosen the state ", abbr2state(input$checkGroup1), " and there are", filtered(input$checkGroup1), " crimes committed in this state in 2008 in total.",
                 filtered1(input$checkGroup1), "of which are violence crime, and ", filtered2(input$checkGroup1), "of which are property crime."))
                 })

}
