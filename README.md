##Coursera Data Science Project
-------------------------------

######Author: Henri MBIYA-NGANDU LUBOYA <hmbiyangandu@yahoo.fr>
------
This project consist of merging a couple of datasets into one dataset and processing some operations 
to get a final sub-dataset that contains the average of each variable for each activity and each subject. 

The project have been developed under R version 3.1.0 (2014-04-10), Platform: x86_64-w64-mingw32/x64 (64-bit)

The script that run the processing operations is called "run_analysis.R" within this repo.
You will also find the CodeBook that describes the variables, the data, and any transformations 
or work that have been performed to clean up the data, in the file called "CodeBook.md"

We assume the data for the project have been unzipped in the working directory i.e the working directory 
contains two sub-directories(train, test) and files at the root and in the two sub-dirctories :

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

After the presentation of the environment we can go and dive in the script:

1- The first thing is to load some usefull packages (if any) that are not loaded by default in the working environment. 
In our case it is the "plyr" package that will be used for summarization operations at the last step.

	library(plyr)

2- After loading package(s), we define variables for all files containing data to be used i.e the train and the test datasets files,
the file containing subject IDs for each dataset,the file containig activity IDs for each dataset, the features file for both the train and the test datasets,  
and the file containing activities IDs and labels. This is to facilitate things in case a change may occur in the directory structure.

	dataTrainFile <- "./train/X_train.txt"
	dataTestFile <- "./test/X_test.txt"

	subjectTrainFile <- "./train/subject_train.txt"
	subjectTestFile <- "./test/subject_test.txt"

	activityTrainFile <- "./train/y_train.txt"
	activityTestFile <- "./test/y_test.txt"

	featuresFIle <- "features.txt"
	activityLabelsFile <- "activity_labels.txt"

3- Reading data from above files and assigning them to variables in the environment.
Considering that data are note CSV, the "read.table" functions goes well in all cases.

	* Reading data on Training and Test in X_train.txt and X_test.txt files in the respective sub-directory
		dataTrain <- read.table(dataTrainFile, colClasses="numeric")
		dataTest <- read.table(dataTestFile, colClasses="numeric")

	* Reading activies IDs on Training and Test in y_train.txt and y_test.txt files in the respective sub-directory
		activityTrain <- read.table(activityTrainFile,col.names=c("activity_id"))
		activityTest <- read.table(activityTestFile,col.names=c("activity_id"))

	* Reading subjects ID on Training and Test dataset in subject_train.txt and subject_test.txt files  in the respective sub-directory
		subjectTrain <- read.table(subjectTrainFile, col.names=c("subject_id"))
		subjectTest <- read.table(subjectTestFile, col.names=c("subject_id"))

	* Reading Activity Labels for both Train and Test Datasets in activity_labels.txt file
		activityLabels <- read.table(activityLabelsFile, col.names=c("activity_id","activity"))

	* Reading features attributs for both Train and Test Datasets in features.txt file
		features <- read.table(featuresFIle)

4- Cleaning columns names to avoid mis-interpretation in future manipulation of columns names in R operations.
We will particularly remove "(" and ")" and replace "-" and "," by "_", the gsub function can do it well.
You will notice that the features data we loaded early have two columns V1 for the ID number and V2 for the label.
In this case we need to clean only the labels in V2 column and reassign the cleaned names to the same column

	features$V2 <- gsub("\\(|\\)","",features$V2)
	features$V2 <- gsub("\\-|,","_",features$V2)

5- Assigning cleaned names in features dataframe to columns in the two separate datasets ( training and test)

	colnames(dataTrain) <- features[,2]
	colnames(dataTest) <- features[,2]

6- Binding respective activity ID and subject ID at each dataset (training and test)

	* Adding Activity columns on dataTrain and dataTest datasets
		dataTrain <- cbind(dataTrain,activityTrain)
		dataTest <- cbind(dataTest,activityTest)

	* Adding Subject columns on dataTrain and dataTest dataset
		dataTrain <- cbind(dataTrain,subjectTrain)
		dataTest <- cbind(dataTest,subjectTest)

7- Merging Training and Test datasets
At this step the two datasets have each one all the necessary information bound in the right way and order,
according to how informations have been provided in two separate sets (training and test). As the two datasets have 
the same number of columns and same labels, we can now merge them without any apprehension. 
For that, the "rbind" function seem to the one that fits well

	mergeData <- rbind(dataTrain,dataTest)

8- Extracting mean and std columns(keep only mean and std columns)
At this step the "grepl" function is welcome. We ask grepl to match mean or std against the columns containing the labels of 
columns we assign at step 5 above, where mean or std are found in the name of the column, grepl return TRUE otherwise FALSE
We can though use that vector to exclude all the column in mergeData where the value returned by grepl is FALSE

	mergeData <- mergeData[,grepl("mean|std",features$V2, ignore.case=T)]

9- Labeling Activities in the Dataset
Here we use "merge" function by joining the mergeData we get above Step 7 and the activityLabels we read in the actvity_labels.txt
The pivot column on which the join is done is activity_id, which actually is in the two dataframe, we also need set the parameter all=TRUE
to get an inner join

	mergeData <- merge(mergeData,activityLabels, by.x="activity_id", by.y="activity_id", all=T)

10- Creating tidy dataset with the average of each variable for each activity and each subject
This is the step where the library we load get into the play. We need from this package the function "ddply" which help in summarizing
dataframe. The parameter to provide are : the dataset to be processed, the columns on which to make the aggregation and the operation to
be processed (in this case, the mean only on numeric columns in the dataset), the result in assigned to the variable tidyData.

	tidyData <- ddply(mergeData, .(activity,subject_id), numcolwise(mean))
	
11- Writing the tidy Dataset
As CSV file are not accepted to be uploaded on Coursera, we choose write.table to produce a txt file with space as fields separation character.
This is the final output file asked as per the specifications in the project. The file is also written in the working directory.
Parameter are : the dataset to write, the destination path for the file and the third parm which avoid producing names of columns (Not necessary here) 
	
	write.table(tidyData,"tidyData.txt", row.names = FALSE)