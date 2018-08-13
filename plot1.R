dataelectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dataelectric$Date <- as.Date(dataelectric$Date, "%d/%m/%Y")
dataelectric <- subset(dataelectric,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dataelectric <- dataelectric[complete.cases(dataelectric),]
hist(dataelectric$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")