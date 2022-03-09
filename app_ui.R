library(shiny)
library(plotly)
library(ggplot2)

intro_panel <- tabPanel(
  "Introductory Page",
  h1("Introduction"),
  p("A great growth in the number of crimes during an economic crisis period has led our attention to the relationships between crimes’ number and the impact of the economy. 
     Our project focuses on discovering the impact of the Great Recession in 2008 on property and violent crime. We want to reveal what should be properly focused on during an economic downturn, 
     and eventually help the general public and states’ safety departments make proper decisions to prevent increasing crimes and guarantee safety of citizens at that period.
"),
  p("Our project uses the version 3.0.0 of the State Crime CSV file as the primary source for information which was found on the official website of CORGIS CSV Datasets. 
     This dataset was created by Ryan Whitcomb, Joung Min Choi and Bo Guan on October 19, 2021 (Whitcomb et al.). According to the CORGIS website, these information crime statistics are made available 
     for the public review from the Unified Crime Reporting Statistics with collaboration of the United States Department of Justice and the Federal Bureau of Investigation.
"),
  p("We extract data during the years 2005 to 2011 from this Dataset, which contains data of crimes before, during, and after the Great Recession. Then, we utilize this data to find out the changed number of 
     property and violent related crimes with that period and make visualizations to show the result. 
"),
  img(src = "https://partners4prosperity.com//wp-content/uploads/2012/01/recession.jpg", height="50%", width="50%", align="right"),
  img(src = "https://www.ipr.northwestern.edu/news/2018/images/stock-crashing.jpg", height="50%", width="50%", align="right")
)


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
  sidebarLayout(
    sidebar_content_x <- sidebarPanel(
  p(strong("1) States with Highest Property Crime in Each Year")),
  tableOutput("table1"),
  p(strong("2) States with Lowest Property Crime in Each Year")),
  tableOutput("table2"),
  p(strong("3) States with Highest Violence Crime in Each Year")),
  tableOutput("table3"),
  p(strong("4) States with Lowest Violence Crime in Each Year")),
  tableOutput("table4"),
  p(strong("5) Total Property Crime in Each Year")),
  tableOutput("table5"),
  p(strong("6) Total Violence Crime in Each Year")),
  tableOutput("table6")
    ),
  main_content <- mainPanel(
    p("The table shows some interesting results calculated based on the dataset from 2005 to 2011. It turned out that California remained the state with 
       the highest number of both property and violent crimes happening during that period. However, until 2011, North Dakota did not consist of the state with the 
       lowest number of property crimes and violent crimes. Especially in 2010, 2 years after the Great Recession, Wyoming replaced its place and became the state with the 
       lowest property crimes. It seemed that the reasons North Dakota did not hold that place were related to the Great Recession in 2008.
"),
    p("The total number of property crimes happening in the US seemed to decline year by year since 2005. The rate of declination had seemingly no correlation with the Great Recession 
       that happened in 2008 as the decline seemed to be stable throughout the year from 2005 to 2011. Thus, we may assume that either the Great Recession did not bring changes to the total 
       number of property crimes, or governments and other organizations had taken action to prevent such changes from happening.
"),
    p("On the other hand, the total number of violent crimes happened in the US took turns during that period. From 2005 to 2006, the total number of violent crimes increased dramatically from 1,390,745 to 1,435,123. 
       Then, during the period of the Great Recession from 2007 to 2009, the number began to drop year by year, and the decreasing trend continued to 2011. The impact of the Great Recession might 
       play a role in decreasing the total number of violent crimes during that period as the number began to drop right before the Recession in 2008. 
")
  )
  )
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
  p("We are concerned with the impact of major events on crime numbers because we are currently in a global pandemic, 
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
  p("The main goal of this report is to examine the change in the trends of criminal activity two years before, during and two years after the Great Recession of 2008. Various graphical methods have been used to help visualize the number of various types of crimes committed in each state. Through analysis of these visual aids, we can compare the changes in the number of crimes committed before, during and after the Great Recession. 
"),
  p("To analyze the change in trends of specifically violent crimes in each state two years before, during and after the Great Recession a bar graph is used as a visual aid. Each bar represents a different state, and the height of each bar represents the number of violent crimes committed. Additionally, each bar is divided into three different sections, each representing a time period of two years before, during and after the Great Recession. From the graph it is evident that violent crimes were more prevalent before and during the Great Recession. After the recession, the crime rate seems to be lower than the other two time periods. The distinction is especially evident in the states of California and Texas.
"),
  p("To analyze the total number of property crimes for every state two years before, during and after the Great Recession, a scatter plot is used. Different colored dots are used to represent different periods for each state. Most of the dots that represent the period before and during the Recession are higher than the dots representing the dots after the Recession. Hence, it can be concluded that more property crimes were committed during the Recession than before or after. 
"),
  p("Combining the statistics for both - violent and property crimes, the third visualization shows the spread of both-violent and property crimes committed across the states. A gradation of color is used to represent the number of crimes committed in each state, with darker shade being the lowest and the lighter shade being the highest number of crimes. It is quite obvious from the color gradation map that California, Texas and Florida have the highest crime rates. 
"),
  p("From the visual representations of the data, it can be concluded that the criminal activity was higher before and during the Recession, and declined after.
"),
  h1("6.0 Discussion"),
  p("The analysis of the data with the help of visual representation reveals that crime rates were higher before and during the Recession than after it. This implies that the circumstances before and during the Recession led to more criminal activity. This adds to the evidence of the theory of  the correlation of crime and economic events. It also aligns with the intuition that crime rates are bound to increase during times of distress. There are of course, many other factors that influence the crime rates, but the correlation of major economic events cannot be ignored, especially since we are currently in the midst of a global pandemic. 
"),
  p("The pandemic shut down quite a large number of businesses and put several people out of their jobs. It comes with no surprise that the pandemic impacted our economy as well. Even though this economic event is definitely not like the Great Recession of 2008, it is on a much broader scale since it is a Global Economic Recession, however we can still take lessons from the past to be more prepared. Since it is evident that crime rates tend to increase during economic recessions, we can take measures to control criminal activities.
"),
  p("This report highlights the need for additional precaution and safety among people as the pandemic and global recession continues. Policy makers can design better policies around increasing the security and how to tackle the situation. It also provides an additional incentive to the government to provide more aid and pay closer attention to those in need so as to prevent the increase in crime rates. The more vulnerable the population, the more likely it is that they would resort to certain measures of survival that would otherwise not even be an option for them.
"),
  p("This data could also be used by several industries to improve their products and services. Additionally, it can be used as a marketing tool for security agencies to sell their products. The increase in crime rates would provide an incentive for people to buy more products that can help them secure their homes and properties as a precautionary measure.
"),
  h1("7.0 Conclusion"),
  p("After  a comprehensive analysis of our data set, it is clear that criminal activity increased in the two years before and during the Great Recession of 2008. However, it declined significantly during the two years following the Great Recession. It was also evident from the graphical visualizations and the map that the more populous states of California, Texas and Florida have the maximum crime rates. This analysis reiterates the direct correlation between an economic recession and criminal activity, which should be used as a learning point for the current and future governments as we deal with a global economic recession.
"),
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
