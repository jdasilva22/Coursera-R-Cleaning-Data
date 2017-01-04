The original data for the project:can be obtained via the following link.  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The runanalysis() function in the run_analysis.R script takes an optional directory where the "UCL HAR Dataset" is located.  If a directory is not passed the function assumes the data set is located in the R working directory. The function will not run if the directory of the dataset is not supplied.

1) The function reads the following files from the "UCL HAR Dataset"
		UCI HAR Dataset/train/subject_train.txt 
		UCI HAR Dataset/train/X_train.txt
		UCI HAR Dataset/train/y_train.txt
		UCI HAR Dataset/test/subject_test.txt
		UCI HAR Dataset/test/X_test.txt
		UCI HAR Dataset/test/y_test.txt
		UCI HAR Dataset/features.txt
		UCI HAR Dataset/activity_labels.txt
2) Column names are added to both the subject test and train data sets
3) A new column "data_set" is added to both the subect test and subject train data sets to denote which data set each particular observation belongs to
4) Column names for the output files is cleaned using the data set located in the features.txt file. All special characters "(),-" in the column names are removed
5) The test and training data sets are combined for (subjects, X, and y)
6) The cleaned column names are added to X data set
7) The X data set is simplified to just contain Mean and Std variables
8) Descriptive activity names are added to the "activity id" in the y data set
9) The tidy data set is created by combining the columns in the (subjects, y, and X) data sets
10) A second data set is created that summarizes the tidy data with the average of each variable for each activity and each subject

Variable names and descriptions are provided below for each of the two output files.
 
File tidydata.csv

Variable		Class-Description
--------------	-----------------------
subject_num	Factor -Denotes the corresponding subject number for each particular measurement. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.	
data_set		Factor- Specifices whether the observation originated from the "test" or "train" data set
activity_id		Num- arbitrary ID number associated with each activity
activity		Factor- denotes the activity that was being performed.  There were a total of 6 activities captured (LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING_UPSTAIRS)
tBodyAccmeanX	A description for the following features can be found in features_info.txt file which is located in the UCL HAR Dataset All special characters were stripped from the original feature names
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean
tGravityAccMagmean
tBodyAccJerkMagmean
tBodyGyroMagmean
tBodyGyroJerkMagmean
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccmeanFreqX
fBodyAccmeanFreqY
fBodyAccmeanFreqZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyAccJerkmeanFreqX
fBodyAccJerkmeanFreqY
fBodyAccJerkmeanFreqZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyGyromeanFreqX
fBodyGyromeanFreqY
fBodyGyromeanFreqZ
fBodyAccMagmean
fBodyAccMagmeanFreq
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagmeanFreq
fBodyBodyGyroMagmean
fBodyBodyGyroMagmeanFreq
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagmeanFreq
angletBodyAccMeangravity
angletBodyAccJerkMeangravityMean
angletBodyGyroMeangravityMean
angletBodyGyroJerkMeangravityMean
angleXgravityMean
angleYgravityMean
angleZgravityMean

File summarydata.csv 
Contains all of the same variables as in tidydata with the exception that activity_id and data_set variables are not included.  Also rather than listing each unique observation summarydata, simply provides the mean for each activity for each subject number 

End of CodeBook.md