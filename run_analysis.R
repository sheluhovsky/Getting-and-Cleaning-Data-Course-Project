# set the working directory
setwd("/Users/vitrimak/Documents/Coursera/Data Science/data-cleaning") 

# create a folder for data
if(!file.exists("./data")) {
    dir.create("./data")
}

# download the file and unzip it if it does not exist already
destFile <- "./data/DataSet.zip"
if (!file.exists(destFile)) {
    fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url = fileURL,destfile = destFile, method = "curl")
    unzip(destFile, exdir = "data")
}


#loading common information
activityLabels <- read.table(file = "./data/UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "ActivityName"))
features <- read.table(file="./data/UCI HAR Dataset/features.txt", col.names = c("FeatureID", "FeatureName"))

#common names
subjectHeader <- c("SubjectID")
activityHeader <- c("ActivityID")

#loading and merging test data
subjectTest <- read.table(file = "./data/UCI HAR Dataset/test/subject_test.txt", col.names = subjectHeader)
xTest <- read.table(file = "./data/UCI HAR Dataset/test/X_test.txt", col.names = features[,"FeatureName"])
yTest <- read.table(file = "./data/UCI HAR Dataset/test/y_test.txt", col.names = activityHeader)
tests <- cbind(subjectTest, yTest, xTest)

#loading and merging traing data
subjectTrain <- read.table(file = "./data/UCI HAR Dataset/train/subject_train.txt", col.names = subjectHeader)
xTrain <- read.table(file = "./data/UCI HAR Dataset/train/X_train.txt", col.names = features[,"FeatureName"])
yTrain <- read.table(file = "./data/UCI HAR Dataset/train/y_train.txt", col.names = activityHeader)
trains <- cbind(subjectTrain, yTrain, xTrain)

# 1. Merges the training and the test sets to create one data set.
allData <- rbind(tests, trains)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
measurementsOnMeanAndStandardDeviaion = allData[grep(".*mean.*|.*std.*|SubjectID|ActivityID", names(allData))]

#3. Uses descriptive activity names to name the activities in the data set
library(dplyr)
m <- merge(measurementsOnMeanAndStandardDeviaion,activityLabels, by = intersect(names(activityLabels),names(measurementsOnMeanAndStandardDeviaion)))
order <- c(c, setdiff(names(m), c))
m <- m[order] # reorder, so that ActivityName will be next to ActivityID

#4. Appropriately labels the data set with descriptive variable names.
#this was done above. Use names(m) and you will see the Descriptive variable name

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#As ActivityID and ActivityName mean the thing, let's normalize the data set to get tidy data set (one variable - one column).
# I prefer ActivityName as it more user friendly, so the below removed ActivityID
tidyDataSet <- m[names(m) != "ActivityID"]

tidyDataSetByActivityAndSubject <- group_by(tidyDataSet, ActivityName, SubjectID)
summarized <- summarize_each(tidyDataSetByActivityAndSubject, funs(mean))

#write.csv(summarized,"./data/tidyDataSet.csv", row.names = FALSE)
write.table(summarized,"./data/tidyDataSet.txt", row.names = FALSE)
