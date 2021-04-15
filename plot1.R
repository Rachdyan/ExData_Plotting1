
#Read the .txt table
household_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert Household Data Date to class Date
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

#Subset the dataset from the dates 2007-02-01 and 2007-02-02
household_data_subset <- subset(household_data, Date >= "2007-02-01" & Date <= "2007-02-02")
 
#Create the Histogram
household_data_subset
hist(
  household_data_subset$Global_active_power, 
  col = "red", 
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
  )

#Copy to png
dev.copy(png, "./plot1.png")
dev.off()
