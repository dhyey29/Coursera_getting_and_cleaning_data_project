library(reshape2)

filename <- "dataset.zip"

if(!file.exists(filename))
{
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = filename)
}

if(!file.exists("UCI HAR Dataset"))
{
    unzip(filename)
}

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
features <- features[grepl(pattern = "*mean*|*std*", features[, 2]),]

features[, 2] <- gsub("-mean", "Mean", features[, 2])
features[, 2] <- gsub("-std", "Std", features[, 2])
features[, 2] <- gsub('[-()]', '', features[, 2])

trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainData <- trainData[features[, 1]]
names(trainData) <- features[, 2]
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
names(trainActivities) <- "Activity"
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(trainSubjects) <- "Subject"
train <- cbind(trainSubjects, trainActivities, trainData)

testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testData <- testData[features[, 1]]
names(testData) <- features[, 2]
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
names(testActivities) <- "Activity"
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(testSubjects) <- "Subject"
test <- cbind(testSubjects, testActivities, testData)

data <- rbind(train, test)

data$Subject <- as.factor(data$Subject)
data$Activity <- factor(data$Activity, levels = activities[, 1], labels = activities[, 2])

tidydata <- melt(data, id = c("Subject", "Activity"))
dcast(tidydata, Subject + Activity ~ variable, mean)
names(tidydata) <- c("Subject", "Activity", "Measurements", "Avg_Value")

write.table(tidydata, "tidy_data.txt", row.names = FALSE, quote = FALSE)