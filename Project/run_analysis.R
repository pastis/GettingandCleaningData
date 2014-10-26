## packages <- c("reshape2", "data.table")
## sapply(packages, require, character, quietly=TRUE)

## data is stored under Project folder in folder called getdata-projectfiles-UCI HAR Dataset
## data was extracted from the downloaded zip file

## Project path should be set to the location of the Project folder  example "C:/Users/xxxxxxxxx/GettingandCleaningData/Project"
## setwd("eehuth/GettingandCleaningData/Project")

pwd <- getwd()
pathFiles <- file.path(pwd, "getdata-projectfiles-UCI HAR Dataset")

## List files for Debug Purpose   print needed for inside script
## print(list.files(pathFiles, recursive = TRUE))

filetoDT <- function (f) {
      df <- read.table(f)
      dt <- data.table(df)
}

## Process Subject Training and Testing records
dtSubjectTraining <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/train", "subject_train.txt"))
dtSubjectTesting  <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/test",  "subject_test.txt"))

## Process Activity Training and Testing records
dtActivityTraining <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/train", "Y_train.txt"))
dtActivityTesting  <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/test",  "Y_test.txt"))

## Process Training and Testing records
dtTraining <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/train", "X_train.txt"))
dtTesting  <- filetoDT(file.path(pathFiles, "UCI HAR Dataset/test" , "X_test.txt"))

## Merge rows of the training and testing data tables

mgSubject <- rbind(dtSubjectTraining, dtSubjectTesting)
setnames(mgSubject, "V1", "subject")

mgActivity <- rbind(dtActivityTraining, dtActivityTesting)
setnames(mgActivity, "V1", "activityNum")

mt <- rbind(dtTraining, dtTesting)

## Merge the columns

mgSubAct <- cbind(mgSubject, mgActivity)
mt <- cbind(mgSubAct, mt)

## Set the keys for the subject and activityNum

setkey(mt, subject, activityNum)

##  Extract the mean and stadard deviation

## process the features.txt file from UCI HAR Dataset file

mtFeatures <-  filetoDT(file.path(pathFiles, "UCI HAR Dataset", "features.txt"))
setnames(mtFeatures, names(mtFeatures), c("featureNum", "featureName"))

# get only the mean and standard deviation using grepl

mtFeatures <- mtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]

# convert column numbers to variable names

mtFeatures$featureCode <-mtFeatures[, paste0("V", featureNum)]

## DEBUG
print(head (mtFeatures))
print(mtFeatures$featureCode)

#use variable names to subset
 
select <-c(key(mt), mtFeatures$featureCode) 
mt <- mt[, select, with=FALSE]




