# Course project for Getting and Cleaning Data

    # reads in data from the Smartphone-Based Recognition 
        # of Human Activities and Postural Transitions Data Set, as provided
        # in the zip file from coursera
    # merges training and test data sets 
    # extracts measurements for mean and standard deviation
    # renames activities with descriptive names
    # renames variables with descriptive names
    # creates and saves a tidy data set in wide format with the average 
        # of each variable for each activity and each subject


#libraries needed
library(dplyr)


#read in data
subjects_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subjects_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")


#prepare data: rename variables 
    # (note, didn't add a variable indicating which dataset (train vs test) since it wasn't used)
subjects_train <- rename(subjects_train, subject = V1)        #change name of V1 to subject
subjects_test <- rename(subjects_test, subject = V1)
y_train <- rename(y_train, activity = V1)                     #change name of V1 to activity
y_test <- rename(y_test, activity = V1)
features <- mutate(features, V3 = paste(V1,V2, sep="_"))      #add a number to the variable names to make them unique
names(x_train) <- features[1:561,3]              #all training variables are renamed using features file
names(x_test) <- features[1:561,3]               #all testing variables are renamed using features file



#1. Merge the training and the test sets to create one data set.
train <- cbind(subjects_train, y_train, x_train)
test <- cbind(subjects_test, y_test, x_test)
messydata <- rbind(train, test)


#2. Extract only the measurements on the mean and standard deviation for each measurement. 
messydata <- select(messydata, subject, activity, matches("(.*)mean[(](.*)|(.*)std[(](.*)"))


#3. Use descriptive activity names to name the activities in the data set
messydata <- mutate(messydata, activity = activity_labels[messydata$activity, 2])


#4. Appropriately label the data set with descriptive variable names. 

#copy variable names to tmp and remove the initial number
tmp <- names(messydata)
tmp <- sub("^[0-9]([0-9]?)([0-9])?_","",tmp)

#substitute descriptive names for each measurement as follows:
  #BodyAcc => acceleration
  #BodyGyr => gyration
  #GravityAcc => gravity
  #Jerk => jerk
tmp <- sub("BodyAcc|BodyBodyAcc", "acceleration", tmp)
tmp <- sub("BodyGyro|BodyBodyGyro", "gyration", tmp)
tmp <- sub("GravityAcc", "gravity", tmp)
tmp <- sub("Jerk", "jerk", tmp)
tmp <- sub("Mag", "", tmp)  #eliminate Mag (will be an alternative for axis)

#split names into 4 parts:
    # domain: time or freq (based on t or f in the original variable name) 
    # measure: acceleration/gyration/gravity with and without jerk
    # axis: Xaxis, Yaxis, Zaxis, or magnitude
    # statistic: mean or std (standard deviation) 
tmp <- strsplit(tmp, "-")
domain <- sapply(tmp, function(x) ifelse(substr(x[1],1,1)=="t", paste("time"), paste("freq")))
measure <- sapply(tmp, function(x) substr(x[1],2,nchar(x[1])))
statistic <- sapply(tmp, function(x) sub("[(])", "", {x[2]}))
axis <- sapply(tmp, function(x) {ifelse(!is.na(x[3]), paste(x[3],"axis",sep=""), paste("magnitude"))})

#reassemble the variable names more descriptively
names(messydata) <- paste(measure, domain, axis, statistic, sep="_")
names(messydata)[1] = "subject"   #returns to original name (subject)
names(messydata)[2] = "activity"   #returns to original name (activity)


#5. From the data set in step 4, creates a second, independent tidy data set
  #  with the average of each variable for each activity and each subject.
  #  Writes tidy data set to a text file called tidydata.txt

tidydata <- summarise_each(group_by(messydata, subject, activity), funs(mean))
write.table(tidydata, file="tidydata.txt", row.names = FALSE)

