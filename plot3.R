# LOAD DATA
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dados <- read.table("household_power_consumption.txt", sep=";", header=T)
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados = subset(dados, Date == "2007-02-01" | Date == "2007-02-02")

# CREATE NEW COLUMN DATETIME (FORMAT DD/MM/YYYY HH:MM:SS)
# concatenates Date (format DD/MM/YYYY) and time (format HH:MM:SS) in a third independent column
dados["DateTime"] <- paste(dados$Date, dados$Time)
dados$DateTime <- strptime(dados$DateTime, format="%Y-%m-%d %H:%M:%S", tz="")

# CONVERT DATA TYPES
dados$Sub_metering_1 <- as.numeric(as.character(dados$Sub_metering_1))
dados$Sub_metering_2 <- as.numeric(as.character(dados$Sub_metering_2))
dados$Sub_metering_3 <- as.numeric(as.character(dados$Sub_metering_3))

# CREATE PLOT WITH ONE LINE (1-black) AND ADD OTHER TWO LINES (2-red, 3-blue)
plot(dados$DateTime, dados$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dados$DateTime, dados$Sub_metering_2, col="red")
lines(dados$DateTime, dados$Sub_metering_3, col="blue")

# ADD A LEGEND AD TOP-RIGHT CORNER
# position = topright
legend("topright",
  legend=c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
	col=c("black","red","blue"),
	lty=c(1,1,1),
	lwd=c(1,1,1))
	
# SAVE TO PNG FILE
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
