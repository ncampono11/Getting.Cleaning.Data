# Peer Assignment 1


#Download, Read and Convert Data

library(data.table)
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}


features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
train.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
train.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

data.train <-  data.frame(train.subject, train.activity, train.x)
names(data.train) <- c(c('subject', 'activity'), features)

test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
test.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
test.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

data.test <-  data.frame(test.subject, test.activity, test.x)
names(data.test) <- c(c('subject', 'activity'), features)



# Step 1: Merges the training and the test sets to create one data set.

uci <- rbind(data.train, data.test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

mean.std.select <- grep('mean|std', features)
uci.mstd <- uci[,c(1,2,mean.std.select + 2)]

# Step 3: Uses descriptive activity names to name the activities in the data set

activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
uci.mstd$activity <- activity.labels[uci.mstd$activity]

# Step 4: Appropriately labels the data set with descriptive variable names.


name.new <- names(uci.mstd)
name.new <- gsub("[(][)]", "", name.new)
name.new <- gsub("^t", "TimeDomain_", name.new)
name.new <- gsub("^f", "FrequencyDomain_", name.new)
name.new <- gsub("Acc", "Accelerometer", name.new)
name.new <- gsub("Gyro", "Gyroscope", name.new)
name.new <- gsub("Mag", "Magnitude", name.new)
name.new <- gsub("-mean-", "_Mean_", name.new)
name.new <- gsub("-std-", "_StandardDeviation_", name.new)
name.new <- gsub("-", "_", name.new)
names(uci.mstd) <- name.new


#Step 5: From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.


tidy.data <- aggregate(uci.mstd[,3:81], by = list(activity = uci.mstd$activity, subject = uci.mstd$subject),FUN = mean)
write.table(x = tidy.data, file = "tidy_data.txt", row.names = FALSE)





