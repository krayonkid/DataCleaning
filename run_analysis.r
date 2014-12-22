##  Course Project

library(plyr)
library(reshape2)

# ## Set the working directory
# dir <- "~/Coursera/Data Toolbox/Getting_and_Cleaning_Data/Course Project"
# setwd(dir)  

##  Column Names
fpath <- "./UCI HAR Dataset/features.txt"
alpath <- "./UCI HAR Dataset/activity_labels.txt"

features <- read.table(fpath)
actLab <- read.table(alpath)

##  Test Data 
test_subjects <- "./UCI HAR Dataset/test/subject_test.txt"
test_x <- "./UCI HAR Dataset/test/x_test.txt"
test_y <- "./UCI HAR Dataset/test/y_test.txt"

subTest <- read.table(test_subjects)
xTest <- read.table(test_x, sep = "")
yTest <- read.table(test_y)

test <- cbind(subTest, "Test", yTest, xTest)


##  Training Data 
train_subjects <- "./UCI HAR Dataset/train/subject_train.txt"
train_x <- "./UCI HAR Dataset/train/x_train.txt"
train_y <- "./UCI HAR Dataset/train/y_train.txt"

subTrain <- read.table(train_subjects)
xTrain <- read.table(train_x, sep = "")
yTrain <- read.table(train_y)

train <- cbind(subTrain, "Train", yTrain, xTrain)


##  Combine Train and Test data

names(test)[2] <- "Activity"
names(train)[2] <- "Activity"
TTData <- rbind(train, test)


##  Add column labels
##  Transpose the data
trans <- as.character(t(features$V2))

colNames <- c("Subject", "DataSet", "Activity", trans)

names(TTData) <- colNames

##  Extract mean and standard deviation
meanStd <- grep("mean|std", names(TTData), ignore.case = TRUE)

##  Add back in the first columns Subject, DataSet and Activity
meanStd <- c(1, 2, 3, meanStd)

TTData2 <- TTData[, meanStd]

##  Label the activities

TTData3 <- merge(TTData2, actLab, by.x = "Activity", by.y = "V1", all = TRUE)

varNames <- names(TTData3)[4:89]

TTMelt <- melt(TTData3, id = c("Subject", "V2"), measure.vars = varNames)
names(TTMelt)[2] <- "Activity"

TTTidy <- dcast(TTMelt, Subject + Activity ~ variable, mean)



##  Save file as a text file
write.table(TTTidy, "tidyData.txt", row.names = FALSE)
