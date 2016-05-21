FileName <- 'household_power_consumption.txt'
df <- read.table(FileName, sep = ';', header = TRUE, quote = "", na.strings = "?", stringsAsFactors = FALSE)
df[,1] <- as.Date(df[,1], format = "%d/%m/%Y")
DTTmp <- paste(df[,1],df[,2])
df$DateTime <- strptime(DTTmp, "%Y-%m-%d %H:%M:%S")
dfuse <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(dfuse$DateTime, dfuse$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()