# Reading the data
mydata <- read.csv2('household_power_consumption.txt', na.strings = '?')
mydata$Date <- as.Date(mydata$Date, '%d/%m/%Y')

mydata_small <- mydata[(mydata$Date >= as.Date('2007-02-01', '%Y-%m-%d') & mydata$Date <= as.Date('2007-02-02', '%Y-%m-%d')),]
for (i in 3:9) {
      mydata_small[,i] <- as.numeric(mydata_small[,i])
}

# Constructing the plot
png("plot1.png", width=480, height=480)
hist(mydata_small$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')

# Closing the graphics device
dev.off()