#read data from txt file
data <- read.table("./household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

#subsetting 
Subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#subsetting by time
Subset_time<-strptime(paste(Subset$Date, Subset$Time, sep=""), "%d/%m/%Y %H:%M:%S")

#Plot 4 (2by2 plot array)
par(mfrow = c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0))

plot(Subset_time, Subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Subset_time, Subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Subset_time, Subset$Sub_metering_1, xlab="", ylab="Energy sub metering", type ="l")
lines(Subset_time, Subset$Sub_metering_2, col="red")
lines(Subset_time, Subset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=2.5, col=c("black", "red", "blue"))

plot(Subset_time, Subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()