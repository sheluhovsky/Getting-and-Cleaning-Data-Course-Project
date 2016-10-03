# Getting-and-Cleaning-Data-Course-Project
This repository contains files as per Coursera Getting and Cleaning Data Course Project requirements of Coursera:
* `README.md` - the current document.
* `run_analysis.R` - This is a R script that does the following:
  1. Sets a working directory and creates "data" folder, if it does not exist.
  2. Downloads and unzip Samsung data into data folder, if it does not exist.
  3. Reads the data, merges the training and the test sets to create one data set.
  4. Extracts only the measurements on the mean and standard deviation for each measurement.
  5. Uses descriptive activity names to name the activities in the data set
  6. Appropriately labels the data set with descriptive variable names.
  7. Produces an independent tidy data set (and saves it to the data folder as `tidyDataSet.txt`) with the average of each variable for each activity and each subject for the wanted measurements.
* `CodeBook.md` - a code book that describes the variables, the data, and  transformations/work performed to clean up the data
