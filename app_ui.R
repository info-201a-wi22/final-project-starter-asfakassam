library(shiny)
library(plotly)
library(ggplot2)

intro_panel <- tabPanel(
  "Introductory Page",
  h1("Introduction"),
  p(""),
  img("", src = "")
)

selected_values <-plot_data$State%>%
  unique()
sidebar_content1 <- sidebarPanel(
  selectInput(
    "state",
    label = "State of Interest",
    choices = selected_values,
    selected = "WA"
  )
)
main_content1 <- mainPanel(
  plotlyOutput("bar")
)

interactive_panel1 <- tabPanel(
  "Violence Crime",
  titlePanel("Change in Violence Crime"),
  p(strong("1) The change in trends of violent crimes in each states before, during and after the Great Recession.")),
  sidebarLayout(
    sidebar_content1,
    main_content1
),
   p(""),
   p("This bar chart is included to demonstrate the impact of the Great Recession on violence crime numbers.
      The bar chart is an efficient approach for comparing the number of violence crimes before (2005-2006), during (2007-2009),
      and after (2010-2011) the Great Recession in each state. The audience can directly see the impact of the Great Recession on violence crime by
      comparing the area for each period in a single bar. Specifically, it’s straightforward to see the difference between the area representing the period during the Great Recession
      and the area representing the period before or after the Great Recession."),
   p("From this bar chart, it shows that, for each state, the violence crime committed during the Great Recession is more than the violence crime
      committed before or after the Great Recession (The area representing the period during the Great Recession is especially larger than the other two periods). This suggests that
      the Great Recession had a detrimental impact on society, resulting in an increase in violence crime numbers. Additionally, the chart reveals that California has the largest number of
      violence crimes in total, which means that  it has always had a larger number of violence crimes (worse security conditions) than other states from 2005 to 2011.")
)

sidebar_content2 <- sidebarPanel(
  sliderInput(
    "size",
    label = "Size of point", min = 1, max = 5, value = 2
  )
)
main_content2 <- mainPanel(
  plotlyOutput("scatter")
)

interactive_panel2 <- tabPanel(
  "Property Crime",
  titlePanel("Change in Property Crime"),
  p(strong("2) The change in trends of property crimes in each states before, during and after the Great Recession.")),
  sidebarLayout(
    sidebar_content2,
    main_content2
  ),
  p(""),
  p("The scatter plot chart is included to show the impact of the Great Recession on property crime numbers by comparing the position 
     of dots representing different time periods in each state. It provides a way to see which period has the most property crime numbers. 
     If the numbers during recession happen to be the largest, then it proves the assumption that the Great Recession had a negative impact 
     on the society, which increases the property crime rate."),
  p("As viewed in this chart, the position of almost all the blue points (which represents the number of property crimes during the Recession) 
    is higher than the red (After the Recession) and the green(Before the Recession) ones. This shows that the total property crimes number during 
    the Recession are the highest within the time from 2005 to 2011.")
)

sidebar_content3 <- sidebarPanel(
  checkboxGroupInput("checkGroup1", label = "Please select state of interest and scroll down to see summary.", 
                     
                     choices = selected_values,
                     selected = "AL"
                     ),
  textOutput("text_choice"),
)
main_content3 <- mainPanel(
  plotlyOutput("map")
)

interactive_panel3 <- tabPanel(
  "Total Crime",
  titlePanel("Map of Total Number of Crime"),
  p(strong("3) Criminal activity during 2008 in the United States")),
  sidebarLayout(
    sidebar_content3,
    main_content3
  ),
  p("This is a map that includes information about the sum of both property and violent crime in the year 2008, which is in the middle of the Great Recession.
     We plot this information on a U.S. map because it allows us to visually present the distribution of crime occurrences across the country.
    It can facilitate audiences to understand and compare crime numbers in different areas in the US."),
  p("On this map different shades of blue represent different numbers of crimes. The lighter the blue the less crime happened in that state.
     From the map we can see that California and Texas stand out as very light blue, which means that these two states have relatively higher crime numbers.
     Montana, North Dakota and South Dakota have relatively lower crime occurrences.")
)

summary <- tabPanel(
  "Summary",
  h1("Summary"),
  p(""),
  tableOutput("table")
)

report <- tabPanel(
  "Report",
  h1("Project Title"),
  p("Impact of The Great Recession on Criminal Activities"),
  h1("Authors"),
  p("Asfa Kassam", em("asfak@uw.edu"),
  p("Shey Gao", em("shengg6@uw.edu")),  
  p("Keyan Ying", em("kying2@uw.edu")),  
  p("Stark", em("jyin2@uw.edu")),
  h1("Affiliation"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h1("Date"),
  p("March 6, 2022"),
  h1("Abstract"),
  p("We are concerned with the impact of major events on crime rates because we are currently in a global pandemic, 
     and an economic recession is looming over us. During such times, safety and security become a major concern among other things. 
     To address this concern, we intend to take a lesson from history by analyzing the impact that the Great Recession of 2008 had on criminal activity. 
     Through this analysis we hope to learn more about the trends of criminal activities during such events and prepare for what to expect in the future."),
  h1("Keywords"),
  p("Crime Rates, Economic Recession, Social Impact, Property Crimes, Violent Crimes"),
  h1("1.0 Introduction"),
  p("Our team's goal for this project is to determine the impact of the Great Recession on property and violent crime. In this project, 
  we gather and analyze data before, during, and after the Great Recession to examine the change in the trends of criminal activity during an economic crisis. 
  This information will help the general public and each state's safety department determine which aspects to focus on during an economic downturn, 
  thereby improving people's safety during the next potential economic crisis."),
  h1("2.0 Design Situation"),
  p("Our group is trying to investigate the trends of criminal activity under impacts of economic recessions. 
  We decided to primarily focus on the great recession that happened from", em("December 2007 to June 2009"),". 
  The Great Recession was the most severe economic recession in the United States since the Great Depression of the 1930s. 
  During this time, millions of people lost their jobs, banks went broke and investments shrank significantly."),
  p("We want to see how the economy can influence safety, which can be reflected through fluctuations of crime rate. 
  In this way, we will be able to make predictions of events during future economic crises, and take necessary measures accordingly. 
  We also aim to present how the morality and integrity of the members of a society can be impacted by major economic events, 
  so that investors, bankers and governments can make more calculated decisions in the future.In addition to these professionals, 
  some of our indirect stakeholders also include politicians who are trying to convey their political goals for the future with recession data. 
  The media may also use this data to spread awareness of what to expect during an economic recession."),
  p("While such professionals may use this report to further their profit and agenda, 
  our direct stakeholders- the general public, who could be potential victims can use this information to take necessary precautionary measures in cases of such events."),
  h1("3.0 Research Questions"),
  p("The main questions that our team will address:"),
  p(strong("1) The change in trends of violent crimes in each states before, during and after the Great Recession.")),
  p(strong("2) The change in trends of property crimes in each states before, during and after the Great Recession.")),
  p(strong("3) Which State had maximum criminal activity during 2008?")),
  h1("4.0 The Dataset"),
  p("This project uses the version 3.0.0 of the", em("State Crime CSV file"),"as the primary source for information which was found on the official website 
     of", em("CORGIS CSV Datasets"),"This dataset was created by",em("Ryan Whitcomb, Joung Min Choi and Bo Guan on October 19, 2021"),"(Whitcomb et al.). 
     According to the CORGIS website, these information crime statistics are made available for the public review from the", em("Unified Crime Reporting Statistics"), 
    "with collaboration of the",em("United States Department of Justice"),"and the",em("Federal Bureau of Investigation.")),
  p("The original dataset contains three thousand one hundred and sixteen observations (rows) and twenty one variables (columns). The variables include the names of the states, 
     the year, population of the states in the corresponding year, and the rates and total number of two types of crimes- property crimes and violent crimes- committed in those states during that year. 
     Types of property crimes included are property burglary, property larceny and property motor crimes, and types of violent crimes include violent assaults, violent murders, violent rape and violent robbery. 
     These records are based on data collected from 1960 to 2019. While these statistics provide a focused view of the crime rates and totals of property related and violent crimes, it excludes a wide variety of other 
     criminal activities. (Whitcomb et al.)"),
  p("The exact source of funding for this database has not been mentioned. However, it is validated on the basis of its source. This data was created by using the reports of 
     [Crimes in the United States] which was released by the Federal Bureau of Investigation. 
     Moreover, it was created in collaboration with the FBI and the U.S. Department of Justice. Evidently, this dataset is highly influenced by government agencies, and could potentially include biases of the “law makers”. 
     Moreover the data also does not include the motivation of the crimes, which limits the scope of analysis and interpretations that can be made from it (FBI , 2018)."),
  p("That being said, the lack of the aforementioned information could easily be used by corporations who deal with security, safety and well-being related products for increasing their sales, and hence their profit. 
     For example, when there is an increase in the crime rate, companies who provide home security can use these statistics to create fear amongst people, and promote their products. Likewise, when there is a decrease in the 
     crime rate in a particular area, a popular home security system may link the usage of their product to the decline to promote their company."),
  h1("5.0 Findings"),
  p(""),
  h1("6.0 Discussion"),
  p(""),
  h1("7.0 Conclusion"),
  p(""),
  h1("Limitations"),
  p("Although our project can analyze crimes’ data classified by states and crime types, the dataset does not show detailed information about the crimes in certain months. 
    That means our project only focuses on analyzing crimes’ trend over the Great Recession years. As a result, it will be less effective in analyzing the effect of other minor events, 
    which might just last for several months, on crime rates’ alterations."),
  p("In addition, our project assumes that the Great Recession is the main factor that affects the crime rates. 
    We do have not considered other possible variables that could potentially affect these crime rates."),
  h1("Expected Implications"),
  p("With the help of our visualization tool, technologists can easily compare increase or decrease in crime rates across states during the Great Recession. 
     Our tool provides a convenient method for analysts to study the relationship between the change of crime rates and major economic events. 
     Data analysts could also use this report to study the relationship between property and violent crime rates and other variables during an economic crisis."),
  p("For policy makers, our project serves as a great reference that provides a visual representation to monitor the changes in crime rates. 
     They can compare certain trends in criminal activity across states, 
      which can help them determine the necessary changes in national or state policies which can prevent rises in criminal activity and ensure the safety of people."),
  h1("Acknowledgements"),
  p("Our team would like to sincerely thank Samuel Gregory McCullough, our teaching assistant, for his suggestions and assistance throughout the project."),
  h1("References "),
  p("1) Colvin, R. (2009, January 27). U.S. recession fuels crime rise, police chiefs say. Reuters. Retrieved February 5, 2022, from
    https://www.reuters.com/article/us-usa-economy-crime-idUSTRE50Q6FR20090127"),
  p("2) FBI. (2018, September 24). Download printable files. FBI. Retrieved February 5, 2022, from 
    https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/downloads/download-printable-files"),
  p("3) James Q. Wilson, formerly a professor at H. and at U. C. L. A. (2019, June 16). Crime and the great recession. City Journal. Retrieved February 5, 2022,
    from https://www.city-journal.org/html/crime-and-great-recession-13399.html"),
  p("4) Uggen, C. (2012, October). Crime and the Great Recession. Whitcomb, R., Choy, J. M., &amp; Guan, B. (n.d.). State crime CSV file. CORGIS Datasets Project. Retrieved February 5, 2022, from,
    https://corgis-edu.github.io/corgis/csv/state_crime/")
))

ui <- navbarPage(
  "Final Group Project",
  intro_panel,
  interactive_panel1,
  interactive_panel2,
  interactive_panel3,
  summary,
  report
)
