##Reading required data for the project
data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)[66638:69517,]
##Assigning column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##X axis for the required plot
real <- strptime(paste(data$Date,data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")




##Converting to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)



##open png device of required size
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

##Plotting XY Line plot

plot(real,data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(real,data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(real, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(real,data$Sub_metering_2, type = "l", col = "red")
lines(real,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

plot(real,data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


##closing divce
dev.off()