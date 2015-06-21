library(plyr)

# Step 1: Merge the training and the test sets to create one data set.

# xtrainData <- read.table("UCI HAR Dataset/train/X_train.txt")
# xtestData <- read.table("UCI HAR Dataset/test/X_test.txt")
# xData <- rbind(xtrainData, xtestData)
# 
# ytrainData <- read.table("UCI HAR Dataset/train/Y_train.txt")
# ytestData <- read.table("UCI HAR Dataset/test/Y_test.txt")
# yData <- rbind(ytrainData, ytestData)
xData <- read.table("UCI HAR Dataset/test/X_test.txt")



# Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 
featuresAll <- read.table("UCI HAR Dataset/features.txt")
featuresMeanAndSd <- grep("-(mean|std)\\(\\)", featuresAll[, 2])
xData <- xData[, featuresMeanAndSd]
names(xData) <- featuresAll[featuresMeanAndSd, 2]

# Step 3: Use descriptive activity names to name the activities in the data set
# Step 4: Label the data set with descriptive variable names. 
# Step 5: Create tidy data set with the average of each variable for each activity and each subject.