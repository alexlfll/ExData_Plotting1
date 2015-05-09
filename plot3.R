data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, na.strings=c("?"), skip=66637, 
     nrows=2880, col.names=c("Date", "Time","Global_active_power", "Global_reactive_power", 
     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

data$timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA)

yrange=range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
plot(data$timestamp, data$Sub_metering_1,  type="l", ylim=yrange, ylab="Energy Sub Metering", xlab="")
par(new=T)
plot(data$timestamp, data$Sub_metering_2,  type="l", ylim=yrange, col="red", ylab="", xlab="")
par(new=T)
plot(data$timestamp, data$Sub_metering_3,  type="l", ylim=yrange, col="blue", ylab="", xlab="")
legend ("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

