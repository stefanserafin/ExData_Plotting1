library("dplyr")

###
#
# Column description of data set
#
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

column_headers <- c("Date", "Time", "GlobalActivePower", "Global_reactive_power",
                    "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering1", "SubMetering1")

# My computer is fast and has enough memory, but it's annoying to reload
# the data over and over when it is already known - well, yes I could load
# data in a smarter way.... next time... for now, back to plotting stuff :)
if(!exists("all_raw_data"))
{
  all_raw_data <- read.csv2("./household_power_consumption.txt", col.names = column_headers, header = TRUE, na.strings = "?")  
}

all_raw_data$Date <- as.Date(all_raw_data$Date, "%d/%m/%Y")

numeric_columns <- c(3:9)
all_raw_data[numeric_columns] <- sapply(all_raw_data[numeric_columns], as.numeric)

start_date <- as.Date("01/02/2007", "%d/%m/%Y")
end_date <- as.Date("02/02/2007", "%d/%m/%Y")

data_set <- all_raw_data %>% filter(between(Date, start_date, end_date))

subset(select)

str(all_raw_data)
