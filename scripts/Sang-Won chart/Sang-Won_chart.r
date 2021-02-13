# Import packages
library(tidyverse)

# Read excel files
fa_2009 <- read_excel("DATA/Feeding America Data/MMG2011_2009Data_ToShare.xlsx", sheet = "State", .name_repair = "universal")
fa_2010 <- read_excel("DATA/Feeding America Data/MMG2012_2010Data_ToShare.xlsx", sheet = "State", .name_repair = "universal")
fa_2011 <- read_excel("DATA/Feeding America Data/MMG2013_2011Data_ToShare.xlsx", sheet = "2011 State ", .name_repair = "universal")
fa_2012 <- read_excel("DATA/Feeding America Data/MMG2014_2012Data_ToShare.xlsx", sheet = "2012 State")
fa_2013 <- read_excel("DATA/Feeding America Data/MMG2015_2013Data_ToShare.xlsx", sheet = "2013 State")
fa_2014 <- read_excel("DATA/Feeding America Data/MMG2016_2014Data_ToShare.xlsx", sheet = "2014 State")
fa_2015 <- read_excel("DATA/Feeding America Data/MMG2017_2015Data_ToShare.xlsx", sheet = "2015 State")
fa_2016 <- read_excel("DATA/Feeding America Data/MMG2018_2016Data_ToShare.xlsx", sheet = "2016 State", .name_repair = "universal")
fa_2017 <- read_excel("DATA/Feeding America Data/MMG2019_2017Data_ToShare.xlsx", sheet = "2017 State", .name_repair = "universal")
fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", skip =1, sheet = "2018 State", .name_repair = "universal")

# Create dataframes with State.Name and Food.Insecurity.Rate only
foodsec_18 <- fa_2018 %>% summarize(State.Name, ..2018.Food.Insecurity.Rate)
foodsec_17 <- fa_2017 %>% summarize(State.Name, ..2017.Food.Insecurity.Rate)
foodsec_16 <- fa_2016 %>% summarize(State.Name, ..2016.Food.Insecurity.Rate)

decade <- left_join(foodsec_18, foodsec_17, by = "State.Name") %>% 
  left_join(foodsec_16, by = "State.Name")

# How do I plot a line graph with a dataframe like `decade`?
ggplot(data = decade) +
  geom_line(
    mapping = aes(x = )
  )