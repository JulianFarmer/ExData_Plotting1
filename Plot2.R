#read data from txt file
data <- read.table("./household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

#subsetting 
Subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#subsetting by time
Subset_time<-strptime(paste(Subset$Date, Subset$Time, sep=""), "%d/%m/%Y %H:%M:%S")

#Plot 2
plot(Subset_time, Subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()