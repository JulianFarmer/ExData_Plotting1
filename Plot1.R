#read data from csv file
data <- read.table("./household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

#subsetting
Subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Plot 1
hist(Subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()