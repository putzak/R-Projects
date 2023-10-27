# Set your working directory to the folder ‘LU4’.
setwd("~/R/Studie/LU4")

# Load the file IUCN_species.csv into R. Name it IUCN_species.
IUCN_species <- read.csv("1.Raw Data/IUCN_species.csv")

# What is the data structure of the loaded data set and what are its dimensions?
str(IUCN_species)
class(IUCN_species) # str() also gives the class, bit redundant

# Make a subset IUCN_mammals with only data from species that belong to the 
# class ‘MAMMALIA’.
IUCN_mammals <- subset(IUCN_species, class_name == "MAMMALIA")
# Option 2 : IUCN_mammals <- IUCN_species[which(IUCN_species$class_name == 
# "MAMMALIA"), ]

# Make a subset IUCN_arthropods_LC with data from species that belong to the 
# phylum ‘ARTHROPODA’ and are classified as least concern (‘LC’ in the column 
# named ‘category’).
IUCN_arthropods_LC <- subset(
    IUCN_species, phylum_name == "ARTHROPODA" & category == "LC")

# Now make a subset IUCN_primates with data from species of the order ‘PRIMATES’ 
# that do not belong to the family ‘LEMURIDAE’.
IUCN_primates <- subset(
    IUCN_species, order_name == "PRIMATES" & family_name != "LEMURIDAE"
)

# Save IUCN_primates as a csv file in the folder ‘Derived_data’.
write.csv(IUCN_primates, file = "2.Derived Data/IUCN_primates.csv")

# Make a subset IUCN_subset_Ga_Bi_In_Ma with data from species that belong to 
# the classes ‘GASTROPODA’, ‘BIVALVIA’, ‘INSECTA’ and ‘MALACOSTRACA’.
IUCN_subset_Ga_Bi_In_Ma <- subset(
    IUCN_species, 
        class_name == "GASTROPODA" |
        class_name == "BIVALVIA" |
        class_name == "INSECTA" |
        class_name == "MALACOSTRACA"
)

# Combine the data sets IUCN_primates and IUCN_subset_Ga_Bi_In_Ma into one data 
# frame IUCN_subset_Ga_Bi_In_Ma_Pr.
IUCN_subset_Ga_Bi_In_Ma_Pr <- rbind(IUCN_subset_Ga_Bi_In_Ma, IUCN_primates)

# Now remove every 10th row in IUCN_subset_Ga_Bi_In_Ma_Pr (i.e. row 10, 20, etc) 
# and every third column (i.e. column 3, 6, etc.). Name it IUCN_subset_removed.
nrows <- nrow(IUCN_subset_Ga_Bi_In_Ma_Pr)
ncols <- ncol(IUCN_subset_Ga_Bi_In_Ma_Pr)
IUCN_subset_removed <- IUCN_subset_Ga_Bi_In_Ma_Pr[
    -seq(from = 10, to = nrows, by = 10),
    -seq(from = 3, to = ncols, by = 3)
    ]

# Remove the data frames produced in questions 6 (IUCN_primates), 8 
# (IUCN_subset_Ga_Bi_In_Ma) and 9 (IUCN_subset_Ga_Bi_In_Ma_Pr) from the 
# workspace.
rm(IUCN_primates, IUCN_subset_Ga_Bi_In_Ma, IUCN_subset_Ga_Bi_In_Ma_Pr)

# Order the entire IUCN data of the species alphabetically, based on the column 
# ‘order_name’. Call it IUCN_species_ordered.
IUCN_species_ordered <- IUCN_species[order(IUCN_species$order_name), ]

# Add a column to IUCN_mammals named ‘flying’ which indicates whether the mammal 
# species can fly or not. Tip: only species that occur in the order ‘Chiroptera’ 
# are able to fly.
IUCN_mammals$flying <- "no"
IUCN_mammals$flying[which(IUCN_mammals$order_name == "CHIROPTERA")] <- "yes"

# Change the names of the columns ‘kingdom_name’, ‘phylum_name’, ‘class_name’, 
# ‘order_name’, ‘family_name’ and ‘genus_name’ in IUCN_species to ‘kingdom’, 
# ‘phylum’, ‘class’, ‘order’, ‘family’ and ‘genus’.
colnames(IUCN_species)[c(2:7)] <- c(
    "kingdom", 
    "phylum",
    "class",
    "order",
    "family",
    "genus"
    )

# Add a column ‘reproduction’ to IUCN_mammals that indicates whether the species 
# is a monotreme, marsupial or placental mammal. Tip: species from the order 
# ‘MONOTREMATA’ belong to the monotremes, species from the orders 
# ‘DASYUROMORPHIA’, ‘DIDELPHIMORPHIA’, ‘DIPROTODONTIA’, ‘MICROBIOTHERIA’, 
# ‘NOTORYCTEMORPHIA’, ‘PAUCITUBERCULATA’ and ‘PERAMELEMORPHIA’ belong to the 
# marsupials, and all other species are placentals.
IUCN_mammals$reproduction <- 