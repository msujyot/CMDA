# Name: Scout (Mugdha) Sujyot
# Class name: Intro Data Analytics & Visualisation (CS 3654)
# Homework number: 2
# Date: 09/15/2014


getwd()
setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA")

load('phsample.RData')

# This dataset is personal census data for anonymised persons and households. 
# The data includes age, employment class, education level, and the sex of the worker. 

# Selects a subset of data rows workers that are self-described as full-time
# employees, report at least 40 hours a week of activity, are between 20 and 50 years
# old, and have an income between $1,000 and $250,000.
psub = subset(dpus, with (dpus,                             
              (PINCP > 1000) & 
                (ESR == 1) & 
                (PINCP <= 250000) & 
                (PERNP > 1000) &
                (PERNP <= 250000) &
                (WKHP >= 40) &
                (AGEP >= 20) & (AGEP <= 50) &
                (PWGTP1 > 0) & (COW %in% (1:7)) & (SCHL %in% (1:24))
                ))

                
# Re-encodes sex from 1/2 to M/F
psub$SEX = as.factor(ifelse(psub$SEX==1, 'M','F'))

# Makes the reference sex M, so F encodes a difference from M in models
psub$SEX = relevel(psub$SEX, 'M')

# Re-encodes class of worker info into a more readable form
cowmap <- c("Employee of a private for-profit",
            "Private not-for-profit employee",
            "Local government employee",
            "State government employee",
            "Federal government employee",
            "Self-employed not incorporated",
            "Self-employed incorporated")
            
psub$COW = as.factor(cowmap[psub$COW])

psub$COW = relevel(psub$COW, cowmap[1])

# Re-encodes education info into a more readable form

schlmap = c(
  rep("no high school diploma", 15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
  )
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL, schlmap[1])

#These are subsets of data rows used for model training and testing
dtrain = subset(psub, ORIGRANDGROUP >= 500)
dtest = subset(psub, ORIGRANDGROUP < 500)


#Summarises the classifications of work
summary(dtrain$COW)


setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA\\Pew Data")

#Pew Social Trends data for diet/gambling/movies(see manual)
pewSocial <- read.csv(
  'pew-diet-movies.csv',
  sep=',',
  header=T
)

dim(pewSocial)
names(pewSocial)
summary(pewSocial)