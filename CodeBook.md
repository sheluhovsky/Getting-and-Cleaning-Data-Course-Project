# Code Book for Getting and Cleaning Data Project
## Introduction
This document summarizes the variables, the data, and transformations / work implemented in `run_analysis.R`.

##Study Design
###Step 1
The script sets a word directory as well as creates `data` folder, if needed. It also downloads [Samsung data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into `data` folder.

###Step 2
The script loads the data from multiple files and merges the training and the test sets to create one data set

###Step 3
The script extracts only the measurements on the mean and standard deviation for each measurement.

###Step 4
The script uses descriptive activity names to name the activities in the data set.

###Step 5
The script creates a tidy data set, group it by `ActivityName` and `SubjectID`, calculates mean for the measurements and writes in to `tidyDataSet.txt` in `data` folder.

##Variables
1. `destFile` - name of the file to save Samsung data on computer in the `data` folder.
2. `activityLabels` - data frame created on top of  `activity_labels.txt`.
3. `features` - data frame created on top of  `features.txt`.
4. `subjectHeader` - header name for subject for test and train data sets.
5. `activityHeader` - header name for activity for test and train data sets.
6. `subjectTest` - data frame created on top of  `subject_test.txt`.
7. `xTest` - data frame created on top of  `X_test.txt`.
8. `yTest` - data frame created on top of  `y_test.txt`.
9. `tests` - data frame that combines `subjectTest`, `xTest`, `yTest` as columns .
10. `subjectTrain` - data frame created on top of  `subject_train.txt`.
11. `xTrain` - data frame created on top of  `X_train.txt`.
12. `yTrain` - data frame created on top of  `y_train.txt`.
13. `trains` - data frame that combines `subjectTrain`, `xTrain`, `yTrain` as columns .
14. `allData` - merged the training and the test sets to create one data set.
15. `measurementsOnMeanAndStandardDeviaion` - data frame with desired measurements (anything containing "mean" or "std").
16. `m` - data frame that added activity names to `measurementsOnMeanAndStandardDeviaion`.
16. `tidyDataSet` - data frame with tidy data.
16. `tidyDataSetByActivityAndSubject` data frame groped by  `ActivityName` and `SubjectID`.
16. `summarized` - grouped by  `ActivityName` and `SubjectID` data frame with mean calculation for the measurements.

##Output Data
`run_analysis.R` creates `data` folder in the work directroy, if needed,  and produces `tidyDataSet.txt`. This data sets contains the following variables:

1. *ActivityName*. Name of the activity. It could be one of the following:
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING
2. *SubjectID*. ID of subject

The rest of the variables are average values of the corresponding measurement form the source for the specified  combination of activity and subject:

3. *tBodyAcc.mean...X*. 
4. *tBodyAcc.mean...Y*.
5. *tBodyAcc.mean...Z*.
6. *tBodyAcc.std...X*.
7. *tBodyAcc.std...Y*.
8. *tBodyAcc.std...Z*.
9. *tGravityAcc.mean...X*.
10. *tGravityAcc.mean...Y*.
11. *tGravityAcc.mean...Z*.
12. *tGravityAcc.std...X*.
13. *tGravityAcc.std...Y*.
14. *tGravityAcc.std...Z*.
15. *tBodyAccJerk.mean...X*.
16. *tBodyAccJerk.mean...Y*.
17. *tBodyAccJerk.mean...Z*.
18. *tBodyAccJerk.std...X*.
19. *tBodyAccJerk.std...Y*.
20. *tBodyAccJerk.std...Z*.
21. *tBodyGyro.mean...X*.
22. *tBodyGyro.mean...Y*.
23. *tBodyGyro.mean...Z*.
24. *tBodyGyro.std...X*.
25. *tBodyGyro.std...Y*.
26. *tBodyGyro.std...Z*.
27. *tBodyGyroJerk.mean...X*.
28. *tBodyGyroJerk.mean...Y*.
29. *tBodyGyroJerk.mean...Z*.
30. *tBodyGyroJerk.std...X*.
31. *tBodyGyroJerk.std...Y*.
32. *tBodyGyroJerk.std...Z*.
33. *tBodyAccMag.mean..*.
34. *tBodyAccMag.std..*.
35. *tGravityAccMag.mean..*.
36. *tGravityAccMag.std..*.
37. *tBodyAccJerkMag.mean..*.
38. *tBodyAccJerkMag.std..*.
39. *tBodyGyroMag.mean..*.
40. *tBodyGyroMag.std..*.
41. *tBodyGyroJerkMag.mean..*.
42. *tBodyGyroJerkMag.std..*.
43. *fBodyAcc.mean...X*.
44. *fBodyAcc.mean...Y*.
45. *fBodyAcc.mean...Z*.
46. *fBodyAcc.std...X*.
47. *fBodyAcc.std...Y*.
48. *fBodyAcc.std...Z*.
49. *fBodyAcc.meanFreq...X*.
50. *fBodyAcc.meanFreq...Y*.
51. *fBodyAcc.meanFreq...Z*.
52. *fBodyAccJerk.mean...X*.
53. *fBodyAccJerk.mean...Y*.
54. *fBodyAccJerk.mean...Z*.
55. *fBodyAccJerk.std...X*.
56. *fBodyAccJerk.std...Y*.
57. *fBodyAccJerk.std...Z*.
58. *fBodyAccJerk.meanFreq...X*.
59. *fBodyAccJerk.meanFreq...Y*.
60. *fBodyAccJerk.meanFreq...Z*.
61. *fBodyGyro.mean...X*.
62. *fBodyGyro.mean...Y*.
63. *fBodyGyro.mean...Z*.
64. *fBodyGyro.std...X*.
65. *fBodyGyro.std...Y*.
66. *fBodyGyro.std...Z*.
67. *fBodyGyro.meanFreq...X*.
68. *fBodyGyro.meanFreq...Y*.
69. *fBodyGyro.meanFreq...Z*.
70. *fBodyAccMag.mean..*.
71. *fBodyAccMag.std..*.
72. *fBodyAccMag.meanFreq..*.
73. *fBodyBodyAccJerkMag.mean..*.
74. *fBodyBodyAccJerkMag.std..*.
75. *fBodyBodyAccJerkMag.meanFreq..*.
76. *fBodyBodyGyroMag.mean..*.
77. *fBodyBodyGyroMag.std..*.
78. *fBodyBodyGyroMag.meanFreq..*.
79. *fBodyBodyGyroJerkMag.mean..*.
80. *fBodyBodyGyroJerkMag.std..*.
81. *fBodyBodyGyroJerkMag.meanFreq..*.

