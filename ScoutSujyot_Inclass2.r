# In class assignment #2
# Scout (Mugdha) Sujyot

getwd()
setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA")

#The health insurance customer data
load('exampleData.rData')


#Summary statistics
summary(custdata) #for the entire data frame

summary(custdata$is.employed)         # We have 325 NA's in the "is employed" field and we need 
                                      # to resolve those.
summary(custdata$income)              # We have a negative minimum income (-8700!) which is 
                                      # illogical and we need to re-examine the data.
summary(custdata$age)                 # Our max age is 146.7 which seems unlikely. This is 
                                      # probably a data entry error and should be verified.

summary(custdata$num.vehicles)        #We have 56 NA's for number of vehicles. These might just 
                                      #be 0's but should be checked.
summary(custdata$housing.type)        #We have 56 NA's for housing type also.
summary(custdata$recent.move)         #And also for recent.move. Perhaps there are the same 
                                      #records that are causing issues?


#Loading cars data
uciCar <- read.table(
  'http://www.win-vector.com/dfiles/car.data.csv',
  sep=',',
  header=T
)

#Examine the loaded data
summary(uciCar)                         # This data is very well-behaved with no NAs indicating
                                        # missing entries


load('credit.RData')
summary(d)

# We have to reshape the data to make it easier to work with
mapping <- list('A11'='... < 0 DM',
                'A12'='0 <= ... < 200 DM',
                'A13'='... >= 200 DM / salary assignments for at least 1 year',
                'A14'='no checking account',
                'A30'='no credits taken/all credits paid back duly',
                'A31'='all credits at this bank paid back duly',
                'A32'='existing credits paid back duly till now',
                'A33'='delay in paying off in the past',
                'A34'='critical account/other credits existing (not at this bank)',
                'A40'='car (new)',
                'A41'='car (used)',
                'A42'='furniture/equipment',
                'A43'='radio/television',
                'A44'='domestic appliances',
                'A45'='repairs',
                'A46'='education',
                'A47'='(vacation - does not exist?)',
                'A48'='retraining',
                'A49'='business',
                'A410'='others',
                'A61'='... < 100 DM',
                'A62'='100 <= ... < 500 DM',
                'A63'='500 <= ... < 1000 DM',
                'A64'='.. >= 1000 DM',
                'A65'='unknown/ no savings account',
                'A71'='unemployed',
                'A72'='... < 1 year',
                'A73'='1 <= ... < 4 years',
                'A74'='4 <= ... < 7 years',
                'A75'='.. >= 7 years',
                'A91'='male : divorced/separated',
                'A92'='female : divorced/separated/married',
                'A93'='male : single',
                'A94'='male : married/widowed',
                'A95'='female : single',
                'A101'='none',
                'A102'='co-applicant',
                'A103'='guarantor',
                'A121'='real estate',
                'A122'='if not A121 : building society savings agreement/life insurance',
                'A123'='if not A121/A122 : car or other, not in attribute 6',
                'A124'='unknown / no property',
                'A141'='bank',
                'A142'='stores',
                'A143'='none',
                'A151'='rent',
                'A152'='own',
                'A153'='for free',
                'A171'='unemployed/ unskilled - non-resident',
                'A172'='unskilled - resident',
                'A173'='skilled employee / official',
                'A174'='management/ self-employed/highly qualified employee/ officer',
                'A191'='none',
                'A192'='yes, registered under the customers name',
                'A201'='yes',
                'A202'='no')

num_variables <- dim(d)[2]
for(i in 1:num_variables) {
  if(class(d[,i])=='character') { 
    d[,i] <- as.factor(as.character(mapping[d[,i]])) 
  }
}

summary(d$Personal.status.and.sex)      # Although we know that 92 men are married/widowed, 
                                        # 548 are single, and 50 are divorced or separated, 
                                        # for the women we only know that 310 were 
                                        # married/separated/divorced and we don't know how many,
                                        # if any, are single.

summary(d$'Other.debtors/guarantors')   # Out of all the loans, 907 did not have coapplicants or 
                                        # guarantors 41 had coapplicants and 52 had guarantors.
                                        # This indicates that it easier to get a loan in Germany 
                                        # than in the States.


install.packages('hexbin')
library(hexbin)
library(ggplot2)


load('exampleData.rData')
custdata2 <- subset(custdata,
                    (custdata$age > 0 & custdata$age < 100
                     & custdata$income > 0))

names(custdata2)

#This creates a hexbin plot   
hexbinplot(custdata2$age~custdata2$income)    # The hexbin plot resembles a scatter plot as it 
                                              # indicates density. However, by binning the data
                                              # we can see this information more clearly.



# I used a scatter plot to compare Income vs Number of Vehicles. There doesn't really seem to be 
# any correlation between the two, however.
ggplot(custdata2, aes(x=income,y=num.vehicles)) +
  geom_point() +
  ylim(0,6) +
  theme_bw() +
  ggtitle("Income vs Number of Vehicles")

# I used a side-by-side bar chart to compare Income < 30K vs Recent Move. There doesn't really seem 
# to be any correlation between the two, either.
ggplot(custdata) + 
  geom_bar(aes(x=recent.move, fill=income.lt.30K),position="dodge")
  + theme_bw() + ggtitle("Income < 30K vs Recent Move")
