# Getting and Cleaning Data Final Project
# This R program creates a tidy data set

# Packages
library(data.table)
library(dplyr)


# Getting activity and features
features <- read.table("./project/features.txt")
activity <- read.table("./project/activity_labels.txt")
activity <- rename(activity, "activity" = V2)

# Extracting variable for final table from features
variables <- as.character(features$V2)

# Retrieving Train data
train_sub <- read.table("./project/train/subject_train.txt")
trainX <- read.table("./project/train/X_train.txt")
trainy <- read.table("./project/train/y_train.txt")

# Retrieving Test data
test_sub <- read.table("./project/test/subject_test.txt")
testX <- read.table("./project/test/X_test.txt")
testy <- read.table("./project/test/y_test.txt")

# Combining TRAIN data tables
train_combined <- cbind(train_sub, trainX, trainy)
names(train_combined) <- c(1:563) 

# Combining TEST daata tables
test_combined <- cbind(test_sub, testX, testy)
names(test_combined) <- c(1:563)

# Combining both TRAIN and TEST datasets
test_train_combined <- rbind(train_combined, test_combined)

# Renaming data set with descriptive label names
names(test_train_combined)[2:562] <- variables
names(test_train_combined)[c(1,563)] <- c("subject", "label")

# Extracting measurements of MEAN and STANDARD DEVIATION
required_variables <- grep("\\bmean()\\b|\\bstd()\\b", names(test_train_combined))
mean_std_data <- select(test_train_combined, subject, label, c(all_of(required_variables)))

# Using descriptive activity names to name the activities in the data set
activities_named <- merge(mean_std_data, activity, by.x = "label", by.y = "V1", sort = FALSE)
final_form <- select(activities_named, -label)

#Creating new tidy data
new_table <- aggregate(final_form[, 2:67], list(Activity = final_form$activity, Subject = final_form$subject), mean)
