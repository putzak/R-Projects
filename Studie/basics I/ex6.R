# r=ln(R0).qt.γ.m−k

# Create vector with body masses
m <- c(1:100)

# Set parameter values
R0 <- 4.5
qt <- 4.9
γ <- 0.27
k <- 0.25

# Calcuate rates of increase from body mass values
r <- log(R0)*qt*γ*m^-k

# Calculate mean rate of increase across body mass values
mean(r)