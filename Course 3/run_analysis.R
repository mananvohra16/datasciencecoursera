
library(dplyr)
library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path("dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

#loading subject and Activity
dtSubjectTrain <- fread("UCI HAR Dataset/train/subject_train.txt")
dtSubjectTest  <- fread("UCI HAR Dataset/test/subject_test.txt")

dtActivityTrain <- fread("UCI HAR Dataset/train/y_train.txt")
dtActivityTest  <- fread("UCI HAR Dataset/test/y_test.txt")

dtTrain <- fread("UCI HAR Dataset/train/X_train.txt")
dtTest <- fread("UCI HAR Dataset/test/X_test.txt")

dtFeature <- fread("UCI HAR Dataset/features.txt")
setnames(dtFeature, c("featureNum", "featureName"))


#merging training and testing data
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
setnames(dtSubject, "subject")
dtActivity <- rbind(dtActivityTrain, dtActivityTest)
setnames(dtActivity, "activityNum")
dtTrainTest <- rbind(dtTrain, dtTest)

#merging columns
dtSub <- cbind(dtSubject, dtActivity)
data <- cbind(dtSub, dtTrainTest)
setkey(data, "subject", "activityNum")

# Extracting features with only Mean and Standard Deviation
dtFeatures <- dtFeature[grepl("(mean|std)\\(\\)", featureName)]

dtFeatures$featureCode <- dtFeatures[, paste0("V", featureNum)]
head(dtFeatures)
dtFeatures$featureCode

data <- data[, c(key(data), dtFeatures$featureCode), with=FALSE]

#adding names to activity
dtActivityNames <- fread("UCI HAR Dataset/activity_labels.txt")
setnames(dtActivityNames, names(dtActivityNames), c("activityNum", "activityName"))

data <- merge(data, dtActivityNames, by="activityNum", all.x=TRUE)
setkey(data, subject, activityNum, activityName)

data <- data.table(melt(data, key(data), variable.name="featureCode"))
data <- merge(data, dtFeatures[, list(featureNum, featureCode, featureName)], by="featureCode", all.x=TRUE)

data$activity <- factor(data$activityName)
data$feature <- factor(data$featureName)

grepthis <- function (regex) {
    grepl(regex, data$feature)
}
## Features with 2 categories
n <- 2
y <- matrix(seq(1, n), nrow=n)
x <- matrix(c(grepthis("^t"), grepthis("^f")), ncol=nrow(y))
data$featDomain <- factor(x %*% y, labels=c("Time", "Freq"))
x <- matrix(c(grepthis("Acc"), grepthis("Gyro")), ncol=nrow(y))
data$featInstrument <- factor(x %*% y, labels=c("Accelerometer", "Gyroscope"))
x <- matrix(c(grepthis("BodyAcc"), grepthis("GravityAcc")), ncol=nrow(y))
data$featAcceleration <- factor(x %*% y, labels=c(NA, "Body", "Gravity"))
x <- matrix(c(grepthis("mean()"), grepthis("std()")), ncol=nrow(y))
data$featVariable <- factor(x %*% y, labels=c("Mean", "SD"))
## Features with 1 category
data$featJerk <- factor(grepthis("Jerk"), labels=c(NA, "Jerk"))
data$featMagnitude <- factor(grepthis("Mag"), labels=c(NA, "Magnitude"))
## Features with 3 categories
n <- 3
y <- matrix(seq(1, n), nrow=n)
x <- matrix(c(grepthis("-X"), grepthis("-Y"), grepthis("-Z")), ncol=nrow(y))
data$featAxis <- factor(x %*% y, labels=c(NA, "X", "Y", "Z"))

setkey(data, subject, activity, featDomain, featAcceleration, featInstrument, featJerk, featMagnitude, featVariable, featAxis)
dtTidy <- data[, list(count = .N, average = mean(value)), by=key(data)]
write.table(dtTidy, file="Assignment/tidy_data1.txt", row.names = FALSE)




