plot3 <- function() {
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
  png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
  with(dat, {
    plot(1:length(Sub_metering_1), Sub_metering_1, xlab = "", xaxt = "n", type = "l",
         ylab = "Energy sub metering", col = "black")
    lines(1:length(Sub_metering_2), Sub_metering_2, col = "red")
    lines(1:length(Sub_metering_3), Sub_metering_3, col = "blue")
    axis(1, at = c(0,nrow(dat)/2,nrow(dat)), labels = c("Thu","Fri","Sat"))
    legend("topright",lty = 1, col = c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  })
  dev.off()
}