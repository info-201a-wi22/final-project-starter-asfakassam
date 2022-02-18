# **Impact of The Great Recession on Criminal Activities**: Project Proposal

## _**Developers' Notes**_



#### Code name
 _ASKS_

 ### Project title
 Impact of The Great Recession on Criminal Activities

#### Authors
Asfa Kassam - _asfak@uw.edu_ <br/>
Shey Gao - _shengg6@uw.edu_ <br/>                                                            Keyan Ying - _kying2@uw.edu_ <br/>                                                           Stark - _jyin2@uw.edu_

#### Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

#### Date
February 1, 2022

#### Abstract
We are concerned with the impact of major events on crime rates because we are currently in a pandemic. To address this concern we intend to take a lesson from history by analyzing the impact that the Great Recession of 2008 had on criminal activity. Through this analysis we hope to learn more about the trends of criminal activities during such events and what to expect in the future.|

#### Keywords
Crime Rates, Economic Recession, Social Impact, Property Crimes, Violent Crimes

#### Introduction
Our team's goal for this project is to determine the impact of the Great Recession on property and violent crime and help the general public and each state's safety department in determining which aspects should be closely focused during an economic downturn, thereby improving people's safety throughout the next potential recession. As students in a data science course, our objective is to gather and analyze data before, during, and after the Great Recession to see how the number of each sort of crime (robbery, murder, burglary, etc.) changed, which demonstrates the impact of worse economic quality.

Our team begins by locating a dataset detailing the types and amounts of crimes that have occurred in each state in the United States. After that, we extract data from 2005 to 2011, which includes two years prior to, two years during, and two years following the Great Recession. Then we'll utilize the data to answer some research questions.

#### Design Situation
Our group is trying to investigate the trends of criminal activity under impacts of economic recessions. We decided to primarily focus on the great recession that happened from _December 2007_ to _June 2009_. The Great Recession was the most severe economic recession in the United States since the Great Depression of the 1930s and we want to see how the crime rate is affected by this major economic change. During this time, millions of people lost their jobs, banks went broke and investment shrank significantly.

We want to see how the economy can influence safety which can be reflected through fluctuations of crime rate. In this way, we will be able to make predictions for future economic declines and take necessary measurements accordingly. Also, we want to present how much society can be impacted by those major economic events so that investors, bankers and governments can make more measured decisions in the future. By investigating crime rates before and after the recession we hope that people can have a view of recession impacts and be prepared for any future decline of the economy.

Direct stakeholders of our project can be politicians who are trying to convey their political goals for the future with recession data. They can use these data to urge government and financial facilities to make better policies regarding financial decisions that have potential impacts on the whole economy. Moreover, the media may use data to help people to know what to expect when an economic recession happens. Indirect stakeholders can be the general public who are concerned about the economic situation as these economic changes can almost impact everyone. People with information about crime rates and economic recession may take measures ahead when they predict a recession might happen.

Although according to the study conducted by other researchers, crime rate did not increase during recession, there are still many aspects and work done to keep crime rate stable (James Q. Wilson, 2019). There may be increased police forces to settle criminal activities thus people may feel safer during an economic decline. Governments may develop financial policies and preventions to improve economic stability in the future.

However, the cost of increasing law enforcement regulations can be high and the government may want to decrease budgets in a recession. There are concerns that cutting budgets of police departments can result in an increasing crime rate (Colvin, 2009). It is also uncertain if these interventions will affect crime rate positively as there are so many other factors that can cause increase or decrease of crime activities (Uggen, 2012).

#### Research questions
The main questions that our team will address:

1)In each state, which crime has experienced the greatest change in number and which crime has experienced the least change in number over the six years?

2) Which state has seen the greatest increase in the number of crimes over the six years?

3) Which year had the most and least increase in crime?.

User research has prompted these inquiries. According to students from different states, 78% of them do not know how heavily their state was impacted and what type of crime they should be most concerned about during an economic downturn. These questions are critical because they provide individuals and policy makers with knowledge about the situation during a downturn and enable them to better prepare for self-defense. In general, our team will respond to the questions by using R to compute the mean, median, maximum, minimum, skewness, and change of number of crimes, then making comparisons in each state (or one country as a whole) over time.


#### The Dataset
This project uses the version 3.0.0 of the _State Crime CSV file_ as the primary source for information which was found on the official website of _CORGIS CSV Datasets_. This dataset was created by _Ryan Whitcomb, Joung Min Choi_ and _Bo Guan_ on _October 19, 2021_ (Whitcomb et al.). According to the CORGIS website, these information crime statistics are made available for the public review from the _Unified Crime Reporting Statistics_ with collaboration of the _United States Department of Justice_ and the _Federal Bureau of Investigation_.

The original dataset contains three thousand one hundred and sixteen observations (rows) and twenty one variables (columns). The variables include the names of the states, the year, population of the states in the corresponding year, and the rates and total number of two types of crimes- property crimes and violent crimes- committed in those states during that year. Types of property crimes included are property burglary, property larceny and property motor crimes, and types of violent crimes include violent assaults, violent murders, violent rape and violent robbery. These records are based on data collected from 1960 to 2019. While these statistics provide a focused view of the crime rates and totals of property related and violent crimes, it excludes a wide variety of other criminal activities. (Whitcomb et al.)

The exact source of funding for this database has not been mentioned. However, it is validated on the basis of its source. This data was created by using the reports of [_Crimes in the United States_](https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/cius-summary) which was released by the Federal Bureau of Investigation, a credible government agency, and created in collaboration with the FBI and the U.S. Department of Justice. Evidently, this dataset is highly influenced by government agencies and could potentially include biases of the “law makers”. Moreover the data also does not include the motivation of the crimes, which limits the scope of analysis and interpretations that can be made from it (FBI , 2018).

That being said, the lack of the aforementioned information could easily be used by corporations who deal with security, safety and well-being related products for increasing their sales, and hence their profit. For example, when there is an increase in the crime rate, companies who provide home security can use these statistics to create fear amongst people, and promote their products. Likewise, when there is a decrease in the crime rate in a particular area, a popular home security system may link the usage of their product to the decrease, and hence increase their network. |

#### Expected Implications
With the help of our visualization tool, technologists can easily compare crimes’ increasing or decreasing trend within or across states during The Great Recession. If combined with important events that happened during and after this period, our tool provides convenience for technologists to find out the relationship between the change of crime rates and the happened events, which gives deeper future analysis an easy start.

Designers who seek to make programs to relate crimes happening with other impacts at that time can use our project as one resource. They can simply add something they want to analyze into our tool to compare crimes’ trending with the events without much effort.

For policy makers, our project serves as a great reference that provides visualized data of the crime rates’ trend. They can compare certain crimes’ rates across states, and find out what should they change or improve in the policy across the country or within states in order to avoid the crimes related to economic recession from happening in the future. And at last, make a policy to guarantee safety to the public.

#### Limitations
Although our project can analyze crimes’ data classified by states and crime types, the dataset does not show detailed information about the crimes in certain months. That means our project only focuses on analyzing crimes’ trend over the Great Recession years. As a result, it will be less effective in analyzing the effect of other minor events, which might just last for several months, on crime rates’ alterations.

In addition, our project assumes that the Great Recession is the main factor that affects the crime numbers, and we do not take other possible variables that could also increase the crime numbers into account. Thus, the analyses may not be accurate enough.

#### Acknowledgements

Our team would like to sincerely thank Samuel Gregory McCullough, our teaching assistant, for his suggestions and assistance with this project.

#### References

1.Colvin, R. (2009, January 27). U.S. recession fuels crime rise, police chiefs say. Reuters. Retrieved February 5, 2022, from https://www.reuters.com/article/us-usa-economy-crime-idUSTRE50Q6FR20090127

2.FBI. (2018, September 24). Download printable files. FBI. Retrieved February 5, 2022, from https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/downloads/download-printable-files

3.James Q. Wilson, formerly a professor at H. and at U. C. L. A. (2019, June 16). Crime and the great recession. City Journal. Retrieved February 5, 2022, from https://www.city-journal.org/html/crime-and-great-recession-13399.html

4.Uggen, C. (2012, October). Crime and the Great Recession.  <br/><br/>5. Whitcomb, R., Choy, J. M., &amp; Guan, B. (n.d.). State crime CSV file. CORGIS Datasets Project. Retrieved February 5, 2022, from https://corgis-edu.github.io/corgis/csv/state_crime/|
