data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# For the task we only need the datea at 2007
datatotal <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", skip = 66630, 
                        nrows = 2900, col.names = names(data1), 
                        na.strings = c("?"))

# Convert to date/time type
datatotal$Date = as.Date(datatotal$Date, format = "%d/%m/%Y")
datatotal$Time = strptime(paste(datatotal$Date,datatotal$Time), "%F %T")

# For the task we only need the dates between 2007-02-01 and 2007-02-02 
datatotal2 <- subset(datatotal, datatotal$Date %in% 
                             as.Date(c("2007-02-01","2007-02-02")))

# plot 4
png("plot4.png",width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4.5,5,2,2))
#1
with(datatotal2, plot(Time, Global_active_power,ylab = "Global active power(kilowatts)", xlab = "", type = "l"))
#2
plot(datatotal2$Time,datatotal2$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "", col = "black")
points(datatotal2$Time,datatotal2$Sub_metering_2, col = "red", type =  "l")
points(datatotal2$Time,datatotal2$Sub_metering_3, col = "blue", type =  "l")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = names(datatotal2[,7:9]))
#3
plot(datatotal2$Time, datatotal2$Voltage, ylab = "Voltage", xlab = "datetime", col = "black", type = "l" )
#4
plot(datatotal2$Time, datatotal2$Global_reactive_power, col = "black", ylab = "Global_reactive_power", xlab = "datetime",type = "l")
dev.off()