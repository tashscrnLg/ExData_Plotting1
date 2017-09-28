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
png("plot3.png",width = 480, height = 480)

# Create line plot (type = "l") for plot3 
plot(dtReqDates$DateTime,dtReqDates$Sub_metering_1, type = "l", xlab = "", 
     ylab =  "Energy sub Metering")

# add sub_metering_2 to plot
lines(dtReqDates$DateTime,dtReqDates$Sub_metering_2, col = "red")

# add sub_metering_3 to plot
lines(dtReqDates$DateTime,dtReqDates$Sub_metering_3, col = "blue")

# add ledgend with  sub_metering and in colors that corresponds to the line
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      lty=1,  col=c("black", "red", "blue"))

dev.off()
