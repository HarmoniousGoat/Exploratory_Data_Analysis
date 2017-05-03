library(lubridate)


power <- read.csv2("/Users/Max/Desktop/Data Science/R Files/Exploratory Data Analysis/Week 1 Project/household_power_consumption.txt",
                   sep = ";", header = TRUE )
february <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]


february$Global_active_power <- as.numeric(as.character(february$Global_active_power))
february$Sub_metering_1 <- as.numeric(as.character(february$Sub_metering_1))
february$Sub_metering_2 <- as.numeric(as.character(february$Sub_metering_2))
february$Sub_metering_3 <- as.numeric(as.character(february$Sub_metering_3))

february$Date <- as.character(as.character(february$Date))
february$Time <- as.character(as.character(february$Time))
february$datetime <- paste(february$Date, february$Time, sep = " ")
february$datetime <- dmy_hms(february$datetime)

png("plot3.png")
plot(february$datetime, february$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = february$datetime, y = february$Sub_metering_1, type = "l")
lines(x = february$datetime, y = february$Sub_metering_2, type = "l", col = "red")
lines(x = february$datetime, y = february$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

