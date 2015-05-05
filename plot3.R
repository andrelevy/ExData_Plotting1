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

 png(filename = "plot3.png",
   width = 480, height = 480)


plot(data$datetime, data$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering",
     xlab=""
)

lines(data$datetime, data$Sub_metering_2, 
      col="red"
)

lines(data$datetime, data$Sub_metering_3, 
      col="blue"
)

legend (x="topright", 
        c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1,1), # gives the legend appropriate symbols (lines)
        col=c("black","red", "blue")
        )  

 dev.off()