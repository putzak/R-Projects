# Create vector
v <- c(1, 1, 1, 2, 2, 3, 3, 3)

# Create list
lst <- list(v, df, arr)

# Use two ways to retrieve the element in the third row and first column of 
# the data frame df in list lst.
lst[[2]][3,1]
lst[[2]]$var1[3]

# Convert the first list component in list lst back to a vector.
unlisted_vec <- unlist(lst[[1]])
unlisted_vec

lst
