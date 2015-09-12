#Exploratory Data Analysis Project 1, plot 4.

# set working dirctory to the folder where data file resides.
setwd("C:/coursera/exdata_data_household_power_consumption")

# Get total data
data_file <- "household_power_consumption.txt" 
total_data <- read.table(data_file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".") 

#Get subset data
subset_data <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]  

#Convert date and time to date timestamp
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Get data for each measure
global_active_power <- as.numeric(subset_data$Global_active_power) 
global_reactive_power <- as.numeric(subset_data$Global_reactive_power) 
voltage <- as.numeric(subset_data$Voltage)
submetering1 <- as.numeric(subset_data$Sub_metering_1) 
submetering2 <- as.numeric(subset_data$Sub_metering_2) 
submetering3 <- as.numeric(subset_data$Sub_metering_3)

#Create four plots and save into a png file
png("plot4.png", width=480, height=480) 

par(mfrow = c(2, 2))

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage") 

plot(date_time, submetering1, type="l", col="black", ylab="Energy Sub metering", xlab="") 
lines(date_time, submetering2, type="l", col="red") 
lines(date_time, submetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue")) 

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close graph device
dev.off()