library(lubridate)


power <- read.csv2("/Users/Max/Desktop/Data Science/R Files/Exploratory Data Analysis/Week 1 Project/household_power_consumption.txt",
                   sep = ";", header = TRUE )
february <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]


february$Global_active_power <- as.numeric(as.character(february$Global_active_power))

february$Date <- as.character(as.character(february$Date))
february$Time <- as.character(as.character(february$Time))
february$datetime <- paste(february$Date, february$Time, sep = " ")
february$datetime <- dmy_hms(february$datetime)

png("plot2.png")
plot(february$datetime, february$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x = february$datetime, y = february$Global_active_power, type = "l")
dev.off()
