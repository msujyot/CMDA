#######################################################################
#                 Data Structures and Manipulation
#######################################################################
           #######################################################################
           #                         Data Import
           #######################################################################           
getwd()
setwd("C:\\Users\\Denisa\\Google Drive\\Fall14\\Data Analytics\\Notes\\Lect3")
mydatacsv<- read.table('prices.csv', sep=',', header=T)
mydatatxt<- read.table('prices.txt', sep='\t', header=T)   

#from web, giving the url

fpe <- read.table("http://data.princeton.edu/wws509/datasets/effort.dat")

tail(mydatacsv)
tail(mydatatxt)
tail(fpe)

#Working with the imported datasets
dim(mydatacsv)
var1 <- mydatacsv[2,3]
var1
var2 <- mydatacsv[10,4]
var2
#print columns
mydatacsv[,1]
mydatacsv[,2]
mydatacsv[,3]
mydatacsv[,4]

#print subsets
mydatacsv[1:2,1:2]
#create new variable and assign the second col values
SQFT <- mydatacsv[,2] 
SQFT
#Another way to address a certain column in the imported dataset
#using extract symbol
SQFT2 <- mydatacsv$SQFT
#print rows
mydatacsv[15,]       
#######################################################################
#                   #Exporting data

#From R to a csv file
write.csv(mydatacsv,file="mydatacsv1.csv") 
#From R to a text document
write.table(mydatacsv,file="mydatacsv1.txt", sep="\t")

#############################################################################
      # Data Frames #
##############################################################################
#Any of the imported datasets are R data frames
mydatacsv
#Can use just part of the data frame, such as a variable
mydatacsv$NE

#Extract certain elements from data frame using commands learnt with matrices

mydatacsv[mydatacsv$NE == 1,] #extracts only rows where NE is 1

#we can learn the variables names from a data frame
names(mydatacsv)

#we can attach the data frame to have variables directly available
#but allways remember to detach after done working with it, or else problems
attach(mydatacsv)

#Simple analytics for all variables in the dataset

summary(mydatacsv)

#or for just one variable

summary(PRICE)

#visualize
plot(SQFT,PRICE)
plot(AGE,PRICE)

#detach dataset; variables not directly accesible anymore
detach(mydatacsv)

#how can we access variables from data frame if not attached?
PRICE #does this work if data frame not attached?
mydatacsv$PRICE
mydatacsv[,1]



