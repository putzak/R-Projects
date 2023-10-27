# Read iris dataset
read.csv("1.Raw Data/iris.csv")

# Paste Flower
rownames(iris) <- paste("flower", rownames(iris), sep="_")

# Add column
iris$Flower_ID <- rownames(iris)

# Numerical rownames
rownames(iris) <- paste(c(1:150))

# Shorter col. names
colnames(iris)[c(1:4)] <- c("Sepal.L", "Sepal.W", "Petal.L", "Petal.W")

# Replace value in row 10 column 3 with NA
iris[10, 3] <- NA

# Check for NA
any(is.na(iris))

# Only complete cases
iris_nodf <- iris[complete.cases(iris), ]

# Add column with difference in petal and sepal width
iris$Diff.W <- iris$Sepal.W - iris$Petal.W

# Create a new data frame iris_width containing only 
# Flower_ID, Sepal.W, Petal.W and Diff.W.
iris_width <- iris[ , c("Flower_ID", "Sepal.W", "Petal.W", "Diff.W")]

# Create a data frame that includes; 1) the variable Flower_ID with the same 
# values as in the first five entries in the iris_width data set and one missing 
# value, and 2) a new variable Country with six countries of your choice, as 
# (hypothetical) representation of where entries have been observed.
# newrow <- c("flower_6", "NA", 0.2, 3.1)
# ex61_df <- rbind(head(iris_width, newrow))
countries_iris <- data.frame(Flower_ID = c("flower_5", "flower_3", "flower_1", 
                                           "flower_2", "flower_4", NA), 
                             Countries = c("NL", "BE", "DE", "FR", "LU", "DK"))
head_iris <- head(iris_width)
iris_countries_merge <- merge(head_iris, countries_iris)
iris_countries_cbind <- cbind(head_iris, countries_iris)
iris_countries_merge_all <- merge(head_iris, countries_iris, all.x=TRUE)

# Write merge_iris to a csv file in the sub-directory Derived_data in your 
# working directory.
write.csv(iris_countries_merge_all, file = "2.Derived Data/merge.csv", row.names = FALSE)
