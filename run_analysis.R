setwd ("C:/Users/avinash/Documents/UCI HAR Dataset")
features_list <- read.table ("features.txt")
setwd ("C:/Users/avinash/Documents/UCI HAR Dataset/test")
test_features <- read.table ("X_test.txt")
test_subjects <- read.table ("subject_test.txt")
test_activities <- read.table ("y_test.txt")
setwd ("C:/Users/avinash/Documents/UCI HAR Dataset/train")
train_features <- read.table ("X_train.txt")
train_subjects <- read.table ("subject_train.txt")
train_activities <- read.table ("y_train.txt")
str (features_list)
str (test_features)
str (test_subjects)
str (test_activities)
str (train_features)
str (train_subjects)
str (train_activities)

## merging the test and train data sets
merged_data <- rbind (test_features, train_features)
colnames(merged_data) <- features_list[,2]
str (merged_data)

## extracting the mean and standard deviation parameters from the merged data
extract_features <- grep (".*mean.*|.*std.*",features_list [,2])
str (extract_features)
extract_data <- merged_data [, extract_features]
str (extract_data)

## noting the activities for test and train data sets
activities_list <- rbind (test_activities, train_activities)
colnames(activities_list) <- c("activity")
str (activities_list)
activities_list$activity <- as.factor(activities_list$activity)
levels(activities_list$activity) <- c ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
str (activities_list)

## noting the subjects for test and train data sets
subjects_list <- rbind (test_subjects, train_subjects)
colnames (subjects_list) <- c ("subject")
str (subjects_list)

## forming the data set with all necessary features against respective activity donee by a subject
all_data <- cbind (extract_data, activities_list, subjects_list)
str (all_data)

## second data set with average of each variable for each activity and each subject
library (reshape2)
melt_all_data <- melt (all_data, id = c("activity", "subject"))
str (melt_all_data)
cast_melt_all_data <- dcast (melt_all_data, activity + subject ~ variable, mean)
str (cast_melt_all_data)
View (cast_melt_all_data)
colnames(cast_melt_all_data) <- gsub("-","", colnames(cast_melt_all_data))
colnames(cast_melt_all_data) <- gsub("mean","Mean", colnames(cast_melt_all_data))
colnames(cast_melt_all_data) <- gsub("std","Std", colnames(cast_melt_all_data))
colnames (cast_melt_all_data)
write.table(cast_melt_all_data, "project.txt", col.names = FALSE, row.names = FALSE)