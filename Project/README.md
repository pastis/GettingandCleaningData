# Getting and Cleaning Data, Peer Assessment Project

## <u>How To</u>
Get the data used in this project:

* 1. Source data is from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* 2. The data needs to be unzipped to the working directory
     The directory should be called UCI HAR Dataset
* 3. The required packages should be loaded:  data.table
* 4. Execute the script run_analysis.R from the working directory.

## <u>NOTE:</u>
Data features where limited to Mean and StDev 

## <u>What was done to create Tidy Dataset</u>

### 1st Step  Store UCI HAR dataset in working directory
Data set is located at
(https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip)

Set up environment:  get the required packages
```{r , eval=FALSE}
library(data.table)
```
Set the working directory  I work in Testing directory from my windows id
```{r , eval=FALSE}
setwd("C:/Users/eehuth/Documents/Testing")
```
Assign the working directory to the path variable
```{r , eval=FALSE}
path <- getwd()
```

