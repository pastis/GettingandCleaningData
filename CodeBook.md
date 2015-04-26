CodeBook
---------------------------------------------------------------
This document describes the data and transformations used by *run_analysis.R* and the definition of variables in *mean_std_analysis.txt*.

##Dataset Used

This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The data set used can be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 

##Input Data Set

The input data containts the following data files:

- `X_train.txt` contains variable features that are intended for training.
- `y_train.txt` contains the activities corresponding to `X_train.txt`.
- `subject_train.txt` contains information on the subjects from whom data is collected.
- `X_test.txt` contains variable features that are intended for testing.
- `y_test.txt` contains the activities corresponding to `X_test.txt`.
- `subject_test.txt` contains information on the subjects from whom data is collected.
- `activity_labels.txt` contains metadata on the different types of activities.
- `features.txt` contains the name of the features in the data sets.

##Transformations

Following are the transformations that were performed on the input dataset:

- `X_train.txt` is read into `training.features`.
- `y_train.txt` is read into `training.activities`.
- `subject_train.txt` is read into `training.subjects`.
- `X_test.txt` is read into `testing.features`.
- `y_test.txt` is read into `testing.activities`.
- `subject_test.txt` is read into `testing.subjects`.
- `features.txt` is read into `feature.names`.
- `activity_labels.txt` is read into `activity.labels`.
- The subjects in training and test set data are merged to form `subject.id`.
- The activities in training and test set data are merged to form `activity`.
- The features of test and training are merged to form `all.required.features`.
- The name of the features are set in `required.feature.names` from `features.names`.
- `features`, `activity` and `subject` are merged to form `required.`.
- Indices of columns that contain std or mean, activity and subject are taken into `required.feature.names` .
- `required.data.frame` is created with data from columns in `required.feature.names`.
- `Activity` column in `required.data.frame` is updated with descriptive names of activities taken from `activity.labels`. `activity` column is expressed as a factor variable.
- Acronyms in variable names in `required.data.frame`, like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive labels such as 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency'.
- `final.analysis.frame` is created as a set with average for each activity and subject of `require.data.frame`. Entries in `final.required.analysis.frame` are ordered based on activity and subject.
- Finally, the data in `final.analysis.frame` is written into `mean_std_analysis.txt`.

##Output Data Set

The output data `mean_std_analysis.txt` is a a space-delimited value file. The header line contains the names of the variables. It contains the mean and standard deviation values of the data contained in the input files. The header is restructued in an understandable manner. 
