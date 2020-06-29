

## Assign Data Variables
 features <- features.txt : 561 rows, 2 columns <br/>
  -The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. <br/>
  -activities <- activity_labels.txt : 6 rows, 2 columns <br/>
  -List of activities performed when the corresponding measurements were taken and its codes (labels) <br/>
  -subject_test <- test/subject_test.txt : 2947 rows, 1 column <br/>
  -contains test data of 9/30 volunteer test subjects being observed <br/>
  -x_test <- test/X_test.txt : 2947 rows, 561 columns <br/>
  -contains recorded features test data <br/>
  -y_test <- test/y_test.txt : 2947 rows, 1 columns <br/>
  -contains test data of activities’code labels <br/>
  -subject_train <- test/subject_train.txt : 7352 rows, 1 column <br/>
  -contains train data of 21/30 volunteer subjects being observed <br/>
  -x_train <- test/X_train.txt : 7352 rows, 561 columns <br/> 
  -contains recorded features train data <br/> 
  -y_train <- test/y_train.txt : 7352 rows, 1 columns <br/>
  -contains train data of activities’code labels <br/>


## Merges the training and the test sets to create one data set
ds.x (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function <br/>
ds.y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function <br/>
subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function <br/>
uci.df (10299 rows, 563 column) is created by merging subject, ds.x and ds.y using cbind() function <br/>

Extracts only the measurements on the mean and standard deviation for each measurement <br/>
uci.mstd (10299 rows, 88 columns) is created by subsetting uci.df, 
selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement <br/>

## Appropriately labels the data set with descriptive variable names
code column in uci.mstd renamed into activities <br/>
All Acc in column’s name replaced by Accelerometer <br/>
All Gyro in column’s name replaced by Gyroscope <br/>
All BodyBody in column’s name replaced by Body <br/>
All Mag in column’s name replaced by Magnitude  <br/>
All start with character f in column’s name replaced by Frequency <br/>
All start with character t in column’s name replaced by Time <br/>

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject <br/>
uci.final (180 rows, 88 columns) <br/>
is created by sumarizing uci.mstd taking the means of each variable for each activity and each subject, after groupped by subject and activity.<br/>
Export uci.final into FinalData.txt file.<br/>



## Measurements
The variabels have calculatd means and standard deviations for this set of data of data:

activity	
subject	
TimeDomain_BodyAccelerometer_Mean_X	
TimeDomain_BodyAccelerometer_Mean_Y	
TimeDomain_BodyAccelerometer_Mean_Z	
TimeDomain_BodyAccelerometer_StandardDeviation_X	
TimeDomain_BodyAccelerometer_StandardDeviation_Y	
TimeDomain_BodyAccelerometer_StandardDeviation_Z	
TimeDomain_GravityAccelerometer_Mean_X	
TimeDomain_GravityAccelerometer_Mean_Y	
TimeDomain_GravityAccelerometer_Mean_Z	
TimeDomain_GravityAccelerometer_StandardDeviation_X	
TimeDomain_GravityAccelerometer_StandardDeviation_Y	
TimeDomain_GravityAccelerometer_StandardDeviation_Z	
TimeDomain_BodyAccelerometerJerk_Mean_X	
TimeDomain_BodyAccelerometerJerk_Mean_Y	
TimeDomain_BodyAccelerometerJerk_Mean_Z	
TimeDomain_BodyAccelerometerJerk_StandardDeviation_X	
TimeDomain_BodyAccelerometerJerk_StandardDeviation_Y	
TimeDomain_BodyAccelerometerJerk_StandardDeviation_Z	
TimeDomain_BodyGyroscope_Mean_X	
TimeDomain_BodyGyroscope_Mean_Y	
TimeDomain_BodyGyroscope_Mean_Z	
TimeDomain_BodyGyroscope_StandardDeviation_X	
TimeDomain_BodyGyroscope_StandardDeviation_Y	
TimeDomain_BodyGyroscope_StandardDeviation_Z	
TimeDomain_BodyGyroscopeJerk_Mean_X	
TimeDomain_BodyGyroscopeJerk_Mean_Y	
TimeDomain_BodyGyroscopeJerk_Mean_Z	
TimeDomain_BodyGyroscopeJerk_StandardDeviation_X	
TimeDomain_BodyGyroscopeJerk_StandardDeviation_Y	
TimeDomain_BodyGyroscopeJerk_StandardDeviation_Z	
TimeDomain_BodyAccelerometerMagnitude_mean	
TimeDomain_BodyAccelerometerMagnitude_std	
TimeDomain_GravityAccelerometerMagnitude_mean	
TimeDomain_GravityAccelerometerMagnitude_std	
TimeDomain_BodyAccelerometerJerkMagnitude_mean	
TimeDomain_BodyAccelerometerJerkMagnitude_std	
TimeDomain_BodyGyroscopeMagnitude_mean	
TimeDomain_BodyGyroscopeMagnitude_std	
TimeDomain_BodyGyroscopeJerkMagnitude_mean	
TimeDomain_BodyGyroscopeJerkMagnitude_std	
FrequencyDomain_BodyAccelerometer_Mean_X	
FrequencyDomain_BodyAccelerometer_Mean_Y	
FrequencyDomain_BodyAccelerometer_Mean_Z	
FrequencyDomain_BodyAccelerometer_StandardDeviation_X	
FrequencyDomain_BodyAccelerometer_StandardDeviation_Y	
FrequencyDomain_BodyAccelerometer_StandardDeviation_Z	
FrequencyDomain_BodyAccelerometer_meanFreq_X	
FrequencyDomain_BodyAccelerometer_meanFreq_Y	
FrequencyDomain_BodyAccelerometer_meanFreq_Z	
FrequencyDomain_BodyAccelerometerJerk_Mean_X	
FrequencyDomain_BodyAccelerometerJerk_Mean_Y	
FrequencyDomain_BodyAccelerometerJerk_Mean_Z	
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_X	
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Y	
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Z	
FrequencyDomain_BodyAccelerometerJerk_meanFreq_X	
FrequencyDomain_BodyAccelerometerJerk_meanFreq_Y	
FrequencyDomain_BodyAccelerometerJerk_meanFreq_Z	
FrequencyDomain_BodyGyroscope_Mean_X	
FrequencyDomain_BodyGyroscope_Mean_Y	
FrequencyDomain_BodyGyroscope_Mean_Z	
FrequencyDomain_BodyGyroscope_StandardDeviation_X	
FrequencyDomain_BodyGyroscope_StandardDeviation_Y	
FrequencyDomain_BodyGyroscope_StandardDeviation_Z	
FrequencyDomain_BodyGyroscope_meanFreq_X	
FrequencyDomain_BodyGyroscope_meanFreq_Y	
FrequencyDomain_BodyGyroscope_meanFreq_Z	
FrequencyDomain_BodyAccelerometerMagnitude_mean	
FrequencyDomain_BodyAccelerometerMagnitude_std	
FrequencyDomain_BodyAccelerometerMagnitude_meanFreq	
FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_mean	
FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_std	
FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_meanFreq	
FrequencyDomain_BodyBodyGyroscopeMagnitude_mean	
FrequencyDomain_BodyBodyGyroscopeMagnitude_std	
FrequencyDomain_BodyBodyGyroscopeMagnitude_meanFreq	
FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_mean	
FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_std	
FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_meanFreq	


