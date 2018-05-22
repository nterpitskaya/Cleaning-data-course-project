---
title: "Codebook"
author: "Nadia Terpitskaya"
date: "5/15/2018"
output: html_document
---
## Variables
 Final data set contains average value of mean and std distribution for each subject,each activity and each measurement. The data set contains 68 columns(variables), where   
1. activityname - name of activity, could be one of: "LAYING", "SITTING", "STANDING", "WALKING"    , , "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"    
2. subjectid - id of subject. Integer value, it could be in range of 1:30. Some subject are missing because they did not have appropriate data in raw dataset.  
3. tBodyAccmeanX ....  68. fBodyBodyGyroJerkMagstd - average amount of std and mean distribution for each measurement.

## Data 
Initil data set was downloaded  from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
After all [transformations], final data set is stored to "avgdata.txt"

## Transformations
1. Read id and names of activities  from activity_labels.txt  
2. Read names of variables for initial dataset from features.txt
3. Read test data from X_test.txt
4. Read ids of subject from subject_test.txt
5. Read activity info from y_test.txt
6. Set names of data from X_test using data from features.txt
7. Add subject id for each row of test data (cbind subjecttest,xtest)
8. Add activity name for each row of test data using info from y_test.txt
9. Make steps 3 - 8 for train data (UCI HAR Dataset > train folder)
10. Union train and test dataset
11. Extract only variables(columns) containing "main()" OR "std()" substring in the name of variable
12. Remove special symbols "()" and "-" from variable names
13. Group data set by activity name and subjectid
14. Summirize all variables using mean function to get final dataset. Use na.rm = true param to ignore na data in the dataset.