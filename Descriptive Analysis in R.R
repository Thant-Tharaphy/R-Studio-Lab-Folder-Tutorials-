# Import your data into R:

# Import the data using read.csv()
myData = read.csv("CardioGoodFitness.csv",
                  stringsAsFactors = F)
# Print the first 6 rows
print(head(myData))


# Histogram of Age Distribution 

library(ggplot2)
ggplot(myData, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "red", alpha = 0.8) +
  labs(title = "Age Distribution", x = "Age", y = "Frequency")

# Boxplot of Miles by Gender

ggplot(myData, aes(x = Gender, y = Miles, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Miles Distribution by Gender", x = "Gender", y = "Miles") +
  theme_minimal()

# Bar Chart of Education Levels

ggplot(myData, aes(x = factor(Education), fill = factor(Education))) +
  geom_bar() +
  labs(title = "Education Distribution", x = "Education Level", y = "Count") +
  theme_minimal()



# Measure of Central Tendency 

# Compute the mean value
mean = mean(myData$Age)
print(mean)

# Compute the median value
median = median(myData$Age)
print(median)

# Import the library
install.packages("modeest")
library(modeest)
# Compute the mode value
mode = mfv(myData$Age)
print(mode)


# Calculate Range 

# Range = Largest data value - smallest data value 

# Calculate the maximum
max = max(myData$Age)
# Calculate the minimum
min = min(myData$Age)
# Calculate the range
range = max - min

cat("Range is:\n")
print(range)

# Alternate method to get min and max
r = range(myData$Age)
print(r)


# Variance 
# Variance is an average squared deviation from the mean

# Calculating variance
variance = var(myData$Age)
print(variance)

# Standard Deviation 
# It is defined as the square root of the variance.

# Calculating Standard deviation
std = sd(myData$Age)
print(std)

# Quartiles 

# Calculating Quartiles
quartiles = quantile(myData$Age)
print(quartiles)


# Interquartile Range 
# IQR = Q3 – Q1

# Calculating IQR
IQR = IQR(myData$Age)
print(IQR)

# Summary of single Variable 

# Calculating summary
summary = summary(myData$Age)
print(summary)

# Symmary of Dataframe

# Calculating summary
summary = summary(myData)
print(summary)

