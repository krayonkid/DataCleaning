DataCleaning
============

###  Introduction

The goal of the run_analysis.R script is to prepare a tidy dataset.

###  How to run the script

1.  You need to have the UCI HAR Dataset folder in your working directory
2.  The script will go in and pull all necessary text files
3.  The script will also create a text file called tidyData.txt file

###  Variables

Features and Activity Labels
fpath :  Path to the features text file
alpath:  Path to the activity_labels text file
features:  Created from the features text file
actLab:  Created from the activity_labels text file

Test Data
test_subjects:  Path to the subject_test text file
test_x:   Path to the X_test text file
test_y:  Path to the Y_test text file
subTest:  Created from subject_test file
xTest:  Created from X_test file
yTest:  Created from Y_test file
test:  Combine the all the separate files to create one data frame.  Added “Test” flag

Train Data
train_subjects:  Path to the subject_train text file
train_x:   Path to the X_train text file
train_y:  Path to the Y_train text file
subTrain:  Created from subject_train file
xTrain:  Created from X_train file
yTrain:  Created from Y_train file
train:  Combine the all the separate files to create one data frame.  Added “Train” flag

TTData:  Combine test and train data

Add column names
trans:  Transpose features
colNames:  Column names

Extract columns
meanStd:  Extract Subject, Activity and columns that have mean and standard deviation calculations.  All columns that contain mean or std is captured.
TTData2:  This data frame is a subset of TTData.  It only contains columns containing mean and standard deviation
TTData3:  This data frame is TTData2, but includes the activity descriptions

Tiding up data
varNames:  Contains the ‘variable’ columns used in the melt function
TTMelt:  Created by using the melt function on TTData3

TTTidy:  Final tidy data.  Values represent the average at the subject activity level
