# Load dataset
esoph

# Subset the esoph data set to obtain only those rows with 0 cancer cases.
esoph[which(esoph$ncases > 0), ]

# Subset the esoph data set on the group with the highest tobacco consumption.
esoph[which(esoph$tobgp == "30+" ), ]

# Now subset the esoph data set on the group with the highest tobacco 
# consumption AND equal to 0 cases.
esoph[which(esoph$tobgp == "30+" & esoph$ncases == 0), ]

# Subset the esoph data set on the group with the lowest tobacco consumption OR 
# the group with the lowest alcohol consumption?
esoph[which(esoph$tobgp == "0-9g/day" | esoph$alcgp == "0-39g/day"), ]

# Subset the esoph data so that you only include rows in which the control group 
# has at least 10 observations.
subset(esoph,ncontrols > 9)

# Can you also subset the data so that you only include rows in which the 
# control group is larger than twice the number of cases?
subset(esoph, ncontrols > 2 * ncases)

# Produce the same answer as in exercise 2.2 but now by using the ! sign in your 
# statement.
subset(esoph, !ncontrols <= 2 * ncases)

# Subset the esoph data set using sequences using the : sign so that you retain 
# only the first four rows and the last two columns.

subset(esoph[c(1:4), c(4:5)])

# Arrive at the same answer as in exercise 3.1 but now by using omission.
subset(esoph[-c(5: 88), -c(1:3)])

# Subset the esoph data set using sequences using the seq() function so that you 
# only have the first four rows and the first, third and fifth column.
subset(esoph[seq(from = 1, to = 4, by = 1), seq(from = 1, to = 5, by = 2)])

# Can you order the esoph data set on the variable age group such that the oldest 
# age groups are shown first?
esoph[order(esoph$agegp, decreasing = TRUE), ]

# Also order the number of cases within the age groups (as in 4.1) from high to 
# low. Note that in order() you are allowed to use multiple columns by adding 
# them as arguments (see ?order).
esoph[order(esoph$agegp, esoph$ncases, decreasing = TRUE), ]

# Let’s return to the esoph data set. Can you use a combination of if and else 
# statements to find out whether the observation in row 6 has more, fewer or the 
# samer number of controls than the observation in row 38? The result must be 
# printed in a message stating that observation 6 has more, fewer or the same 
# number of controls than observation 38.
if(esoph$ncontrols[6] > esoph$ncontrols[38]){
  print("more")
} else if(esoph$ncontrols[6] < esoph$ncontrols[38]){
  print("less")
} else{
  print("same")
} 

# Now store the observation in row 6 as a separate data frame named esoph_obs_6 
# and the observation in row 38 as esoph_obs_38. Assign both data frames a new 
# column called twice_nr_controls with either a yes value if the number of 
# controls is larger than twice the number of cases and a no value if not.
esoph_obs_6 <- data.frame(esoph[6, ])
esoph_obs_38 <- data.frame(esoph[38, ])
if(esoph_obs_6$ncontrols > 2 * esoph_obs_6$ncases){
  esoph_obs_6$twice_nr_controls <- "yes"
} else {
  esoph_obs_6$twice_nr_controls <- "no"
}

if(esoph_obs_38$ncontrols > 2 * esoph_obs_38$ncases){
  esoph_obs_38$twice_nr_controls <- "yes"
} else {
  esoph_obs_38$twice_nr_controls <- "no"
}

esoph_obs_6
esoph_obs_38