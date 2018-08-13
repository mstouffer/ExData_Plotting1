dataelectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dataelectric$Date <- as.Date(dataelectric$Date, "%d/%m/%Y")
dataelectric <- subset(dataelectric,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dataelectric <- dataelectric[complete.cases(dataelectric),]
DateTime <- paste(dataelectric$Date, dataelectric$Time)
DateTime <- setNames(DateTime, "DateTime")
dataelectric <- dataelectric[ ,!(names(dataelectric) %in% c("Date","Time"))]
dataelectric <- cbind(DateTime, dataelectric)
dataelectric$DateTime <- as.POSIXct(DateTime)
with(dataelectric, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })