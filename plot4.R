data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, na.strings=c("?"), skip=66637, 
                   nrows=2880, col.names=c("Date", "Time","Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

data$timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA)


old.par = par(mfrow=c(2,2))
plot(data$timestamp, data$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(data$timestamp, data$Voltage,  type="l", ylab="Voltage", xlab="datetime")

yrange=range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
plot(data$timestamp, data$Sub_metering_1,  type="l", ylim=yrange, ylab="Energy Sub Metering", xlab="")
par(new=T)
plot(data$timestamp, data$Sub_metering_2,  type="l", ylim=yrange, col="red", ylab="", xlab="")
par(new=T)
plot(data$timestamp, data$Sub_metering_3,  type="l", ylim=yrange, col="blue", ylab="", xlab="")
legend ("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$timestamp, data$Global_reactive_power,  type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()




# trebuie corectat label X