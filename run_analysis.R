#CREATE TIDY DATA PROJECT FOR COURSERA
#Get the zip file first if it is not already in the current working directory
#this is the folder that gets unzipped into
targetFolder <- 'UCI HAR Dataset'

#this is the file name we download from  
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
downloadpath <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
filename <- 'getdata_dataset.zip'

#if the folder exists - we will assume data has already been downloaded and unzipped 
if (!file.exists(targetFolder)) {
        #check if zip file exists
        if (!file.exists(filename)) {
                #file doesn't exist so let us download it
                download.file(downloadpath, filename)
        }
        #We have the compressed zip file so let us unzip into the targetFolder
        unzip(filename)
}

#Now we have the data - we want to do the following in this script:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#First we need to make sure we have the right R packages installed and loaded

if (!require("data.table")) {
        install.packages("data.table")
}
library(data.table)


# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Load: activity labels
activity_labels <- fread(file.path(targetFolder, "activity_labels.txt"),select=c(2)) # only get second column
setnames(activity_labels, c("activity"))  #change the generic V2 column name to 'activity'

# Load: features
features <- fread(file.path(targetFolder,"features.txt"),select=c(2)) # again only 2nd column
setnames(features, c("features")) #change the generic V2 column name to 'features'

# Extract only the measurements on the mean and standard deviation for each measurement.
meanStdDevFeatures<-grepl("mean|std", features$features)

# Load and process X_test & y_test data and subject_test data
X_test <- fread(file.path(targetFolder, "/test/X_test.txt"))
names(X_test) = features$features
X_test<-X_test[,..meanStdDevFeatures]


Y_test <- fread(file.path(targetFolder, "/test/Y_test.txt"))
#add a column that converts numberic values to activity labels
Y_test[,"actname":=activity_labels[Y_test$V1]]
names(Y_test) = c("ActivityID", "ActivityName") # rename columns

#get subject ID for each observation
subject_test <- fread(file.path(targetFolder, "/test/subject_test.txt"))
names(subject_test) = "SubjectID"


# Bind all test data 
#test_data <- cbind(as.data.table(subject_test), y_test, X_test)
test_data<-cbind(subject_test,Y_test,X_test)

#repeat most of above for the train data
# Load and process X_train & y_train data.
X_train <- fread(file.path(targetFolder, "/train/X_train.txt"))
names(X_train) = features$features
X_train<-X_train[,..meanStdDevFeatures]

Y_train <- fread(file.path(targetFolder, "/train/Y_train.txt"))
Y_train[,"actname":=activity_labels[Y_train$V1]]
names(Y_train) = c("ActivityID", "ActivityName")


subject_train  <- fread(file.path(targetFolder, "/train/subject_train.txt"))
names(subject_train) = "SubjectID"

# Bind all train data
train_data<-cbind(subject_train,Y_train,X_train)

# Merge test and train data
test_train_data <- rbind(test_data, train_data)

#setup for melting data
id_labels   = c("SubjectID", "ActivityID", "ActivityName")
data_labels<-setdiff(colnames(test_train_data), id_labels)
melt_data      = melt(test_train_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, SubjectID + ActivityName ~ variable, fun=mean)
#finally write the tidy_data.txt file
write.table(tidy_data, file = "./tidy_data.txt")
