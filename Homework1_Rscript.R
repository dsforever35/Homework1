#Darius Stevens
#CSC 587


#1a
#sets the working directory to look at filepath to Desktop
setwd("C:/Mac/Home/Desktop/") 

#returns files in working directory, there check and make sure program looks at corrfct directory 
dir()

#reads Su_raw_matrix.txt into variable called su
su <- read.delim("Su_raw_matrix.txt") 

#returns contents of su
su

#1b
#calls function mean for Liver_2.CEL column and sets it to Liver2_mean
Liver2_mean <- mean(su$Liver_2.CEL)

#returns value of Liver2_mean
Liver2_mean

#calls function sd for Liver_2.CEL column and sets it to Liver2_sd
Liver2_sd <- sd(su$Liver_2.CEL)

#returns value of Liver2_sd
Liver2_sd

#1c
#calls colMeans function for su and returns its value
colMeans(su)

#calls colSums function for su and returns its value
colSums(su)

#2a
#plots a histogram with random random numbers from 1-10000 with a standard deviation of .2
hist(rnorm(10000,mean = 0, sd = .02), xlim = c(-5,5))

#2b
#plots a histogram with random random numbers from 1-10000 with a standard deviation of .5
hist(rnorm(10000,mean = 0, sd = .05), xlim = c(-5,5))

#comments:
#the histogram with a standard deviation of .5 is wider along the x-axis relative to its mean as oppose to the one with a standard deviation of .2
#the reason is because standard variation measure the amount of variation of a dataset about its mean
#the lower the sd the closer the values are to the mean, the higher the sd the more the values are spread out

#install.packages("ggplot2")
library(ggplot2)

#3a
#install.packages("ggplot2")

#import library ggplot2
library(ggplot2) 

#creates sample data frame
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
rating = c(rnorm(200),rnorm(200, mean=.8)))

#3b
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

#3c
# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

#3d
# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

#3e
# Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#3f
diabetes <- read.csv("diabetes_train.csv") 

# Overlaid histograms
ggplot(diabetes, aes(x=mass, fill=class)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

# Interleaved histograms
ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, position="dodge")

# Density plots
ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()

# Density plots with semitransparent fill
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)

#4
#install.packages("tidyverse")
library(tidyverse)
passengers <- read.csv("titanic.csv")

#returns data in passengers variable
passengers

#(a)
#gives a summary of the data frame
passengers %>% drop_na() %>% summary()

#(b) 
#filters the "Sex" column by leaving rows with value of "male"
passengers %>% filter(Sex == "male")

#(c) 
#arranges data in descending order by values in the "Fare" column
passengers %>% arrange(desc(Fare))

#(d)
#adds a new column labeled "FamSize" whose values are populated by adding values in Parch" and "SibSp" columns
passengers %>% mutate(FamSize = Parch + SibSp)

#(e)
#creates a table that groups data based on Sex column, then summarizes data  by calculating the mean of the fares for each group and the sum of the values in the survived column
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))

#5
# calculates the values within the given percentiles within the diabetes data set
quantile(diabetes$skin, probs = c(.1,.3,.5,.6))

