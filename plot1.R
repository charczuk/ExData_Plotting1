plot1.data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
plot1.sub <- subset(plot1.data, plot1.data$Date == "1/2/2007" | plot1.data$Date == "2/2/2007")

png(filename = "plot1.png")
hist(as.numeric(plot1.sub$Global_active_power), col="red", ylab="Frequency", xlab="Blobal Active Power (kilowatts"
     , main = "Global Active Power")
dev.off()