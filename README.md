Program Assignment for Coursera Course "Getting and Cleaning Data Course"
Program created by: Jorge Da Silva
Username: jdasilva22
Program written in R
V 1.0 Original Release 1/3/2017

The purpose of the script is to read, clean, combine, and summarize the prespecified "UCL HAR Dataset"

Background:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The Github directory contains the following files:


The Github directory contains the following files:
	tidydata.csv ---- contains a tidy data set, which is one of the outputs of the runanalysis() function
	summarydata.csv --- the seond output from the runanalysis() function.  Uses the data set from tidydata to create an average for each variable for 			each activity and each subject 
	CodeBook.md ---- a code book that describes the variables, the data, and the transformations that were peformed
	run_analysis.R --- A script that transforms the "UCl HAR Daaset" into a tidy data set, and a second summarized data set. 
	 
The run_analysis.R script contains the function runanalysis(optional x) which used to clean, combine, and summarize the berkley accelerometer data
	Function Inputs - x is an optional string arugment containing the directory location of the unzipped folder "UCI HAR Dataset".
		If x is not suppled the file directory defaults to the R working directory.  The "UCl HAR Dataset" must be in the provided/working 				directory for the function to run properly. 		

	The function writes two seperate csv files to the working/passed directory
		File 1: "tidydata.csv" contains a data table that:
			1)Merges the training and the test sets to create one data set.
			2)Extracts only the measurements on the mean and standard deviation for each measurement.
			3)Uses descriptive activity names to name the activities in the data set
			4)Appropriately labels the data set with descriptive variable names.
  		File 2: "summarydata.csv" Using the data set from file 1, file 2 is a second independent csv file containing 
			a tidy data set with the average of each variable for each activity and each subject.

End of ReadMe File