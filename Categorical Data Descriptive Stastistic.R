# Installing Libraries 

# library(ggplot2): Use for generating visualizations
# library(gridExtra): Use for combine multiple plots side by side.

# For installing library packages
install.packages("ggplot2")
install.packages("gridExtra")

# For loading library
library("ggplot2")
library("gridExtra")

# For needing help
library(help=ggplot2)
library(help=gridExtra)

# Categorical Data Implementation using R

# Create data 
set.seed(10)
gender = sample(c('Female', 'Male'), 380, replace = TRUE)
smoking = sample(c('Past smoker', 'Current smoker', 'Non-smoker'), 380, replace = TRUE)
smoker_data = data.frame(gender = as.factor(gender), smoking = as.factor(smoking))

head(smoker_data,10)

# Calculate count for each combination of categorical variables

#frequency table
table1 = table(smoker_data$gender)
table2 = table(smoker_data$smoking)
print(table1)
print(table2)

# Proportion table provides a representation of the relative frequencies or proportions of different categories within a dataset.

prop.table(table1)
prop.table(table2)

# create bar plot by using ggplot

# Create a data frame for gender
gender_data <- as.data.frame(table(smoker_data$gender))
colnames(gender_data) <- c("gender", "count")
# Create a data frame for smoking
smoking_data <- as.data.frame(table(smoker_data$smoking))
colnames(smoking_data) <- c("smoking", "count")

gender_data
smoking_data


# Visualize the Plots by Gender

# Create the bar plots
p1 <- ggplot(gender_data, aes(x = gender, y = count, fill = gender)) +
  geom_bar(stat = "identity") +
  labs(y = "Number of participants", title = "Distribution by Gender") +
  theme_minimal()
print(p1)

# Visualize plots Distribution by Smoking Status

p2 <- ggplot(smoking_data, aes(x = smoking, y = count, fill = smoking)) +
  geom_bar(stat = "identity") +
  labs(y = "Number of participants", title = "Distribution by Smoking Status") +
  theme_minimal()

p2

# Contingency table
# Contingency tables are very useful to condense a large number of observations into smaller to make it easier to maintain tables. 

table(smoker_data$gender,smoker_data$smoking)

# Marginals
# "marginals" refer to the totals found in the margins of the table.

smoking_table <- table(smoker_data$gender, smoker_data$smoking)
# Create a marginal table
marginal_table <- addmargins(smoking_table)
# Print the marginal table
print(marginal_table)

# from the above table we can get the row wise and column wise marginal distribution:

# Compute the row percentages
row_percentages <- prop.table(smoking_table, 1) * 100
# Compute the column percentages
col_percentages <- prop.table(smoking_table, 2) * 100
print(row_percentages)
print(col_percentages)

# Pie Charts

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Calculate percentages for smoking status by gender
percentage_data <- smoker_data %>%
  group_by(gender, smoking) %>%
  summarise(count = n()) %>%
  group_by(gender) %>%
  mutate(percentage = count / sum(count) * 100)

# Create a pie chart with percentages for smoking status by gender
ggplot(percentage_data, aes(x = "", y = percentage, fill = smoking)) +
  geom_bar(width = 1, stat = "identity", position = "fill") +
  coord_polar("y") +
  geom_text(aes(label = sprintf("%.1f%%", percentage)), 
            position = position_fill(vjust = 0.5), size = 3) +
  labs(title = "Smoking Status Distribution by Gender", fill = "Smoking Status") +
  scale_fill_manual(values = c("Past smoker" = "red", "Current smoker" = "pink",
                               "Non-smoker" = "lightblue")) +
  facet_wrap(~ gender) +
  theme_void()



# Calculate by using External Dataset (Details.csv)

df = read.csv("Details.csv")
head(df)

# Frequency tables

table1 = table(df$Category)
table2 = table(df$Sub.Category)
table3 = table(df$PaymentMode)
print(table1)
print(table2)
print(table3)

# Proportion Table 

print(prop.table(table1))
print(prop.table(table2))
print(prop.table(table3))

# Category wise distribution

# create color vector using rainbow() function
color <- rainbow(7)
barplot(table(df$Category), main = "Category wise distribution",col = color)




# Creating bar plot of category wise sub category

table4 <- table(df$Category, df$Sub.Category)

# Create a color vector
color <- rainbow(nrow(table4))

# Set the rotation for x-axis labels to 45 degrees
par(las=2)

# Create the vertically stacked bar plot
bp <- barplot(table4, main = "Category wise distribution", col = color)

# Add the legend
legend("topright", legend = rownames(table4),cex = 0.9, fill = color)

# Add x-axis labels with a 45 degree angle
axis(1, at=bp, labels=colnames(table4), las=2, cex.axis=1)

# Create Barplot by using Table 3 

barplot(table3,main = " Most use Payment method",col= color)



# Category wise bar plot stacked by payment method

barplot(table(df$PaymentMode, df$Category), 
        main = "Payment method use for each category", col = color)
legend("topright", unique(df$PaymentMode), cex = 0.7 , fill = color)


# Contingency table

table4 <- table(df$Category, df$Sub.Category)
print(table4)

table5 <- table(df$PaymentMode,df$Sub.Category,df$Category)
table5
