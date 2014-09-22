# Name: Scout (Mugdha) Sujyot
# Class name: Intro Data Analytics & Visualisation (CS 3654)
# Homework number: 3
# Date: 09/22/2014


getwd()
setwd("C:\\Users\\Scout\\Desktop\\School\\CS 3654\\CMDA\\Pew Data")

#Pew Social Trends data for diet/gambling/movies(see manual)
pewSocial <- read.csv(
  'pew-diet-movies.csv',
  sep=',',
  header=T
)

dim(pewSocial)

sink('pewSocialNames.txt')
names(pewSocial)
sink()

summary(pewSocial)

# Our data is very well behaved, with no missing data that will need to be corrected. 
# Each question has a code for 'Don't know/refused', and as there are a lot of 
# observations, they can often be dropped.


# Most of our data are best set as factor, though there are some, such as those 
# dealing with the frequency of an action that might be better used as numeric
# variables.

# We do have over 400 variables and need to narrow it down to make it manageable. 
# We've narrowed it down to 108 variables.  This creates a smaller data frame with
# only the columns listed in the file pewSocialNamesSubset.txt."


columns_of_interest <- readLines('pewSocialNamesSubset.txt')
cols <- unlist(lapply(columns_of_interest, function (x) gsub("^\\s+|\\s+$", "", x)))
pewsubset <- subset(pewSocial, select = cols)

#Any numerical data has been conveniently broken up into buckets to begin with.  
#For example, income looks like this:
summary(pewsubset$INCOME.Last.year..that.is.in.2005..what.was.your.total.family.income.from.all.sources..before.taxes...Just.stop.me.when._labels)

"Don't know/Refused:363                                                                                      
 50 to under $75,000                  :338                                                                                      
 30 to under $40,000                  :247                                                                                      
 75 to under $100,000                 :246                                                                                      
 20 to under $30,000                  :231                                                                                      
 40 to under $50,000                  :222                                                                                      
 (Other)                              :604"

summary(pewsubset$Q.59.About.how.often.in.an.average.week.do.you.eat.a.meal.from.a.fast.food.restaurant.like.McDonald.s.or.Burger.King._labels)

#let's make names easier to work with:
colnames(pewsubset)[colnames(pewsubset)=="Q.59.About.how.often.in.an.average.week.do.you.eat.a.meal.from.a.fast.food.restaurant.like.McDonald.s.or.Burger.King._labels"] <- "fast_food_freq"
summary(pewsubset$fast_food_freq)

colnames(pewsubset)[colnames(pewsubset)=="RACE.Are.you.white.Hispanic..black.Hispanic..or.some.other.race...What.is.your.race...Are.you.white..black..Asian..or.so_labels"] <- "race"
summary(pewsubset$race)


library(ggplot2)



ggplot(pewsubset) + geom_bar(aes(x=race,
                                 fill=fast_food_freq),
                             position="fill") +
  theme_bw()+
  ggtitle("Fast food frequency by race")

  
ggplot(pewSocial) + geom_bar(aes(x=Q.1.How.would.you.rate.the.overall.quality.of.your.life...READ._labels,
                                 fill=Census.region_labels),
                            position="fill") +
  theme_bw()+
  ggtitle("Quality of life per region")


colnames(pewsubset)[colnames(pewsubset)=="Q.50b.How.much.do.you.think.exercising.for.physical.fitness.affects.a.person.s.attractiveness...a.lot..a.little..or.not._labels"] <- "weight_aff_attr"

ggplot(pewsubset) + geom_bar(aes(x=weight_aff_attr,
                                 fill=Census.region_labels),
                             position="fill") +
  theme_bw()+
  ggtitle("How much weight affects attractiveness per region")


# As we find which variables we want to concentrate on, we'll need to be sure 
# to graph according to the PROPORTION of respondents of a certain category 
# rather than the raw amount.  



