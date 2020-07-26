#Packages to load ----

library(tidyverse)









#Load Data into R ----
NFLData <- read.csv("C:/Users/regis/OneDrive/FB Stats/NFL Data Set Project/NFLModel/NFL15-19DB.CSV")


#Data cleaning & Variable manipulation ----

#Rename first column. It has some weird characters from Excel.
NFLData <- rename(NFLData, TmGmID = ï..TmGmID)

#convert to a tibble for tidyverse
NFLData <- as_tibble(NFLData)

str(NFLData)

#Subset useful variables into new tibble
NFLData2 <- select(NFLData, TmGmID, VH, Team, Result:PrevPerfATS)


ggplot(data = NFLData2) +
  geom_point(mapping = aes(x = TravelDist, y = MARGIN))
