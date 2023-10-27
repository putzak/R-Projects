# Create dataframe
df <- data.frame(var1 = c(7, 6, 6, 5), var2 = c("plot1", "plot2", "plot3", "plot4"), stringsAsFactors = FALSE) 

# Extract second column, 2 options
df$var2
df[,2]

# Create matrix
mtx <- matrix(c(1:15), nrow = 5, ncol = 3, byrow = FALSE)

# Extract r4 c3
mtx[4, 3]

# Create array
arr <- array(c(1:20), dim=c(5, 2, 2))

# Retrieve all elements in the first two rows in the second matrix of the array
arr[c(1:2), ,2]