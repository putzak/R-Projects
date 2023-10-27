# In this exercise, we will compare the BMI of a group of women and a group of 
# men. We have ten test subjects, with the first five being women and the second 
# five being men. Create a data frame containing one column ‘subjectID’ ranging 
# from one till ten and one column ‘gender’ with a F for the first five entries 
# and a M for the last five entries.
sub_vec <- c(1:10)
gender_vec <- c("F", "F", "F", "F", "F", "M", "M", "M", "M", "M")
BMI_df <- data.frame(Subjects = sub_vec, Gender = gender_vec)

# We further have measured the body size and the weight of the ten test subjects. 
# The sizes (in cm) are: 165, 160, 175, 167, 172, 182, 170, 185, 188, 195. And 
# the weights (in kg) are: 60, 51, 64, 62, 75, 75, 71, 73, 85, 92. Create a 
# second data frame containing again a column ‘subjectID’ ranging from one till 
# ten and the body size and weights measurements.
sizes_vec = c(165, 160, 175, 167, 172, 182, 170, 185, 188, 195)
kg_vec = c(60, 51, 64, 62, 75, 75, 71, 73, 85, 92)
sizes_kg_df = data.frame(sub_vec, sizes_vec, kg_vec)
colnames(sizes_kg_df) <- c("Subjects", "Height", "Weight")

# Calculate the body mass index as an additional column in the second data 
# frame. It is equal to the weight of the person (in kg) divided by the square 
# of the body size (in m).
bmi_vec = kg_vec / (sizes_vec/100)^2
BMI2_df$BMI <- bmi_vec

# Merge the two data sets together. Calculate the average body mass index of the 
# women and of the men.
meanF <- mean(BMI2_df$BMI[c(1:5)])
meanM <- mean(BMI2_df[,"BMI"][c(6:10)])
