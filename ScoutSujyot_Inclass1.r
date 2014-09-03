# In class assignment #1
# Scout (Mugdha) Sujyot


setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA")
cars<- read.table('cars1.csv', sep=',', header=T)  

nrow(cars)  # this gives the number of rows (50)

ncol(cars) # this gives the number of columns (2)

var1 <-  cars[2,2]

head(cars) # the variables names are speed and distance 

cars[,1] # this prints the first column

cars[,2]] # this prints the second column

SPEED <- cars[,1] # this assigns the speed values to the variable speed
print(SPEED) # and prints them out

cars[15,] # this prints out row 15
