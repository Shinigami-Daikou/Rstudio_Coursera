
Programming Assignment
Course: Getting and Cleaning data

Contents

This repository consists of 3 files

CodeBook.md : Markdown document listing all the variable in the data set.
Readme.txt : Gives an Insight of the Contents and the Whole Process.
Prog_Assignment_course_3.R : This R script contain the required script.
Tidy_table.txt : This is the tidy data set produced as an output from the R script.

Once you have the Script. Run it and it will do the following Steps:

Step 1:
Data is downloaded by download.file() function
It is then unzipped the data


Step 2:
Both Train and Test Database are loaded on Seperate DF
All columns of DFs are then renamed


 Step 3:
Data sets are then merged using the rbind and cbind functions to give a data set Final_data


Step 4:
After Step 3 only the measurements on the mean and standard deviation for each measurement are extracted from Final_data and put in Extracted_data


Step 5:
The Extracted_data Data Frame is then merged with activity_label Data Set to create labeling of the data set with descriptive variable names.

Step 6:
From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created by using a split function to split the Extracted_data data set by ID of Activity and mean is calculated by apply and then merged


Step 7:
Writing the dataset into a txt file
