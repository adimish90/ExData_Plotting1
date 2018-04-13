##Reading required data for the project
data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)[66638:69517,]
##Assigning column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##X axis for the required plot
real <- strptime(paste(data$Date,data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")




##Converting to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

##open png device of required size
png("plot2.png", width=480, height=480)


##Plotting XY Line plot

plot(real,data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##closing divce
dev.off()