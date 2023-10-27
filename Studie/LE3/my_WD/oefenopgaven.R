# Create a vector that consists of the numbers 5, 6, 7 and 8.
vec_1 <- c(5:8)

# Save this vector to a .RData file in a directory of your choice (e.g. a ‘Raw_data’ folder).
save(vec_1, file = "1.Raw Data/vec.RData")

# Change the first entry of the vector to 4.
vec_1[1] <- 4



# Load the data set CO2 and inspect the first six rows.
data("CO2")
head(CO2)

# Remove the duplicates in the data set. Name the resulting data frame CO2_no_dupl.
CO2_no_dupl <- unique(CO2)

# No duplicates
rm(CO2_no_dupl)

# Are there missing values in CO2?
any(is.na(CO2))

# Here, we are working with the Nile data set and the nhtemp data set. Load both 
# data sets. What happens if you apply the merge() function to merge the two data 
# sets? What happens if you apply the cbind() function?
data("Nile")
data("nhtemp")
ni_nh_merge <- merge(Nile, nhtemp)
ni_nh_cbind <- cbind(Nile, nhtemp)

# Remove all incomplete cases from the output of cbind() as in exercise 2.1.
nile_complete <- ni_nh_cbind[complete.cases(ni_nh_cbind), ]
nile_complete2 <- cbind(Nile, nhtemp)
nile_complete2 <- nile_complete2[complete.cases(nile_complete2), ]

# Appropriate column names are key to ensure others can understand what you did. 
# Rename the columns so that it is clear what is measured and in which unit.
colnames(nile_complete) <- c("Annual flow [10^8 m^3]", "Mean annual temperature [F]")

# Ensure that the row names correspond to the year of measurement.
rownames(nile_complete) <- c(1912:1970)

# Generate a vector consisting of numbers from 1 to 1000000. Then write the 
# vector to a .csv file and to a .rds file and compare the time this takes for 
# each method. Is there a difference?
vec_2 <- c(1:1000000)
timecsv1 <- proc.time()
write.csv(vec_2, file = "1.Raw Data/vec_2.csv")
timecsv2 <- proc.time()
timerds1 <- proc.time()
saveRDS(vec_2, file = "1.Raw Data/vec_2.rds")
timerds2 <- proc.time()

timescv <- timecsv2 - timecsv1
timerds <- timerds2 - timerds1

# print(timerds)
# print(timescv)

# Now read the files that you created in exercise 3.4 and, again, compare the time 
# this takes for each method.
timereadcsv1 <- proc.time()
read.csv("1.Raw Data/vec_2.csv")
timereadcsv2 <- proc.time()
timereadrds1 <- proc.time()
readRDS("1.Raw Data/vec_2.rds")
timereadrds2 <- proc.time()

timereadcsv <- timereadcsv2 - timereadcsv1
timereadrds <- timereadrds2 - timereadrds1

print(timereadrds)
print(timereadcsv)






