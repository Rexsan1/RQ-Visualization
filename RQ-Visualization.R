# Load necessary libraries
library(readr)
library(ggplot2)

# Import the CSV file
StudentsPerformance_data <- read_csv("C:/Users/REX/OneDrive/Desktop/RQ-Visualization/StudentsPerformance_with_headers.csv")

# Inspect the data
head(StudentsPerformance_data)    # Display the first few rows

# Display the first two rows of the dataset in a tab-separated format
write.table(head(StudentsPerformance_data, 2), sep = "\t", row.names = FALSE, quote = FALSE)
