FileName <- 'household_power_consumption.txt'
df <- read.table(FileName, sep = ';', header = TRUE, quote = "", na.strings = "?", stringsAsFactors = FALSE)
df[,1] <- as.Date(df[,1], format = "%d/%m/%Y")
DTTmp <- paste(df[,1],df[,2])
df$DateTime <- strptime(DTTmp, "%Y-%m-%d %H:%M:%S")
dfuse <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(dfuse$DateTime, dfuse$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(dfuse$DateTime, dfuse$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(dfuse$DateTime, dfuse$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()
