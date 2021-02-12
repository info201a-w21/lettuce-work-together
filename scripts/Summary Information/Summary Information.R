# Summary Information Script 

#Install and load packages 
install.packages("readxl")
library(tidyverse)
library(dplyr)
library(readxl)

#Load state data
fa_2009 <- read_excel("DATA/Feeding America Data/MMG2011_2009Data_ToShare.xlsx", sheet = "State")
fa_2010 <- read_excel("DATA/Feeding America Data/MMG2012_2010Data_ToShare.xlsx", sheet = "State")
fa_2011 <- read_excel("DATA/Feeding America Data/MMG2013_2011Data_ToShare.xlsx", sheet = "2011 State ")
fa_2012 <- read_excel("DATA/Feeding America Data/MMG2014_2012Data_ToShare.xlsx", sheet = "2012 State")
fa_2013 <- read_excel("DATA/Feeding America Data/MMG2015_2013Data_ToShare.xlsx", sheet = "2013 State")
fa_2014 <- read_excel("DATA/Feeding America Data/MMG2016_2014Data_ToShare.xlsx", sheet = "2014 State")
fa_2015 <- read_excel("DATA/Feeding America Data/MMG2017_2015Data_ToShare.xlsx", sheet = "2015 State")
fa_2016 <- read_excel("DATA/Feeding America Data/MMG2018_2016Data_ToShare.xlsx", sheet = "2016 State")
fa_2017 <- read_excel("DATA/Feeding America Data/MMG2019_2017Data_ToShare.xlsx", sheet = "2017 State")
fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx", skip =1, sheet = "2018 State")

#add sheet name 