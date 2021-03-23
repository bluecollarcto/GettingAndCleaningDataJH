# Getting And Cleaning Data JH Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set for the *Coursera Getting and Cleaning Data* course.


## Project Summary
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The goal is to prepare tidy data that can be used for later analysis using specific data captured in the [Human Activity Recognition Using Smartphones] paper linked above.
The link to the data used is here.
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

This project will complete the following steps to create the tidy data set.
1. Merge the training and test data sets to create one combined data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, the independent tidy data set with the average of each variable for each activity and each subject will be created.

## GitHub Repository Information
This repository will contain 4 files
1. This `README.md` file
2. The `CodeBook.md` file -  describing each variable and its values in the tidy data set 
3. `run_analysis.R` - R script file used to merge, clean and ultimately create the tidy data set
4. `tidy.txt` - the final output from the script above that contains the tidy data

## Dependencies
The `run_analysis.R` file references the dependency on R package **data.table**
