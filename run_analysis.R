##runanalysis.R is a function used to clean, combine, and summarize the berkley accelerometer data
##Inputs - x is an optional string arugment containing the directory location of the unzipped folder "UCI HAR Dataset".
##         If x is not suppled the file directory defaults to the R working directory.		
##Function writes two seperate txt files to the working/passed directory
##  File 1: "tidydata.txt" contains a data table that:
##		1)Merges the training and the test sets to create one data set.
##		2)Extracts only the measurements on the mean and standard deviation for each measurement.
##		3)Uses descriptive activity names to name the activities in the data set
##		4)Appropriately labels the data set with descriptive variable names.
##  File 2: "summarydata.txt" Using the data set from step 1, file 2 is a second independent txt file containing 
##		a tidy data set with the average of each variable for each activity and each subject.

library(plyr)

runanalysis<-function(x){
	if(missing(x)){
	fileloc <- getwd()	
	}
	else{
	fileloc <- x
	}
##Create series of text strings to use when opening files
	fstr_sub_train <- paste0(fileloc,"/UCI HAR Dataset/train/subject_train.txt") 
	fstr_X_train <- paste0(fileloc,"/UCI HAR Dataset/train/X_train.txt")
	fstr_y_train <- paste0(fileloc,"/UCI HAR Dataset/train/y_train.txt")
	fstr_sub_test <- paste0(fileloc,"/UCI HAR Dataset/test/subject_test.txt")
	fstr_X_test <- paste0(fileloc,"/UCI HAR Dataset/test/X_test.txt")
	fstr_y_test <- paste0(fileloc,"/UCI HAR Dataset/test/y_test.txt")
	fstr_features <- paste0(fileloc,"/UCI HAR Dataset/features.txt")
	fstr_activity <- paste0(fileloc,"/UCI HAR Dataset/activity_labels.txt")

##Open, Clean, & Add Column Labels to Data sets
	print(c("Reading Files"))										##Prints status update				
	flush.console()												##Prints before function completes
	subjects_train<-read.table(fstr_sub_train,colClasses="numeric")				##Open and read file
	subjects_train<-data.frame(subjects_train,rep("train",nrow(subjects_train)))		##Adds column denoting observations are from train data
	names(subjects_train)= c("subject_num","data_set")						##Changes column names
	subjects_test<-read.table(fstr_sub_test,colClasses="numeric")				##Open and read file
	subjects_test<-data.frame(subjects_test,rep("test",nrow(subjects_test)))		##Adds column denoting observations are from test data
	names(subjects_test)= c("subject_num","data_set")						##Changes column names
	y_train<-read.table(fstr_y_train,col.names="activity_id",colClasses="factor")					
	y_test<-read.table(fstr_y_test,col.names="activity_id",colClasses="factor")
	activity<-read.table(fstr_activity,col.names=c("activity_id","activity"),colClasses=c("factor","factor"))
	X_train<-read.table(fstr_X_train)
	X_test<-read.table(fstr_X_test)
	features<-read.table(fstr_features,col.names=c("col_id","col_name"))			##reads the feature table and assigns names to the columns

##Removes special characters from feature names
	print(c("Cleaning Files"))										##Prints status update
	flush.console()												##Prints before function completes	
	features[]<-lapply(features,function(x) gsub("[(),-]","",x))	
	features$col_id<-as.numeric(features$col_id)

##Combine Train and Test Data sets
	subjects<- rbind(subjects_train,subjects_test)
	y<- rbind(y_train,y_test)
	X<- rbind(X_train,X_test)	

##Add all columns names to X table
	names(X) <- features$col_name
	
## Pulls just the standard deviation and mean column names
	features2<-features[union(grep("[Mm]ean",features$col_name),grep("[Ss]td.",features$col_name)),]  ##Creates a vector with just mean and std column names
	features2<-features2[order(features2$col_id),]						## ranks the features table by col ID
	X<-X[,features2$col_name]									##subsets the X table to pull just std and mean columns	
##Join Data Frames 
	print(c("Creating Output Files"))
	flush.console()
	y_activity <- join(y,activity,by="activity_id")
	data<-data.frame(subjects,y_activity,X)

##creates output table 
	groups<-list(data$activity,data$subject_num)
	data2<-aggregate(data[,features2$col_name],groups,FUN="mean")
	colnames(data2)[1:2]<-c("activity","subject_num")
	data2<-data2[order(data2$activity,data2$subject_num),]
	
##Writes files
	print(c("Writing Files"))
	flush.console()
	write.table(data,paste0(fileloc,"/tidydata.txt"),row.names=FALSE)
	write.table(data2,paste0(fileloc,"/summarydata.txt"),row.names=FALSE)
	print(c("Run Analysis Complete"))
}