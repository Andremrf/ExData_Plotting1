## Load table
dfull <- read.table("HouseholdPC.txt", header = TRUE , sep = ";") 

## Convert Date
dfull$Date <- as.Date(dfull$Date, format="%d/%m/%Y")

## Subset the dataset
df <- subset(dfull, dfull$Date=="2007-02-01" | dfull$Date=="2007-02-02")

## Convert to numeric
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

## Create a timestamp
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)))



## Plot 3

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
