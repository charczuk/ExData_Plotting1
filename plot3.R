plot3.data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
plot3.sub <- subset(plot3.data, plot3.data$Date == "1/2/2007" | plot3.data$Date == "2/2/2007")

plot3.sub$Date <- as.Date(plot3.sub$Date, format="%d/%m/%Y")
plot3.sub$Time <- strptime(plot3.sub$Time, "%H:%M:%S")
plot3.sub[1:1440,"Time"] <- format(plot3.sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
plot3.sub[1441:2880,"Time"] <- format(plot3.sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(filename = "plot3.png")
plot(plot3.sub$Time, plot3.sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot3.sub$Time, plot3.sub$Sub_metering_2, col="red")
lines(plot3.sub$Time, plot3.sub$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()