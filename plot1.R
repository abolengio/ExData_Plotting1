source("read_data.R")
data <- read_two_days_of_data()

png(filename="plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, main="Global Active Power", 
                xlab="Global Active Power (kilowatts)",
                col="red"))
dev.off()