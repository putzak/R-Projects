# Create vectors
A <- c(1,3,5,7,9,11)
B <- c(FALSE, TRUE)

# Convert vector B to numeric
B_num <- as.numeric(B)

# Add A to B_num
X <- A + B_num

# Convert X to logical object
as.logical(X)

# Print
X
# All numbers not equal to 0 are converted to TRUE (only 0s will be converted to FALSE)
 