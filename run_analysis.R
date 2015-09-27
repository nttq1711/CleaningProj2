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

## Assign column names 
colnames(activity_labels)  = c('activityId','activityType')
colnames(subject_train)  = "subjectId"
colnames(x_train)        = features[,2] 
colnames(y_train)        = "activityId"
colnames(subject_test) = "subjectId";
colnames(x_test)       = features[,2]; 
colnames(y_test)       = "activityId";
## Merge into 1 data set
trainingData = cbind(y_train,subject_train,x_train)
testData = cbind(y_test,subject_test,x_test)
finalData = rbind(trainingData,testData)
colNames  = colnames(finalData)
## Extracts only the measurements on the mean and standard deviation for each measurement. 
# grepl(pattern, data vector...)
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))
finalData = finalData[logicalVector==TRUE]
## Uses descriptive activity names to name the activities in the data set
finalData = merge(finalData,activity_labels,by="activityId",all.x=TRUE)#all.x=True
colNames  = colnames(finalData)
## Appropriately label the data set with descriptive activity names.
for (i in 1:length(colNames)) 
{
        colNames[i] = gsub("\\()","",colNames[i])
        colNames[i] = gsub("-std$","StdDev",colNames[i])
        colNames[i] = gsub("-mean","Mean",colNames[i])
        colNames[i] = gsub("^(t)","time",colNames[i])
        colNames[i] = gsub("^(f)","freq",colNames[i])
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
        colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
        colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
        colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
        colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
        colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};
colnames(finalData) = colNames

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
finalDataNoActivityType  = finalData[,names(finalData) != 'activityType']
# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean)
tidyData    = merge(tidyData,activity_labels,by='activityId',all.x=TRUE)
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t')