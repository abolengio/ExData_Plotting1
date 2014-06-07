source("read_data.R")
data <- read_two_days_of_data()

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
    plot(dateTime, Global_active_power, 
         type="l",
         ylab="Global Active Power",
         xlab=""
    )
    plot(dateTime, Voltage, 
         type="l",
         xlab="datetime"
    )
    plot(dateTime, Sub_metering_1, 
                type="n",
                ylab="Energy sub metering",
                xlab=""
                )
    with(data, lines(dateTime, Sub_metering_1, col="black"))
    with(data, lines(dateTime, Sub_metering_2, col="red"))
    with(data, lines(dateTime, Sub_metering_3, col="blue"))
    legend("topright", bty="n",lty = c(1, 1, 1), col = c("black","red","blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(dateTime, Global_reactive_power, 
         type="l",
         xlab="datetime"
    )
})
dev.off()