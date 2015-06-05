#read data from txt file
data <- read.table("./household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

#subsetting 
Subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#subsetting by time
Subset_time<-strptime(paste(Subset$Date, Subset$Time, sep=""), "%d/%m/%Y %H:%M:%S")

#Plot 3
plot(Subset_time, Subset$Sub_metering_1, xlab="", ylab="Energy sub metering", type ="l")
lines(Subset_time, Subset$Sub_metering_2, col="red")
lines(Subset_time, Subset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
                    
#Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()