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
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

# save as PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
