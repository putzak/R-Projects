# Data input
weight <- c(60, 80, 76, 72, 95)
people <- c('Mary', 'John', 'Tim', 'Tracy', 'Ben')
height <- c(160, 182, 183, 175, 201)
eyecolors <- c('blue', 'brown', 'brown', 'green', 'grey')

# Create a matrix that includes the weights, heights and eye colors from the data above.
mat_1 <- matrix(c(weight, height, eyecolors), nrow = 5, ncol = 3)

# Name rows and columns
rownames(mat_1) <- people
colnames(mat_1) <- c("Weight", "Height", "Eyecolors")

# Convert mat_1 to a dataframe
mat_1_df <- as.data.frame(mat_1, stringsAsFactors = FALSE)
mat_1_df$Weight <- as.numeric(mat_1_df$Weight)
mat_1_df$Height <- as.numeric(mat_1_df$Height)

# Print
mat_1_df

# Extract the weight and eye color of Tim, Tracy and Ben.
mat_1_df[c(3:5), c(1, 3)]

# Average weight
mean(mat_1_df[, 2])
2