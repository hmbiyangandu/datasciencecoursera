#
# Author: Henri MBIYA-NGANDU LUBOYA <hmbiyangandu@yahoo.fr>
#

# Loading plyr package
library(plyr)

# Defining Paths of files to be loaded
dataTrainFile <- "./train/X_train.txt"
dataTestFile <- "./test/X_test.txt"

subjectTrainFile <- "./train/subject_train.txt"
subjectTestFile <- "./test/subject_test.txt"

activityTrainFile <- "./train/y_train.txt"
activityTestFile <- "./test/y_test.txt"

featuresFIle <- "features.txt"
activityLabelsFile <- "activity_labels.txt"

# Reading Train and Test dataset from files
dataTrain <- read.table(dataTrainFile, colClasses="numeric")
dataTest <- read.table(dataTestFile, colClasses="numeric")

# Reading activies on Train and Test dataset
activityTrain <- read.table(activityTrainFile,col.names=c("activity_id"))
activityTest <- read.table(activityTestFile,col.names=c("activity_id"))

# Reading subjects on Train and Test dataset
subjectTrain <- read.table(subjectTrainFile, col.names=c("subject_id"))
subjectTest <- read.table(subjectTestFile, col.names=c("subject_id"))

# Reading features attributs for both Train and Test Datasets
features <- read.table(featuresFIle)

# Cleanning features' names :remove ( and ), replace - and , by _
features$V2 <- gsub("\\(|\\)","",features$V2)
features$V2 <- gsub("\\-|,","_",features$V2)

# Reading Activity Labels for both Train and Test Datasets
activityLabels <- read.table(activityLabelsFile, col.names=c("activity_id","activity"))

# setting colnames for Train and Test dataset
colnames(dataTrain) <- features[,2]
colnames(dataTest) <- features[,2]

# Adding Activity columns on dataTrain and dataTest datasets
dataTrain <- cbind(dataTrain,activityTrain)
dataTest <- cbind(dataTest,activityTest)

# Adding Subject columns on dataTrain and dataTest dataset
dataTrain <- cbind(dataTrain,subjectTrain)
dataTest <- cbind(dataTest,subjectTest)

# Merging Train and Test datasets
mergeData <- rbind(dataTrain,dataTest)

# Subsetting the dataset: keep only mean and std columns
mergeData <- mergeData[,grepl("mean|std",features$V2, ignore.case=T)]

# Labeling Activities in the Dataset
mergeData <- merge(mergeData,activityLabels, by.x="activity_id", by.y="activity_id", all=T)

# Creating tidy dataset with the average of each variable for each activity and each subject
tidyData <- ddply(mergeData, .(activity,subject_id), numcolwise(mean))
write.table(tidyData,"tidyData.txt", row.names = FALSE)
