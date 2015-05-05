dt <- read.table("household_power_consumption.txt", header=TRUE, 
                 sep=";", na.strings = "?")

head(dt)
str(dt)

data <- subset(dt, dt$Date=="1/2/2007" | dt$Date=="2/2/2007")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Time <- strptime(data$Time, "%H:%M:%S")
  
str(data)

attach(data)

png(filename = "plot1.png",
    width = 480, height = 480)



hist(Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red",
     ylim=c(0,1200)
     )

dev.off()