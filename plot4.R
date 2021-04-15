#Read the .txt table
household_data_full<- read.table(
  "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"
)

#Convert Household Data Date to class Date
household_data_full$Date <- as.Date(household_data_full$Date, format = "%d/%m/%Y")

#Subset the dataset from the dates 2007-02-01 and 2007-02-02
household_data <- subset(household_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Combine Date and Time
date_time <- paste(household_data_subset$Date, household_data_subset$Time)
household_data$date_time <- as.POSIXct(date_time) 

#Set the graphic device to display 4 plot
par(mfrow = c(2,2), mar = c(2,4,2,2))

#Create The topleft plot
with(
  household_data,
  plot(date_time, Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power")
)

#Create The topright plot
with(
  household_data,
  plot(date_time, Voltage, type = "l",
       xlab = "", ylab = "Global Voltage Power")
)

#Create the bottomleft plot
with(
  household_data,
  plot(date_time, Sub_metering_1, type = "n",
       xlab = "", ylab = "Energy sub metering")
)

with(
  household_data,
  points(date_time, Sub_metering_1, type = "l", col = "black")
)

with(
  household_data,
  points(date_time, Sub_metering_2, type = "l", col = "red")
)

with(
  household_data,
  points(date_time, Sub_metering_3, type = "l", col = "blue")
)

legend(
  "topright", 
  legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1, 
  cex = 0.6
)

#Create the bottomright plot
with(
  household_data,
  plot(date_time, Global_reactive_power, type = "l",
       xlab = "", ylab = "Global Reactive Power")
)

#Copy to PNG
dev.copy(png, "./plot4.png", height = 480, width = 480)
dev.off()
