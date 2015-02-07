# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting 
#to those dates.

# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and 
#as.Date() functions.

# Note that in this dataset missing values are coded as ?

data <- read.csv2("household_power_consumption.txt", 
                  skip=66637, nrows=(69517-66637), 
                  dec=".", header = FALSE, na.strings="?", 
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()