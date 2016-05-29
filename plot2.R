# LOAD DATA
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dados <- read.table("household_power_consumption.txt", sep=";", header=T)
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados = subset(dados, Date == "2007-02-01" | Date == "2007-02-02")
