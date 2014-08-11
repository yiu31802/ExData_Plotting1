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

## Concatenate Date and Time column, and make a vector named `dates`
dates <- with(DF, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Prepare a graphic device for 4 plots
par(mfcol=c(2,2))
    
## Plot (1,1)
plot(x=dates, y=DF[,3], type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Plot (2,1)
# legend(.., bty="n") to remove the border line
plot(x=dates, y=DF[,7], type="l", ylab="Energy sub metering", xlab="")
lines(x=dates, y=DF[,8], type="l", col="red")
lines(x=dates, y=DF[,9], type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

## Plot (1,2)
plot(x=dates, y=DF[,5], type="l", xlab="datetime",
     ylab="Voltage")

## Plot (2,2)
plot(x=dates, y=DF[,4], type="l", xlab="datetime", ylab="Global_reactive_power")
