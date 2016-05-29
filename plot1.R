# LOAD DATA
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dados <- read.table("household_power_consumption.txt", sep=";", header=T)
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados = subset(dados, Date == "2007-02-01" | Date == "2007-02-02")

# CONVERT DATA TYPES
# To generate a histogram of a data column, the data type must be 'nuneric'
dados$Global_active_power <- as.numeric(as.character(dados$Global_active_power))

# GENERATE HISTOGRAM
# color (col) = red
# title (main) = "Global Active Power"
# X axis label (xlab) = "Global Active Power (kilowatts)"
hist(dados$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# SAVE TO PNG FILE
# save to a PNG file with a width of 480 pixes and height of 480 pixels
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
