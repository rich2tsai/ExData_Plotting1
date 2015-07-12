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
png("./plot1.png", width=480, height=480)
with(mydf, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))
dev.off()
