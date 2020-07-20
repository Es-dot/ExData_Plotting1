# set working directory
setwd("Documents/R/Getting & cleaning data - Coursera")

# import dataset
household <- read_delim("Documents/R/Getting & cleaning data - Coursera/household_power_consumption.txt", 
                        ";", escape_double = FALSE, trim_ws = TRUE)

# set to the right date format and to the needed dates
data1 <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## plot 
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save as PNG
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
