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

## Make plot2 and save as PNG
png(file = "plot2.png", height = 480, width = 480)
plot(x = dateTime, y = subsetData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
