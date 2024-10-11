# Load necessary libraries
library(dplyr)

# Set the working directory to where your dataset is located
setwd("C:/Users/Hussam/OneDrive/Documents/R Projects/Courses/final_project/UCI HAR Dataset")

# Step 1: Merge the training and the test sets to create one data set
# Load the data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Combine training and test sets
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# Subset the data
X_data <- X_data[, mean_std_features]
names(X_data) <- features[mean_std_features, 2]

# Step 3: Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
y_data[, 1] <- activity_labels[y_data[, 1], 2]
names(y_data) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names
names(subject_data) <- "subject"
complete_data <- cbind(subject_data, y_data, X_data)

# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- complete_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Print a message indicating completion
print("Tidy data created and saved as tidy_data.txt")
