# LOAD DATA
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dados <- read.table("household_power_consumption.txt", sep=";", header=T)
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados = subset(dados, Date == "2007-02-01" | Date == "2007-02-02")

# CONVERT DATA TYPES
# To generate a histogram of a data column, the data type must be 'nuneric'
dados$Global_active_power <- as.numeric(as.character(dados$Global_active_power))

# CREATE NEW COLUMN DATETIME (FORMAT DD/MM/YYYY HH:MM:SS)
# concatenates Date (format DD/MM/YYYY) and time (format HH:MM:SS) in a third independent column
dados["DateTime"] <- paste(dados$Date, dados$Time)
dados$DateTime <- strptime(dados$DateTime, format="%Y-%m-%d %H:%M:%S", tz="")

# GENERATE PLOT
# type (type) = lines ("l")
# Y axis label (ylab) = "Global Active Power (kilowatts)"
# X axis label (xlab) = none (blank)
plot(dados$DateTime, dados$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# SAVE TO PNG FILE
# save to a PNG file with a width of 480 pixes and height of 480 pixels
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
