data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data,
                   Date >= as.Date("2007-02-01") &
                   Date <= as.Date("2007-02-02"))

datetime <- paste(sub_data$Date, sub_data$Time)
sub_data$datetime <- as.POSIXct(datetime)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(sub_data$datetime,
     sub_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(sub_data$datetime,
     sub_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(sub_data$datetime,
     sub_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub_data$datetime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$datetime, sub_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

plot(sub_data$datetime,
     sub_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

dev.off()
