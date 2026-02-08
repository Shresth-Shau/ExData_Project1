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

png("plot3.png", width = 480, height = 480)

plot(sub_data$datetime,
     sub_data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(sub_data$datetime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$datetime, sub_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
