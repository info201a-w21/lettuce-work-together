# GABRIELLA ALONSO
# Summary Information

# Install and load packages
install.packages("readxl")
install.packages("plyr")
install.packages("lintr")
library(tidyverse)
library(dplyr)
library(readxl)
library(plyr)
library(styler)
library(lintr)

# Load data

fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx",
  skip = 1, sheet = "2018 State"
)

# Function that lists 2018 summary information about Food insecurity
summary__fd_insecurity_2018 <- list(
  most_food_insecure, least_food_insecure,
  avg_people_insecure, summary_prop_food_insecure
)


# Pull the state with the highest food insecurity rate in 2018
state_max_insecurity <- fa_2018 %>%
  select(`State Name`, `2018 Food Insecurity Rate`) %>%
  filter(`2018 Food Insecurity Rate` == max(`2018 Food Insecurity Rate`, 
                                            na.rm = T)) %>%
  pull(`State Name`)
# Mississippi

# Function that explains state max insecurity information for summary
most_food_insecure <- paste(state_max_insecurity, 
                            "was the most food insecure state of 2018")

# Pull the state with the lowest food insecurity rate in 2018
state_min_insecurity <- fa_2018 %>%
  select(`State Name`, `2018 Food Insecurity Rate`) %>%
  filter(`2018 Food Insecurity Rate` == min(`2018 Food Insecurity Rate`, 
                                            na.rm = T)) %>%
  pull(`State Name`)
# North Dakota

# Function that explains state min insecurity information for summary
least_food_insecure <- paste(state_min_insecurity, 
                             "was the least food insecure state of 2018")

# Pull average number of people who are food insecure in the US in 2018
# The data included WA DC as a state, which is why I divided by 51
Avg_num_food_insecure <- (sum(fa_2018$`# of Food Insecure Persons in 2018`)) / 51
# about 782,796 food insecure people per state

# Function that explains the average number of food insecure people in 2018
avg_people_insecure <- paste(
  "In 2018, there was an average of", round(Avg_num_food_insecure),
  "people per state who were food insecure in the United States"
)

# Function that compares the national number of children who are food insecure to
# the national number of adults who are food insecure

prop_food_insecure <- (sum(fa_2018$`# of Food Insecure Children in 2018`)) /
  (sum(fa_2018$`# of Food Insecure Persons in 2018`)) %>%
    round(digits = 2)
# 0.31003 or about 30%
# In 2018, for every 10 adults 3 children were food insecure

# Function that summarizes the ratio of adult to child food insecurity

summary_prop_food_insecure <- paste(
  "The proportion of food insecure children to adults is", prop_food_insecure,
  ". In other words, for every 10 adults there were about 3 children who were food insecure in the US in 2018"
)



# Function that lists 2018 summary information about Meal Costs
summary_meal_costs_2018 <- list(
  summary_expensive_meal_2018, summary_cheapest_meal_2018, summary_avg_cost,
  summary_meal_loss
)

# Pull the state with the highest meal cost
most_expensive_meal <- fa_2018 %>%
  select(`State Name`, `2018 Cost Per Meal`) %>%
  filter(`2018 Cost Per Meal` == max(`2018 Cost Per Meal`)) %>%
  pull(`State Name`)
# Washington, D.C.

# Pull price of the highest meal
price_most_expensive_meal <- fa_2018 %>%
  select(`State Name`, `2018 Cost Per Meal`) %>%
  filter(`2018 Cost Per Meal` == max(`2018 Cost Per Meal`)) %>%
  pull(`2018 Cost Per Meal`)
# $4.08

# Function that informs about the most expensive meal
summary_expensive_meal_2018 <- paste(
  most_expensive_meal,
  "had the most expensive average meal cost of 2018:$", price_most_expensive_meal
)

# Pull the state with the lowest meal cost
cheapest_meal_2018 <- fa_2018 %>%
  select(`State Name`, `2018 Cost Per Meal`) %>%
  filter(`2018 Cost Per Meal` == min(`2018 Cost Per Meal`)) %>%
  pull(`State Name`)
# Texas

# Pull price of the lowest meal
price_cheapest_meal <- fa_2018 %>%
  select(`State Name`, `2018 Cost Per Meal`) %>%
  filter(`2018 Cost Per Meal` == min(`2018 Cost Per Meal`)) %>%
  pull(`2018 Cost Per Meal`)
# $2.64

# Function that informs about the cheapest meal
summary_cheapest_meal_2018 <- paste(
  cheapest_meal_2018,
  "had the lowest average meal cost of 2018: $", price_cheapest_meal
)

# Function that calculates average meal cost in US
# T he data included WA DC as a state, which is why I divided by 51
Avg_meal_cost <- (sum(fa_2018$`2018 Cost Per Meal`)) / 51
# 3.089411764

# Function that explains the average meal cost
summary_avg_cost <- paste("In 2018, the average meal cost was $", round(Avg_meal_cost))

# Function based on budget shortfall to calculate how many meals on average
# are not being consumed due to lack of funding
num_meals_not_consumed <- (sum(fa_2018$`2018 Weighted Annual Food Budget Shortfall`)) / (Avg_meal_cost)
# 6,621,359,520 meals
total_food_insecure <- sum(fa_2018$`# of Food Insecure Persons in 2018`)
# 39,922,630

# Divided by 3 to calculate for 3 meals each day
num_of_meals_missed_by_day <- num_meals_not_consumed / 3
# 2,207,119,840 meals per day

# Divide number of meals by people
num_days_lost <- num_of_meals_missed_by_day / total_food_insecure
# 55.28 days of missed meals due to budget falls

# Function that explains how many meals are being lost because of budget shortfalls
summary_meal_loss <- paste(
  "An average of", round(num_meals_not_consumed),
  "meals were not consumed in the U.S. due to 2018 food budget shortfalls. This means each food insecure adult experienced about",
  round(num_days_lost), "days of missed meals"
)

# Style and Lint Code
style_file("Summary Information.R")
lint("Summary Information.R")