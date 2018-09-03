## Plot 1
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()