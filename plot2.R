# create a table from the household power consumption file
dtPower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string ="?")

# convert Date column from class factor to date
dtPower$Date <- as.Date(dtPower$Date, format = "%d/%m/%Y")

# create new data/time column 
dtPower$DateTime <- strptime(paste(dtPower$Date, dtPower$Time), format = "%Y-%m-%d %H:%M:%S")

# subset only required data 2007-02-01 and 2007-02-02 and remove unwanted object
dtReqDates <- subset(dtPower, Date == "2007-02-01" | Date == "2007-02-02")
rm(dtPower)

# create PNG file to output plot
png("plot2.png",width = 480, height = 480)

# Create line plot (type = "l") for plot2 
plot(dtReqDates$DateTime,dtReqDates$Global_active_power, 
     type = "l", xlab = "", ylab =  "Global Active Power (kilowatts)")

dev.off()
