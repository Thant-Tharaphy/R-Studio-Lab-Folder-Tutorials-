install.packages(c("dplyr","ggplot2","tidyverse"))

library(dplyr)
library(tidyverse)
library(ggplot2)


#Loading Dataset 

churn_data <- read.csv("Telcom-Customer-Churn.csv")
head(churn_data)

# Performing Exploratory Data Analysis (EDA)

# Checking for Missing values

mis_val <- (colSums(is.na(churn_data)))
print("Missing Values in All columns")
print(mis_val)

print("Dimesnions of the dataset")
print(dim(churn_data))


# Checking the summary of the data

summary(churn_data)


# Performing Data Visualization

# Churn Distribution By piechart 

# geom_bar() is used to create a bar chart and 
# coord_polar() transforms the bar chart into a pie chart.
# geom_text() adds the percentage labels to the chart.

churn_df <- as.data.frame(table(churn_data$Churn))
colnames(churn_df) <- c("Churn", "Count")

ggplot(churn_df, aes(x = "", y = Count, fill = Churn)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  geom_text(
    aes(label = scales::percent(Count / sum(Count))),
    position = position_stack(vjust = 0.5)
  ) +
  ggtitle("Churn Distribution") +
  theme_void()


# Churn Distribution of Contract Status

ggplot(churn_data, aes(x = Churn, fill = Contract)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn Distribution w.r.t Contract Status", x = "Churn") +
  theme_minimal()


# Churn Distribution of Tenure

ggplot(churn_data, aes(x = tenure, fill = Churn)) +
  geom_bar(position = "dodge",width = 2,colour="black") +
  labs(title = "Churn Distribution w.r.t Tenure", x = "Months", y = "Count") +
  theme_minimal()


# Churn Distribution of Internet Services

ggplot(churn_data, aes(x = InternetService, fill = Churn)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn Distribution w.r.t Internet Services", x = "Internet Service") +
  theme_minimal()


# Churn Based on Senior Citizen Status

senior_data <- data.frame(
  SeniorCitizen = c("No", "Yes"),
  Count = c(6932, 1539)
)

ggplot(senior_data, aes(x = SeniorCitizen, y = Count, fill = SeniorCitizen)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Senior Citizen Status", x = "Senior Citizen", y = "Count") +
  scale_fill_manual(values = c("No" = "#66B3FF", "Yes" = "#FF9999"))


# Churn Based on Payment Method

payment_data <- data.frame(
  PaymentMethod = c("Bank transfer (automatic)", "Credit card (automatic)",
                    "Electronic check", "Mailed check"),
  Count = c(1542, 1521, 2365, 1604)
)

ggplot(payment_data, aes(x = PaymentMethod, y = Count, fill = PaymentMethod)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Payment Method Distribution", x = "Payment Method", y = "Count") +
  scale_fill_brewer(palette = "Set3")


