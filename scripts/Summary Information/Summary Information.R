# Summary Information Script 

#Install and load packages 
install.packages("readxl")
library(tidyverse)
library(dplyr)
library(readxl)

#Load data
fa_2009 <- read_excel("DATA/Feeding America Data/MMG2011_2009Data_ToShare.xlsx")
fa_2010 <- read_excel("DATA/Feeding America Data/MMG2012_2010Data_ToShare.xlsx")
fa_2011 <- read_excel("DATA/Feeding America Data/MMG2013_2011Data_ToShare.xlsx")
fa_2012 <- read_excel("DATA/Feeding America Data/MMG2014_2012Data_ToShare.xlsx")
fa_2013 <- read_excel("DATA/Feeding America Data/MMG2015_2013Data_ToShare.xlsx")
fa_2014 <- read_excel("DATA/Feeding America Data/MMG2016_2014Data_ToShare.xlsx")
fa_2015 <- read_excel("DATA/Feeding America Data/MMG2017_2015Data_ToShare.xlsx")
fa_2016 <- read_excel("DATA/Feeding America Data/MMG2018_2016Data_ToShare.xlsx")
fa_2017 <- read_excel("DATA/Feeding America Data/MMG2019_2017Data_ToShare.xlsx")
fa_2018 <- read_excel("DATA/Feeding America Data/MMG2020_2018Data_ToShare.xlsx")

