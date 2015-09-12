#Exploratory Data Analysis Project 1, plot 2.

# set working dirctory to the folder where data file resides.
setwd("C:/coursera/exdata_data_household_power_consumption")

# Get total data
data_file <- "household_power_consumption.txt" 
total_data <- read.table(data_file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".") 

#Get subset data
subset_data <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]  

#Convert date and time to date timestamp
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create plot
global_active_power <- as.numeric(subset_data$Global_active_power) 
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

#Save plot to a file
dev.copy(png, file="plot2.png", height=480, width=480)

#close graph device
dev.off()