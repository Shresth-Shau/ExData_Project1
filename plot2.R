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

png("plot2.png", width = 480, height = 480)

plot(sub_data$datetime,
     sub_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
