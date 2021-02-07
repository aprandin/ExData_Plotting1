# Reading the data
mydata <- read.csv2('household_power_consumption.txt', na.strings = '?')
mydata$Time <- strptime(paste(mydata$Date,mydata$Time),'%d/%m/%Y %H:%M:%S')

mydata$Date <- as.Date(mydata$Date, '%d/%m/%Y')
mydata_small <- mydata[(mydata$Date >= '2007-02-01' & mydata$Date <= '2007-02-02'),]
for (i in 3:9) {
      mydata_small[,i] <- as.numeric(mydata_small[,i])
}

# Constructing the plot
png("plot2.png", width=480, height=480)
plot(x = mydata_small$Time, y = mydata_small$Global_active_power, type = 'l', xlab = '' , ylab = 'Global Active Power (kilowatts)')

# Closing the graphics device
dev.off()