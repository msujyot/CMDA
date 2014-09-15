#CMDA
#In-class September 3

#set directory
getwd()
setwd("C:\\Users\\xiang\\Documents\\CMDA")

#2.
cars1 <- read.csv("cars1.csv", sep = ",", header = T)

#3.
dim(cars1)

#4.
var1 <- cars1[2,3]

#5
names(cars1)

#6
cars1[,1]
cars1[,2]
cars1$speed
cars1$dist

#7
SPEED <- cars1$speed
print(SPEED)

#8
cars1[15,]
