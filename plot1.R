## Description
# Our overall goal here is simply to examine how household energy usage
# varies over a 2-day period in February, 2007.
# We will only be using data from the dates 2007-02-01 and 2007-02-02.

## Fetch the data between 2007-02-01 to 2007-02-02
# Reference: https://class.coursera.org/exdata-005/forum/thread?thread_id=11
library(sqldf)
DF <- read.csv.sql(file="household_power_consumption.txt", sep=";",
                    sql = 'select * from file where Date = "1/2/2007" OR \
                           Date = "2/2/2007"')

## Plot 'Global Active Power' distribution
hist(DF[,3], breaks=20, xlab="Global Active Power (kilowatts)",
     xlim=c(0,6), col="red", main="Global Active Power")
