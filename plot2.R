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

#Create The Plot
with(
  household_data,
  plot(date_time, Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power (kilowatts)")
)

#Copy to PNG
dev.copy(png, "./plot2.png", height = 480, width = 480)
dev.off()
