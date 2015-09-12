#Exploratory Data Analysis Project 1, plot 1.

# set working dirctory to the folder where data file resides.
setwd("C:/coursera/exdata_data_household_power_consumption")

# Get total data
data_file <- "household_power_consumption.txt" 
total_data <- read.table(data_file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".") 

#Get subset data
subset_data <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]  

#Create plot
global_active_power <- as.numeric(subset_data$Global_active_power) 
hist(global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)") 

#Save plot to a file
dev.copy(png, file="plot1.png", height=480, width=480)

#close graph device
dev.off()
