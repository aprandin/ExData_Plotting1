# Reading the data
library(lubridate)
mydata <- read.csv2('household_power_consumption.txt')
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)

mydata_small <- mydata[(mydata$Date >= as.Date('2007-02-01', '%Y-%m-%d') & mydata$Date <= as.Date('2007-02-02', '%Y-%m-%d')),]
for (i in 3:9) {
      mydata_small[,i] <- as.numeric(mydata_small[,i])
}

mydata_complete <- mydata_small[complete.cases(mydata_small$Global_active_power),]

# Construct the plot
hist(mydata_complete$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')

# Copy the plot to a PNG file
dev.copy(png, file = 'plot1.png')
dev.off()