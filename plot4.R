# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting 
#to those dates.

# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the 
#strptime() and as.Date() functions.

# Note that in this dataset missing values are coded as ?

data <- read.csv2("household_power_consumption.txt", 
                  skip=66637, nrows=(69517-66637), 
                  dec=".", header = FALSE, na.strings="?", 
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  colClasses=c("character", "character", "numeric", "numeric",
                               "numeric", "numeric", "numeric", "numeric", "numeric"))

png("plot4.png")
x <- paste(data$Date, data$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
par(mfcol = c(2,2), mar=(c(5, 4, 4, 2) + 0.1))
plot(x, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
plot(x, data$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="l")
lines(x, data$Sub_metering_2, ylab="Energy Sub Metering", xlab="", type="l", col="red")
lines(x, data$Sub_metering_3, ylab="Energy Sub Metering", xlab="", type="l", col="blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), pch="_____", col=c("black", "red", "blue"), border="white", fill="white")
plot(x, data$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(x, data$Global_reactive_power, ylab="Global Reactive Power (kilowatts)", xlab="datetime", type="l")
dev.off()