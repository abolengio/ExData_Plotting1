read_two_days_of_data <- function() {
    original_file_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    data_file = "household_power_consumption.txt"
    if(!file.exists(data_file)) {
        temp <- tempfile()
        download.file(original_file_url, destfile=temp, method="curl")
        unzip(temp)
        unlink(temp)
    }
    
    data<-read.table(data_file, skip=66000, sep=";",nrows=4000)
    colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
    data$dateTime<-paste(data$Date,data$Time,sep=" ")
    data$dateTime<-strptime(data$dateTime,format="%d/%m/%Y %H:%M:%S")
    return(data)
}