# Data Science - Getting and Cleaning Data: Course Project
Course project repo for Getting and Cleaning Data course, Data Science specialization (Coursera)

## Introduction
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The dataset used in the project: [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
A full description of the dataset is available at [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Project
Create R script called run_analysis.R that does the following. 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Raw data
Bopth test and train data available. 
561 unlabelled features are and can be found in the x_test.txt and x_train.txt files. 
The activity labels are in the y_test.txt and x_train files. 
The test subjects are in the subject_test.txt and subject_train.txt files.

## Prerequisites
Linked data set must be downloaded and extracted into `UCI HAR Dataset` folder under the working folder.

## Results
Resultant data is contained in the tidyData.txt file.