# In class assignment #2
# Scout (Mugdha) Sujyot


setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA")
cars<- read.table('cars1.csv', sep=',', header=T)  

#The health insurance customer data
load('exampleData.rData')


#Summary statistics
summary(custdata) #for the entire data frame

#look at individual variables to spot problems

summary(custdata$is.employed)         #We have 325 NA's in the "is employed" field and we need to resolve those.
summary(custdata$income)              #We have a negative minimum income (-8700!) which is illogical and we need to re-examine the data.
summary(custdata$age)                 #Our max age is 146.7 which seems unlikely. This is probably a data entry error and should be verified.

summary(custdata$num.vehicles)        #We have 56 NA's for number of vehicles. These might just be 0's but should be checked.
summary(custdata$housing.type)        #We have 56 NA's for housing type also.
summary(custdata$recent.move)         #And also for recent.move. Perhaps there are the same records that are causing issues?


#Loading cars data
uciCar <- read.table(
  'http://www.win-vector.com/dfiles/car.data.csv',
  sep=',',
  header=T
)

#Examine the loaded data
summary(uciCar)
