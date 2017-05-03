power <- read.csv2("/Users/Max/Desktop/Data Science/R Files/Exploratory Data Analysis/Week 1 Project/household_power_consumption.txt",
                  sep = ";", header = TRUE )
february <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]


february$Global_active_power <- as.numeric(as.character(february$Global_active_power))

png("plot1.png")
hist(february$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()



