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

# Plot 1
png("plot1.png",width = 480, height = 480)
with(datatotal2, hist(Global_active_power,
                      xlab = "Global active power(kilowatts)", 
                      main = "Global Active Power", col = "red"))
dev.off()

