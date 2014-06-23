## Study Design
---------------
This project consist of merging a couple of datasets into one dataset and processing some operations 
to get a final sub-dataset that contains the average of each variable for each activity and each subject. 

The datasets to merge came from Human Activity Recognition Using Smartphones Dataset Version 1.0 ,
Which are experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. You can have more details on www.smartlab.ws

All the data we need will be provided by the following files: 

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels. 

The project have been developed under R version 3.1.0 (2014-04-10), Platform: x86_64-w64-mingw32/x64 (64-bit).

## Code Book
------------

1-  activity
	Names of activity performed in the experiment.
	Possible values : WALKING, SITTING, STANDING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.
	
2-  subject_id
	Unique ID number, identifying the person who performed the experience.
	Possible values: 1 ... 30
	
3-  activity_id
	Unique ID number identifying an activity.
	Possible values : 1 ... 6
	
4-  tBodyAcc_mean_X
	Time domain signal measuring the average by activity and by subject of the Body Acceleration on the X axis.
	Possible values : 0.2216 ... 0.3015
	
5-  tBodyAcc_mean_Y
	Time domain signal measuring the average by activity and by subject of the Body Acceleration on the Y axis.
	Possible values : -0.040514 ... -0.001308
	
6-  tBodyAcc_mean_Z
	Time domain signal measuring the average by activity and by subject of the Body Acceleration on the Z axis.
	Possible values : -0.15251 ... -0.07538
	
7-  tBodyAcc_std_X
	Time domain signal measuring the average by activity and by subject of the Body Acceleration Standard deviation on the X axis.
	Possible values : -0.9961 ... 0.6269
	
8-  tBodyAcc_std_Y
	Time domain signal measuring the average by activity and by subject of the Body Acceleration Standard deviation on the Y axis.
	Possible values : -0.99024 ... 0.61694
	
9-  tBodyAcc_std_Z
	Time domain signal measuring the average by activity and by subject of the Body Acceleration Standard deviation on the Z axis.
	Possible values : -0.9877 ... 0.6090
	
10- tGravityAcc_mean_X
	Time domain signal measuring the average by activity and by subject of the Gravity Acceleration on the X axis.
	Possible values : -0.6800 ... 0.9745
	
11- tGravityAcc_mean_Y
	Time domain signal measuring the average by activity and by subject of the Gravity Acceleration on the X axis.
	Possible values : -0.47989 ... 0.95659
	
12- tGravityAcc_mean_Z
	Time domain signal measuring the average by activity and by subject of the Gravity Acceleration on the X axis.
	Possible values : -0.49509 ... 0.95787
	
13- tGravityAcc_std_X

14- tGravityAcc_std_Y

15- tGravityAcc_std_Z

16- tBodyAccJerk_mean_X

17- tBodyAccJerk_mean_Y

18- tBodyAccJerk_mean_Z

19- tBodyAccJerk_std_X

20- tBodyAccJerk_std_Y

21- tBodyAccJerk_std_Z

22- tBodyGyro_mean_X

23- tBodyGyro_mean_Y

24- tBodyGyro_mean_Z

25- tBodyGyro_std_X

26- tBodyGyro_std_Y

27- tBodyGyro_std_Z

28- tBodyGyroJerk_mean_X

29- tBodyGyroJerk_mean_Y

30- tBodyGyroJerk_mean_Z

31- tBodyGyroJerk_std_X

32- tBodyGyroJerk_std_Y

33- tBodyGyroJerk_std_Z

34- tBodyAccMag_mean

35- tBodyAccMag_std

36- tGravityAccMag_mean

37- tGravityAccMag_std

38- tBodyAccJerkMag_mean

39- tBodyAccJerkMag_std

40- tBodyGyroMag_mean

41- tBodyGyroMag_std

42- tBodyGyroJerkMag_mean

43- tBodyGyroJerkMag_std

44- fBodyAcc_mean_X

45- fBodyAcc_mean_Y

46- fBodyAcc_mean_Z

47- fBodyAcc_std_X

48- fBodyAcc_std_Y

49- fBodyAcc_std_Z

50- fBodyAcc_meanFreq_X

51- fBodyAcc_meanFreq_Y

52- fBodyAcc_meanFreq_Z

53- fBodyAccJerk_mean_X

54- fBodyAccJerk_mean_Y

55- fBodyAccJerk_mean_Z

56- fBodyAccJerk_std_X

57- fBodyAccJerk_std_Y

58- fBodyAccJerk_std_Z

59- fBodyAccJerk_meanFreq_X

60- fBodyAccJerk_meanFreq_Y

61- fBodyAccJerk_meanFreq_Z

62- fBodyGyro_mean_X

63- fBodyGyro_mean_Y

64- fBodyGyro_mean_Z

65- fBodyGyro_std_X

66- fBodyGyro_std_Y

67- fBodyGyro_std_Z

68- fBodyGyro_meanFreq_X

69- fBodyGyro_meanFreq_Y

70- fBodyGyro_meanFreq_Z

71- fBodyAccMag_mean

72- fBodyAccMag_std

73- fBodyAccMag_meanFreq

74- fBodyBodyAccJerkMag_mean

75- fBodyBodyAccJerkMag_std

76- fBodyBodyAccJerkMag_meanFreq

77- fBodyBodyGyroMag_mean

78- fBodyBodyGyroMag_std

79- fBodyBodyGyroMag_meanFreq

80- fBodyBodyGyroJerkMag_mean

81- fBodyBodyGyroJerkMag_std

82- fBodyBodyGyroJerkMag_meanFreq

83- angletBodyAccMean_gravity

84- angletBodyAccJerkMean_gravityMean

85- angletBodyGyroMean_gravityMean

86- angletBodyGyroJerkMean_gravityMean

87- angleX_gravityMean

88- angleY_gravityMean

89- angleZ_gravityMean