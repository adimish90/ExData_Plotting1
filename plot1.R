##Reading required data for the project
data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)[66638:69517,]
##Assigning column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Converting to Date
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
## Converting to Time
data[,2] <- format(data[,2], format = "%H:%M:%S")

##Converting to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

##open png device of required size
png("plot1.png", width=480, height=480)


##Plotting Histogram
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

##closing divce
dev.off()