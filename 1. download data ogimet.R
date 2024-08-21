
install.packages("remotes")
install.packages("climate")
install.packages("xlsx")


library(climate)
library(remotes)
library(dplyr)


install_github("bczernecki/climate")

#data_meteo = meteo_ogimet(date = c(Sys.Date() - 365, Sys.Date() - 1), 
                          #interval = "daily",
                          #coords = FALSE, 
                          #station = 96805)
#head(data_meteo)


# Set the start and end dates for the desired period (2020-2022)
start_date <- as.Date("1991-01-01")
end_date <- as.Date("1995-12-31")

# Download rainfall data for the specified period
data_meteo <- meteo_ogimet(date = c(start_date, end_date),
                           interval = "daily",
                           coords = FALSE,
                           station = 96805)

# Arrange the data by date in ascending order
data_meteo <- arrange(data_meteo, Date)

# Display the first few rows of the data
head(data_meteo)

#save data
library(openxlsx)
write.xlsx(data_meteo, file = 'data_ogimet1991-1995.xlsx')
write