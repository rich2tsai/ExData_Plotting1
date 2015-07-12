# This script plots charts as per Coursera course "Exploratory Data Analysis", Project 1.

# The function below really should be separated out to a separate R file, but the project
# specifically instructs to only have a certain number of R scripts.
# Assumes the raw data file is in the same directory.

getData <- function() {
    df <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
    df <- transform(df, DateTime = strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))    
    # The code below returns data from the dates 2007-02-01 and 2007-02-02
    df[df$DateTime >= as.POSIXct("2007-02-01") & df$DateTime < as.POSIXct("2007-02-03"), ]
}

# Main body of script

mydf <- getData()
png("./plot4.png", width=480, height=480)
par(mfrow=c(2,2))   #Four sub-plots, from top to bottom, left to right

#top-left plot
with(mydf, plot(DateTime, Global_active_power, type='l', xlab="", ylab="Global Active Power"))

#top-right plot
with(mydf, plot(DateTime, Voltage, type="l", xlab=""))

#bottom-left plot
with(mydf, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(mydf, lines(DateTime, Sub_metering_1, col="black"))
with(mydf, lines(DateTime, Sub_metering_2, col="red"))
with(mydf, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lwd=1, box.lty=0, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottom-right plot (NOTE my ylab looks better and more consistent with top-left plot)
with(mydf, plot(DateTime, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power"))

dev.off()
