#### Preamble ####
# Purpose: Downloads and saves data from the OpenDataToronto portal
# Author: Kelly Lyu
# Date: 25 January 2024
# Contact: kelly.lyu@mail.utoronto.ca
# Pre-requisites: None
# Datasets:
  # Reported crime information from https://open.toronto.ca/dataset/police-annual-statistical-report-reported-crimes/

#### Workspace setup ####
install.packages("opendatatoronto") # For getting data
library(opendatatoronto)
install.packages("tidyverse") # For visualize data
library(tidyverse)

# Get police annual statistics report package
package <- show_package("police-annual-statistical-report-reported-crimes")

# Load the reported crimes data
resources <- 
  list_package_resources("police-annual-statistical-report-reported-crimes") %>%
  filter(name == "Reported Crimes.csv") %>%
  get_resource()

# Save data
write_csv(x = resources, file = "Reported Crimes.csv")

# Display the head of the dataset
head(resources)

