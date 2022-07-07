## Download and unzip files
file_name <- "Electric_power_consumption.zip"
if(!file.exists(file_name)) {
        file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(file_url, file_name)
        unzip(file_name)
}

## Read the data and subset for the two relevant dates
data <- read.table("./household_power_consumption.txt", header = TRUE,
                   stringsAsFactors = FALSE, sep = ";", dec = ".", na.strings = "?")
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Change the class and format of the Date and Time variables
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Make plot4 and save as PNG
png(file = "plot4.png", height = 480, width = 480)
par(mfcol = c(2,2))
plot(x = dateTime, y = subsetData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(x = dateTime, y = subsetData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "black")
        lines(x = dateTime, y = subsetData$Sub_metering_2, col = "red")
        lines(x = dateTime, y = subsetData$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
plot(x = dateTime, y = subsetData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x = dateTime, y = subsetData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()