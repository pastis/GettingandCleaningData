## run_analysis.R  Load and reshape data for analysis

# load required packages
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# set datapath to location of UCI HAR Datasets
datapath <- file.path("C:\\UCI HAR Dataset")

#uncomment for debug  list.files(datapath, recursive=TRUE)

# Required: extract only the measurements on the mean and standard deviation for each measurement.

# Read in all features and index required ones only Note: X is upper case 
 
feature.names <- read.table("features.txt")
required.feature.names <- grep("std|mean", feature.names$V2)

##  Get only those test and training features that are required

training.features <- read.table("train/X_train.txt")
required.training.features <- training.features[,required.feature.names]

testing.features <- read.table("test/X_test.txt")
required.testing.features <- testing.features[,required.feature.names]
 
##  Combine all required features and attach the column name to them

all.required.features <- rbind(required.training.features, required.testing.features)
colnames(all.required.features) <- feature.names[required.features,2]

# Read in all activity codes and combine them and attach labels  NOTE: y is lower case

##  Getting all the activity codes

training.activities <- read.table("train/y_train.txt")
testing.activities <- read.table("test/y_test.txt")

##  Combine all the activity codes 

all.activities <- rbind(training.activities, testing.activities)

##  Get the activity labels and attach them to all.activities 

activity.labels <- read.table("activity_labels.txt")
all.activities$activity <- factor(all.activities$V1, levels = activity.labels$V1, labels = activity.labels$V2)

# Read in all subjects and combine them

##  Combine all the subjects with their id's

training.subjects <- read.table("train/subject_train.txt")
testing.subjects <- read.table("test/subject_test.txt")
all.subjects <- rbind(training.subjects, testing.subjects)

#   Create all subjects and all activites

all.subjects.and.all.activities <- cbind(all.subjects,all.activities$activity)
colnames(all.subjects.and.all.activities) <- c("subject.id", "activity")

#  Create the required data frame
required.data.frame <- cbind(all.subjects.and.all.activities, all.required.features)
names(required.data.frame)<-gsub("Acc", "Accelerometer", names(required.data.frame))
names(required.data.frame)<-gsub("Gyro", "Gyroscope", names(required.data.frame))
names(required.data.frame)<-gsub("BodyBody", "Body", names(required.data.frame))
names(required.data.frame)<-gsub("Mag", "Magnitude", names(required.data.frame))
names(required.data.frame)<-gsub("^t", "Time", names(required.data.frame))
names(required.data.frame)<-gsub("^f", "Frequency", names(required.data.frame))
names(required.data.frame)<-gsub("tBody", "TimeBody", names(required.data.frame))
names(required.data.frame)<-gsub("-mean()", "Mean", names(required.data.frame), ignore.case = TRUE)
names(required.data.frame)<-gsub("-std()", "STD", names(required.data.frame), ignore.case = TRUE)
names(required.data.frame)<-gsub("-freq()", "Frequency", names(required.data.frame), ignore.case = TRUE)
names(required.data.frame)<-gsub("angle", "Angle", names(required.data.frame))
names(required.data.frame)<-gsub("gravity", "Gravity", names(required.data.frame))

#  Calcuate the new result for required analysis
final.required.analysis.frame <- aggregate(required.data.frame[,3:81], by = list(required.data.frame$subject.id, required.data.frame$activity), FUN = mean)
colnames(final.required.analysis.frame)[1:2] <- c("subject.id","activity")
write.table(final.required.analysis.frame, file="mean_std_analysis.txt", row.names = FALSE)





