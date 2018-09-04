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


## Plot 4

par(mfrow=c(2,2))

##graph 1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##graph 2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

##graph 3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

#graph 4
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Output
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()