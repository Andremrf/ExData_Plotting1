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


## Plot 1
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()