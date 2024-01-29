# Loading Libraries
library(dplyr)
library(tidyverse)

# Loading Data into Script
data = read.csv("data/accidents.csv")
View(data)

# Examine Dataset for Missing Values 
colSums(is.na(data))

# Displays Rows with NA values
View(data[rowSums(is.na(data)) > 0,]) 


# Come across Inconsistency of Numerical Values in Categorical Columns 
View(data %>% select(Road.Surface, X1st.Road.Class))

# Removing Inconsistencies from Road Surface and Road Class
cln1 = data %>% filter(Road.Surface > 5) # '5' was used as the number were all lower
View(cln1)

# Examining Age of Casualty for Outliers
hist(data$Age.of.Casualty)
boxplot(data$Age.of.Casualty)

outliers <- boxplot(data$Age.of.Casualty, plot=FALSE)$out
outliers

# Find the row of the outlines
data[which(data$Age.of.Casualty %in% outliers),]

# Remove outlines
clean_accident <- data[-which(data$Age.of.Casualty %in% outliers),]

# Write Clean Data 
write.csv(clean_accident, "cleaned_data.csv")
