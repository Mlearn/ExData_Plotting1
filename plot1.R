plot1 <- function() {
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
  #date <- as.Date(strptime(DT$Date,"%d/%m/%Y"))
  #DT[,dateF:=as.Date((strptime(Date,"%d/%m/%Y")))]
  #datemin <- as.Date(strptime("1/2/2007","%d/%m/%Y"))
  #datemax <- as.Date(strptime("2/2/2007","%d/%m/%Y"))
  dat <- DT[Date=="1/2/2007" | Date=="2/1/2007"]
  png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
  with(dat, hist(Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
  dev.off()
}