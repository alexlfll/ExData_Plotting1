dev.off()
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, na.strings=c("?"), skip=66637, 
                   nrows=2880, col.names=c("Date", "Time","Global_active_power", "Global_reactive_power", 
                                           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA)
plot(data$timestamp, data$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

