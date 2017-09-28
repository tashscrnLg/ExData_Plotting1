
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
png("plot4.png",width = 480, height = 480)

# combine 4 plots into one overall graph using par and mfrow
par(mfrow = c(2, 2))

# First plot on graph row 1, col 1:  
plot(dtReqDates$DateTime,dtReqDates$Global_active_power, type = "l", xlab = "", 
     ylab =  "Global Active Power")

# second plot on graph row 1, col 2: 
plot(dtReqDates$DateTime,dtReqDates$Voltage, type = "l", xlab = "DateTime", 
     ylab =  "Voltage")

# third plot on graph row 2, col 1:
plot(dtReqDates$DateTime,dtReqDates$Sub_metering_1, type = "l", xlab = "", 
     ylab =  "Energy sub Metering")

# add to third plot 
lines(dtReqDates$DateTime,dtReqDates$Sub_metering_2, col = "red")

# add to third plot
lines(dtReqDates$DateTime,dtReqDates$Sub_metering_3, col = "blue")

# add to third plot: ledgend with sub_metering and in colors that corresponds to the line
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1,  col=c("black", "red", "blue"))

# fourth plot on graph row 2, col 2:
plot(dtReqDates$DateTime,dtReqDates$Global_reactive_power, type = "l", xlab = "DateTime", 
     ylab =  "Global_reactive_power")

dev.off()
