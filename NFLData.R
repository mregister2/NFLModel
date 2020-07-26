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

#Remove neutral site games (London & Mexico City). 40 games. They interfere with travel distance measures
NFLData2 <- filter(NFLData, VH != "LON" & VH != "MEX")
NFLData2$VH <- fct_drop(NFLData2$VH)
levels(NFLData2$VH)

#Remove games that end in a tie. 8 games. Make "Result" a binary categorical variable ("WIN", "LOSS")
NFLData2 <- filter(NFLData2, Result != "TIE")
NFLData2$Result <- fct_drop(NFLData2$Result)
levels(NFLData2$Result)


#Create new variable: TravelDelta = TravelDist-OppTravelDist. This variable can replace both TravelDist and OppTravelDist in model.
NFLData2 <- NFLData2 %>% mutate(TravelDelta = TravelDist - OppTravelDist)

#Create new variable: RestDelta = Rest-OppRest. Can replace both Rest and OppRest in model.
NFLData2 <- NFLData2 %>% mutate(RestDelta = Rest - OppRest)









#Subset useful variables into new tibble ----
#NFLData2 <- select(NFLData, TmGmID, VH, Team, Result:PrevPerfATS)

