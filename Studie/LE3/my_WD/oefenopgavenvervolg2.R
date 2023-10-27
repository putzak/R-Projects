# In this exercise, we will use the airquality data set. This data set contains 
# information on daily air quality measurements in New York in 1973. Load the 
# data set and check, for each variable, the number of missing values.
data("airquality")
# sum(is.na(airquality$Ozone))
# sum(is.na(airquality$Solar.R))
# sum(is.na(airquality$Wind))
# sum(is.na(airquality$Temp))
# sum(is.na(airquality$Month))
# sum(is.na(airquality$Day))
sum(is.na(airquality[1]))
sum(is.na(airquality[2]))
sum(is.na(airquality[3]))
sum(is.na(airquality[4]))
sum(is.na(airquality[5]))
sum(is.na(airquality[6]))

# We want to get rid of the missing values. Remove all incomplete data points. 
# What could be an alternative to this strategy?
complete_air <- airquality[complete.cases(airquality), ]
complete_air2 <- airquality[complete.cases(airquality[2:6]), ] # NA ozone not rm

# Now use this data frame (obtained in exercise 5.2) to calculate the mean 
# values for the first four columns. Also create new columns that hold the 
# difference between the mean value of each column and the specific values of 
# the corresponding variable.
meanoz <- mean(complete_air$Ozone)
meansol <- mean(complete_air$Solar.R)
meanwin <- mean(complete_air$Wind)
meantem <- mean(complete_air$Temp)

complete_air$OzoneDelta <- round(complete_air$Ozone - meanoz, 1)
complete_air$SolarDelta <- round(complete_air$Solar.R - meansol, 1)
complete_air$WindDelta <- round(complete_air$Wind - meanwin, 1)
complete_air$TempDelta <- round(complete_air$Temp - meantem, 1)

complete_air <- complete_air[, c(5, 6, 1, 7, 2, 8, 3, 9, 4, 10)] # rearrange

# Save the data frame as a .csv file in a directory of your choice (e.g. a 
# folder ‘Derived_data’) and clean the workspace.
write.csv(complete_air, file=("2.Derived Data/AirQuality.csv"))

