# GABRIELLA ALONSO
# Table of Summary Information


# Install and load packages 
install.packages("readxl")
install.packages("plyr")
install.packages("scales")
library(tidyverse)
library(dplyr)
library(readxl)
library(plyr)
library(scales)
# Load data 
fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", 
                      skip =1, sheet = "2018 State"
)


# Aggregate table focused on the financial aspects of food insecurity
financial_df <- fa_2018 %>% 
select(`State Name`,`2018 Cost Per Meal`, `2018 Weighted Annual Food Budget Shortfall`)  %>% 
 group_by(`State Name`) %>% 
  mutate(`Meals Not Consumed due to Budget Shortfall` =`2018 Weighted Annual Food Budget Shortfall`/ `2018 Cost Per Meal`) %>% 
mutate(`Meals Not Consumed due to Budget Shortfall`= number(`Meals Not Consumed due to Budget Shortfall`, big.mark= ",")) %>% 
mutate(`2018 Weighted Annual Food Budget Shortfall` = number(`2018 Weighted Annual Food Budget Shortfall`, big.mark = ","))


# Pertient Observations
max_meals_lost <-financial_df %>% 
  select(`State Name`, `Meals Not Consumed due to Budget Shortfall`)%>% 
  filter(`Meals Not Consumed due to Budget Shortfall`==max(`Meals Not Consumed due to Budget Shortfall`, na.rm =T))%>% 
  pull(`State Name`) 
