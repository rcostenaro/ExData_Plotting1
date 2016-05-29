# LOAD DATA
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dados <- read.table("household_power_consumption.txt", sep=";", header=T)
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados = subset(dados, Date == "2007-02-01" | Date == "2007-02-02")



# CREATE NEW COLUMN DATETIME (FORMAT DD/MM/YYYY HH:MM:SS)
# concatenates Date (format DD/MM/YYYY) and time (format HH:MM:SS) in a third independent column
dados["DateTime"] <- paste(dados$Date, dados$Time)
dados$DateTime <- strptime(dados$DateTime, format="%Y-%m-%d %H:%M:%S", tz="")


# PREPARE PLOT AREA
par(mfrow=c(2,2))

# PLOT 1 TOP-LEFT
dados$Global_active_power <- as.numeric(as.character(dados$Global_active_power))
plot(dados$DateTime, dados$Global_active_power, type="l", ylab="Global Active Power", xlab="")


# PLOT 2 TOP-RIGHT
dados$Voltage <- as.numeric(as.character(dados$Voltage))
plot(dados$DateTime, dados$Voltage, type="l", xlab="datetime", ylab="Voltage")

# PLOT 3 BOTTOM-LEFT
dados$Sub_metering_1 <- as.numeric(as.character(dados$Sub_metering_1))
dados$Sub_metering_2 <- as.numeric(as.character(dados$Sub_metering_2))
dados$Sub_metering_3 <- as.numeric(as.character(dados$Sub_metering_3))

plot(dados$DateTime, dados$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dados$DateTime, dados$Sub_metering_2, col="red")
lines(dados$DateTime, dados$Sub_metering_3, col="blue")

legend("topright",
	legend=c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
	col=c("black","red","blue"),
	bty="n",
	cex=0.8,
	lty=c(1,1,1),
	lwd=c(1,1,1))

# PLOT 4 BOTTOM-RIGHT
dados$Global_reactive_power <- as.numeric(as.character(dados$Global_reactive_power))
plot(dados$DateTime, dados$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# SAVE PNG FILE
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
