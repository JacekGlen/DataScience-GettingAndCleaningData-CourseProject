library(plyr)

# Step 1: Merge the training and the test sets to create one data set.

xtrainData <- read.table("UCI HAR Dataset/train/X_train.txt")
xtestData <- read.table("UCI HAR Dataset/test/X_test.txt")
xData <- rbind(xtrainData, xtestData)

ytrainData <- read.table("UCI HAR Dataset/train/Y_train.txt")
ytestData <- read.table("UCI HAR Dataset/test/Y_test.txt")
yData <- rbind(ytrainData, ytestData)

subjtrainData <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjtestData <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectData <- rbind(subjtrainData, subjtestData)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 
featuresAll <- read.table("UCI HAR Dataset/features.txt")
featuresMeanAndSd <- grep("-(mean|std)\\(\\)", featuresAll[, 2])
xData <- xData[, featuresMeanAndSd]
fNames <- featuresAll[featuresMeanAndSd, 2]
fNames <- gsub("-mean\\(\\)", "Mean", fNames)
fNames <- gsub("-std\\(\\)", "StdDev", fNames)

names(xData) <- fNames

# Step 3: Use descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
yData[, 1] <- activities[yData[, 1], 2]

# Step 4: Label the data set with descriptive variable names. 
names(yData) <- c("Activity")
names(subjectData) <- c("Subject")
merged <- cbind(subjectData, yData, xData)

# Step 5: Create tidy data set with the average of each variable for each activity and each subject.
xDataColumnMeans <- function (x) colMeans(x[, -c(1,2)])
tidyData <- ddply(merged, .(Subject, Activity), xDataColumnMeans)
write.table( tidyData, "tidyData.txt", row.names = FALSE )

tidyData
