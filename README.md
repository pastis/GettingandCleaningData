Getting and Cleaning Data Course Assignment
---------------------------------------------------------------

##Goal

Companies like *FitBit, Nike,* and *Jawbone Up* are racing to develop the most advanced algorithms to attract new users. The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:  

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data is available at:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The aim of the project is to clean and extract usable data from the above zip file. R script called run_analysis.R that does the following:
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Merges the training and the test sets to create one data set.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository, you find:

- *run_analysis.R* : the R-code used to create the required analysis and data run from orginial data set

- *mean_std_analysis.txt* : the clean data extracted from the original data using *run_analysis.R*

- *CodeBook.md* : the CodeBook reference to the variables in *mean_std_analysis.txt*

- *README.md* : the analysis of the code in *run_analysis.R*

# Getting and Cleaning Data, Peer Assessment Project

## <u>How To</u>
To repeat the work done in this project:

* 1. Download source data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* 2. Unzip to your working directory called  C:\UCI HAR Datasets
* 3. Execute the script run_analysis.R from that directory.
*    there are lines that can be uncommented in script for debugging if needed

## <u>Steps Performed</u>
The steps done by the script involve loading the data provided from the source, and tidying this into a single data frame containing just the original data cells required, in the desired format.  Only the final major step computes a new result from the tidied data, writing out subject ids, activites, and mean of all measures of interest.

### Required: extract only the measurements on the mean and standard deviation for each measurement
Read in all features and index required ones only:  mean or std measures

### Get only those test and training features that are required
Get the train and test feature sets and subset only the desired features
Combine all required features and attach the column name to them

### Process all activity codes 
Read in all activity codes and combine them and attach labels 

### Read in all subjects and combine them with ID's
Get and combine the train and test subject ids

### Create All Subjects and Activites 
Combine and name subjects and activity names

### Create required dataframe
Combine with measures for finished required data frame
Change names to meaningfull names for analysis 

### Compute the new result for required analysis 
From the set produced for analysis, compute and report means of all measures, grouped by subject_id and by activity.
Write final file to directory called mean_std_analysis.txt
