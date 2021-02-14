# GABRIELLA ALONSO
# Summary Information  

# Install and load packages 
install.packages("readxl")
install.packages("plyr")
library(tidyverse)
library(dplyr)
library(readxl)
library(plyr)

# Load data

fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", 
  skip =1, sheet = "2018 State"
  )

#Function that lists summary information about 2018 Food insecurity  

summary__fd_insecurity_2018<- list(most_food_insecure, least_food_insecure, 
                                avg_people_insecure)
  
# Pull the state with the highest food insecurity rate in 2018
  state_max_insecurity <- fa_2018 %>% 
    select(`State Name`, `2018 Food Insecurity Rate`) %>% 
  filter(`2018 Food Insecurity Rate` == max(`2018 Food Insecurity Rate`, na.rm =T)) %>% 
    pull(`State Name`) 
 #Mississippi  
  
# Function that explains state max insecurity information for summary 
  most_food_insecure <- paste(state_max_insecurity, "was the most food insecure state of 2018")
    
#Pull the state with the lowest food insecurity rate in 2018
state_min_insecurity <- fa_2018 %>% 
  select (`State Name`,`2018 Food Insecurity Rate`) %>% 
  filter(`2018 Food Insecurity Rate` == min(`2018 Food Insecurity Rate`, na.rm =T)) %>%
  pull(`State Name`) 
#North Dakota 

#Function that explains state min insecurity information for summary 
least_food_insecure <-paste(state_min_insecurity, "was the least food insecure state of 2018")

#Pull average number of people who are food insecure in the US in 2018 
#The data included WA DC as a state, which is why I divided by 51 
Avg_num_food_insecure <- (sum(fa_2018$`# of Food Insecure Persons in 2018`))/51 %>% 
# about 782,796 food insecure people per state

#Function that explains the average number of food insecure people in 2018 
avg_people_insecure <-paste("In 2018, there was an average of", round(Avg_num_food_insecure), 
                            "people per state who were food insecure in the United States")
