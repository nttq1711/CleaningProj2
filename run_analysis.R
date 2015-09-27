## Reading data
features = read.table("UCI HAR Dataset/features.txt", sep=" ")
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
#Test Data
x_test= read.table("UCI HAR Dataset/test/X_test.txt")
y_test= read.table("UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
#Train Data
x_train= read.table("UCI HAR Dataset/train/X_train.txt")
y_train= read.table("UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

#Merge data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
# grep(pattern, data vector...)
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]
names(subject_data) <- "subject"

## Uses descriptive activity names to name the activities in the data set
y_data[, 1] <- activity_labels[y_data[, 1], 2]
names(y_data) <- "activity"
#Merge all data
finalData <- cbind(x_data, y_data, subject_data)

colNames  = colnames(finalData)
## Appropriately label the data set with descriptive activity names.
for (i in 1:length(colNames)) 
{
        colNames[i] = gsub("Acc","Acceleration",colNames[i])
        colNames[i] = gsub("Gyro","Gyroscope",colNames[i])
        colNames[i] = gsub("Mag","Magnitude",colNames[i])
        colNames[i] = gsub("-std$","StdDev",colNames[i])
        colNames[i] = gsub("-mean","Mean",colNames[i])
}
colnames(finalData) = colNames;

## Create new tidy data files
tidyData = ddply(finalData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t')