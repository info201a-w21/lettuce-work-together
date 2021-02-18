# Import packages
library(tidyverse)
library(readxl)

# Read excel files
fa_2009 <- read_excel("../../DATA/Feeding America Data/MMG2011_2009Data_ToShare.xlsx", sheet = "State", .name_repair = "universal")
fa_2010 <- read_excel("../../DATA/Feeding America Data/MMG2012_2010Data_ToShare.xlsx", sheet = "State", .name_repair = "universal")
fa_2011 <- read_excel("../../DATA/Feeding America Data/MMG2013_2011Data_ToShare.xlsx", sheet = "2011 State ", .name_repair = "universal")
fa_2012 <- read_excel("../../DATA/Feeding America Data/MMG2014_2012Data_ToShare.xlsx", sheet = "2012 State", .name_repair = "universal")
fa_2013 <- read_excel("../../DATA/Feeding America Data/MMG2015_2013Data_ToShare.xlsx", sheet = "2013 State", .name_repair = "universal")
fa_2014 <- read_excel("../../DATA/Feeding America Data/MMG2016_2014Data_ToShare.xlsx", sheet = "2014 State", .name_repair = "universal")
fa_2015 <- read_excel("../../DATA/Feeding America Data/MMG2017_2015Data_ToShare.xlsx", sheet = "2015 State", .name_repair = "universal")
fa_2016 <- read_excel("../../DATA/Feeding America Data/MMG2018_2016Data_ToShare.xlsx", sheet = "2016 State", .name_repair = "universal")
fa_2017 <- read_excel("../../DATA/Feeding America Data/MMG2019_2017Data_ToShare.xlsx", sheet = "2017 State", .name_repair = "universal")
fa_2018 <- read_excel("../../DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", skip =1, sheet = "2018 State", .name_repair = "universal")

# Create dataframes with State.Name and Food.Insecurity.Rate only
foodsec_18 <- fa_2018 %>% summarize(State, ..2018.Food.Insecurity.Rate)
foodsec_17 <- fa_2017 %>% summarize(State, ..2017.Food.Insecurity.Rate)
foodsec_16 <- fa_2016 %>% summarize(State, ..2016.Food.Insecurity.Rate)
foodsec_15 <- fa_2015 %>% summarize(State, ..2015.Food.Insecurity.Rate)
foodsec_14 <- fa_2014 %>% summarize(State, ..2014.Food.Insecurity.Rate)
foodsec_13 <- fa_2013 %>% summarize(State, ..2013.Food.Insecurity.Rate)
foodsec_12 <- fa_2012 %>% summarize(State, ..2012.Food.Insecurity.Rate)
foodsec_11 <- fa_2011 %>% summarize(County..State, ..2011.Food.Insecurity.Rate)
foodsec_10 <- fa_2010 %>% summarize(State, ..2010.Food.Insecurity.Rate)
foodsec_09 <- fa_2009 %>% summarize(
  State.Name,
  ..2009.Food.Insecurity.Rate = Food.Insecurity.Rate..aggregate.of.counties.)

# Join as multi-year dataframe
decade <- left_join(foodsec_18, foodsec_17, by = "State") %>% 
  left_join(foodsec_16, by = "State") %>%
  left_join(foodsec_15, by = "State") %>%
  left_join(foodsec_14, by = "State") %>%
  left_join(foodsec_13, by = "State") %>%
  left_join(foodsec_12, by = "State") %>%
  left_join(foodsec_11, by = c("State" = "County..State")) %>%
  left_join(foodsec_10, by = "State") %>%
  left_join(foodsec_09, by = c("State" = "State.Name"))

# Transpose the dataframe with tidyr
decade <- gather(
  decade,
  key = year,
  value = food_insec,
  -State
)

# Get the average of food insecurity nationwide each year
us_avg_insec <- decade %>%
  group_by(year) %>%
  summarize(mean_food_insec = mean(food_insec))

# Plot the line graph
g <- ggplot(data = us_avg_insec) +
  geom_line(
    mapping = aes(x = year, y = mean_food_insec, group = 1)
  )
