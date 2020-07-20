# set working directory
setwd("Documents/R/Getting & cleaning data - Coursera")

# import dataset
household <- read_delim("Documents/R/Getting & cleaning data - Coursera/household_power_consumption.txt", 
                         ";", escape_double = FALSE, trim_ws = TRUE)

# set the right date format
data1 <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# create histogra 
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")