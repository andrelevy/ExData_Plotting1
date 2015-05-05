rm(list=ls())

dt <- read.table("household_power_consumption.txt", header=TRUE, 
                 sep=";", na.strings = "?")

head(dt)
str(dt)

data <- subset(dt, dt$Date=="1/2/2007" | dt$Date=="2/2/2007")

str(data)

data$datetime <-
as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

str(data)
class(data)

 png(filename = "plot2.png",
     width = 480, height = 480)


plot(data$datetime, data$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab=""
)

dev.off()