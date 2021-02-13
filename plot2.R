plot2.data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
plot2.sub <- subset(plot2.data, plot2.data$Date == "1/2/2007" | plot2.data$Date == "2/2/2007")

plot2.sub$Date <- as.Date(plot2.sub$Date, format="%d/%m/%Y")
plot2.sub$Time <- strptime(plot2.sub$Time, "%H:%M:%S")
plot2.sub[1:1440,"Time"] <- format(plot2.sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
plot2.sub[1441:2880,"Time"] <- format(plot2.sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(filename = "plot2.png")
plot(plot2.sub$Time, plot2.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", 
     main = "Global Active Power Vs Time")
dev.off()