#### Preamble ####
# Purpose: Simulate the Reported Crime Dataset
# Author: Kelly Lyu
# Date: 25 January 2024
# Contact: kelly.lyu@mail.utoronto.ca
# Pre-requisites: None

#### Data expectations ####
# Expect different types of crimes, such as theft, assault, and fraud.
# Expect different police divisions of crimes reported.
# Columns: crime police division, crime type, crime count, cleared count, unsolved crime, rate of clearance

# Set seed for reproducibility
set.seed(467)

# Define years, crime types, and police divisions
years <- 2000:2022
crime_types <- c("Impaired Driving (DUI)", "Theft", "Fail to Comply with Order",
                 "Common Assault", "Breach of Probation", "Major Assault",
                 "Uttering Threats", "Drug Possession", "Mischief", "Fraud")
police_divisions <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33",
                      "D41", "D42", "D43", "D51", "D52", "D53", "D54", "D55")

# Initialize an empty data frame called simulated_data
simulated_data <- data.frame()

# Simulate crime count, cleared count, unsolved crime, clearance rate, police division, and crime type
for (year in years) {
  for (i in 1:100) {
    crime_count <- sample(0:1500, 1)
    cleared_crime <- sample(0:crime_count, 1)
    unsolved_crime <- crime_count - cleared_crime
    rate_of_clearance <- runif(1, min = 0, max = 1)
    police_division <- sample(police_divisions, 1)
    crime_type <- sample(crime_types, 1)
    
    # Append to the data frame
    simulated_data <- rbind(simulated_data, 
                            data.frame(year = year,
                                       crime_count = crime_count,
                                       cleared_crime = cleared_crime,
                                       rate_of_clearance = rate_of_clearance,
                                       unsolved_crime = unsolved_crime,
                                       police_division = police_division,
                                       crime_type = crime_type))
  }
}

# Viewing the first six rows of the simulated data
head(simulated_data)

