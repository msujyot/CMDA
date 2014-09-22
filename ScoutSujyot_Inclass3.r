# In class assignment #2
# Scout (Mugdha) Sujyot

getwd()
setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA")

load("exampleData1.rData")

newdata<-merge(custdata, medianincome)

newdata$norm.income<-newdata$income/newdata$Median.Income

summary(newdata$norm.income)

# This normalisation makes sense when you want to compare cost-of-living and purchasing 
# power in different states so you can more easily compare options.


testSet <- subset(newdata, newdata$gp <= 0.3)
trainingSet <- subset(newdata, newdata$gp > 0.3)
