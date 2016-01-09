plot4 <- function() {
  #Check if the file exists, if not, download and unzip it.
  if(!file.exists("household_power_consumption.txt")) {
    if(!file.exists("exdata-data-household_power_consumption.zip")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile = "exdata-data-household_power_consumption.zip", method = "curl")
    }
    unzip("exdata-data-household_power_consumption.zip")
  }
  # load library "data.table"
  library(data.table)
  DT <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  dat <- DT[Date=="1/2/2007" | Date=="2/2/2007"]
  png(file = "plot4.png", bg = "transparent", width = 480, height = 480)
  par(mfrow = c(2,2))
  with(dat, {
    plot(1:length(Global_active_power), Global_active_power, xlab = "", xaxt="n", type = "l",
         ylab = "Global Active Power")
    axis(1, at = c(0,length(Global_active_power)/2,length(Global_active_power)), labels = c("Thu","Fri","Sat"))
    
    plot(1:length(Voltage), Voltage, xlab = "", xaxt="n", type = "l", ylab = "Voltage")
    axis(1, at = c(0,length(Voltage)/2,length(Voltage)), labels = c("Thu","Fri","Sat"))
    
    plot(1:length(Sub_metering_1), Sub_metering_1, xlab = "", xaxt = "n", type = "l",
         ylab = "Energy sub metering", col = "black")
    lines(1:length(Sub_metering_2), Sub_metering_2, col = "red")
    lines(1:length(Sub_metering_3), Sub_metering_3, col = "blue")
    axis(1, at = c(0,nrow(dat)/2,nrow(dat)), labels = c("Thu","Fri","Sat"))
    legend("topright", col = c("black","red","blue"), bty = 'n',
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(1:length(Global_reactive_power), Global_reactive_power, xlab = "", xaxt="n", type = "l",
         ylab = "Global_reactive_power")
    axis(1, at = c(0,length(Global_reactive_power)/2,length(Global_reactive_power)),
         labels = c("Thu","Fri","Sat"))
  })
  dev.off()
}