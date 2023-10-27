# Create vectors
trees_heights <- c(6, 8, 7)
trees_names <- c("berch", "oak", "berch")

# Check datatype
class(trees_heights)
class(trees_names)

# Create data frame
trees_df <- data.frame(trees_heights, trees_names)

# Create list
trees_list <- list(v1 = trees_names, v2 = trees_heights, df = trees_df)

trees_list