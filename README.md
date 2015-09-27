# Getting and Cleaning Data Project
Course project for "Getting and Cleaning Data Coursera".
# Descriptions
This project aims at collecting, working with, and cleaning a data set.
# Source
The source data was collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
[UCI Machine Learning](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The link to the data: [Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
# Coding steps

* Reading data
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Merge into 1 data set
* Appropriately label the data set with descriptive activity names.
* Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
* Write tidy data into text file

# Details of files:

* run_analysis.r: R processing file
* folder UCI HAR Dataset: source data 
* tidyData.txt: contains the final clean processed data
* README.md: description of the project
* CODEBOOK.md: describing variables

# How to regenerate the tidy data:
Run file run_analysis.r (keep the location of the original data set).


