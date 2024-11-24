# Load necessary libraries
library(readr)
library(ggplot2)

# Import the CSV file
StudentsPerformance_data <- read_csv("C:/Users/REX/OneDrive/Desktop/RQ-Visualization/StudentsPerformance_with_headers.csv")

# Inspect the data
head(StudentsPerformance_data)    # Display the first few rows

# Display the first two rows of the dataset in a tab-separated format
write.table(head(StudentsPerformance_data, 2), sep = "\t", row.names = FALSE, quote = FALSE)
# Summary statistics and structure of the dataset
summary(StudentsPerformance_data)  # Summary statistics
str(StudentsPerformance_data)      # Structure of the dataset

# Checking for normality of GRADE
# Histogram
ggplot(StudentsPerformance_data, aes(x = GRADE)) +
  geom_histogram(binwidth = 1, color = "black", fill = "skyblue") +
  ggtitle("Distribution of GRADE") +
  xlab("GRADE") +
  ylab("Frequency")

shapiro_test <- shapiro.test(StudentsPerformance_data$GRADE)
shapiro_test

# Histogram with a smooth bell curve overlay
ggplot(StudentsPerformance_data, aes(x = GRADE)) +
  geom_histogram(aes(y = ..density..), binwidth = 1, color = "black", fill = "skyblue") +
  stat_function(fun = dnorm, 
                args = list(mean = mean(StudentsPerformance_data$GRADE), 
                            sd = sd(StudentsPerformance_data$GRADE)), 
                color = "red", size = 1) +
  ggtitle("Histogram of GRADE with Bell Curve Overlay") +
  xlab("GRADE") +
  ylab("Density")

#Scatter Plot of Weekly Study Hours vs. Grade
ggplot(StudentsPerformance_data, aes(x = Weekly study hours, y = GRADE)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ggtitle("Scatter Plot of Weekly Study Hours vs. Grade") +
  xlab("Weekly Study Hours") +
  ylab("Grade")
