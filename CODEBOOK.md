# Data Source (UCI HAR Dataset)
The source data was collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
[UCI Machine Learning](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The link to the data: [Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
# Tidy Data Information
The training and the test sets in the original data set was used to create one data set. Only the measurements on the mean and standard deviation for each measurement. The tidy data set labels use descriptive variable names. 
## Specific columns
* Activity ID
* subject ID
* timeimeBodyAccMagnitudenitudeMean
* timeimeBodyAccMagnitudenitudeStdDev
* timeimeGravityAccMagnitudenitudeMean
* timeimeGravityAccMagnitudenitudeStdDev
* timeimeBodyAccJerkMagnitudenitudeMean
* timeimeBodyAccJerkMagnitudenitudeStdDev
* timeimeBodyGyroMagnitudenitudeMean
* timeimeBodyGyroMagnitudenitudeStdDev
* timeimeBodyGyroJerkMagnitudenitudeMean
* timeimeBodyGyroJerkMagnitudenitudeStdDev
* freqreqBodyAccMagnitudenitudeMean
* freqreqBodyAccMagnitudenitudeStdDev
* freqreqBodyAccJerkMagnitudenitudeMean
* freqreqBodyAccJerkMagnitudenitudeStdDev
* freqreqBodyGyroMagnitudenitudeMean
* freqreqBodyGyroMagnitudenitudeStdDev
* freqreqBodyGyroJerkMagnitudenitudeMean
* freqreqBodyGyroJerkMagnitudenitudeStdDev
* activityType.x
* activityType.y
* activityType

# File run_analysis.R
## Reading data
        Using read.table to read all the file in the original data set.
## Assign column names
        Rename the columns in the loaded tables.
## Merge into 1 data set
        Combine all of the tables into the final Data.
## Extracts only the measurements on the mean and standard deviation for each measurement.
        Using grepl to extract columns having mean and standard deviation for the measurements.
## Uses descriptive activity names to name the activities in the data set
        Using merge to combine activity information to the data set.
## Appropriately label the data set with descriptive activity names.
        Using gsub to relabel the data set column names.
## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
        Using aggregate to find average of  each variable for each activity and each subject. 
## Write tidy data into text file
        Write output file tidyData.txt
