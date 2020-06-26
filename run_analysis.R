# Peer Assignment 1
library(dplyr)

getwd()
setwd("C:/Users/ncampono/Desktop/R/Courses/Getting Cleaning Data/R/Getting_Cleaning_Data/Peer_Assignment")


features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merges the training and the test sets to create one data set.

ds.x <- rbind(x_train, x_test)
ds.y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

uci.df <- cbind(subject, ds.x, ds.y)

uci.df

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement


uci.mstd <- uci.df %>% select(subject, code, contains("mean"), contains("std"))

uci.mstd

# Step 3: Uses descriptive activity names to name the activities in the data set

uci.mstd$code<- activities[uci.mstd$code, 2]

uci.mstd$code

# Step 4: Appropriately labels the data set with descriptive variable names.


names(uci.mstd)

names(uci.mstd)[2] = "activity"
names(uci.mstd)<-gsub("Acc", "accelerometer", names(uci.mstd))
names(uci.mstd)<-gsub("Gyro", "gyroscope", names(uci.mstd))
names(uci.mstd)<-gsub("BodyBody", "body", names(uci.mstd))
names(uci.mstd)<-gsub("Mag", "magnitude", names(uci.mstd))
names(uci.mstd)<-gsub("^t", "time", names(uci.mstd))
names(uci.mstd)<-gsub("^f", "frequency", names(uci.mstd))
names(uci.mstd)<-gsub("tBody", "timebody", names(uci.mstd))
names(uci.mstd)<-gsub("-mean()", "mean", names(uci.mstd), ignore.case = TRUE)
names(uci.mstd)<-gsub("-std()", "STD", names(uci.mstd), ignore.case = TRUE)
names(uci.mstd)<-gsub("-freq()", "frequency", names(uci.mstd), ignore.case = TRUE)
names(uci.mstd)<-gsub("angle", "angle", names(uci.mstd))
names(uci.mstd)<-gsub("gravity", "gravity", names(uci.mstd))

names(uci.mstd)


#From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

uci2 <-aggregate(. ~subject + activity, uci.mstd, mean)
uci2<-uci2[order(uci2$subject,uci2$activity),]

uci.final <- uci2 %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

uci.final

str(uci.final)

write.table(uci.final, "uci.final.txt", row.name=FALSE)
