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

## Make plot1 and save as PNG
png(file = "plot1.png", height = 480, width = 480)
hist(subsetData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

