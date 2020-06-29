# Getting.Cleaning.Data

# Course Project

The run_analysis.R script performs the data preparation and takes you step by step through the 5 questions asked for the project.

First I unzipped the data into my working directory. Then proceeded to follow the steps to complete the project.

# Step 1: Merge the training and the test sets to create one data set.

I completed this by rbinding the test and train datasets for data.train and data.test
I called my new merged data set uci

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement

I completed this step by searching the subject and code for mean or std.

# Step 3: Use descriptive activity names to name the activities in the data set

I renamed the code to activities in the data set.

# Step 4: Appropriately labels the data set with descriptive variable names.

I chose appropriate names to rename the activiies in the data set.

# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.

Grouping by subject and activity I applied the mean to all.
Once stored in the varaible tidy.data I wrote this dataset to my working directory
