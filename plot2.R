source("read_data.R")
data <- read_two_days_of_data()

png(filename="plot2.png", width = 480, height = 480)
with(data, plot(dateTime, Global_active_power, 
                type="l",
                ylab="Global Active Power (kilowatts)",
                xlab=""
                ))
dev.off()