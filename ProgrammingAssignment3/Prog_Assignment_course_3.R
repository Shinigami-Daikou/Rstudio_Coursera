##The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.
##The goal is to prepare tidy data that can be used for later analysis.


##Download and unzip the data
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',destfile = 'UCI HAR Dataset.zip',method = 'curl')
unzip('UCI HAR Dataset.zip')



##Load the datasets
##But the data has to be in your Working Directory
activity_labels<-read.table('./activity_labels.txt')
features<-read.table('./features.txt')
features$V2<-gsub("\\()","",features$V2)
subject_train<-read.table('./train/subject_train.txt')
X_train<-read.table('./train/X_train.txt')
y_train<-read.table('./train/y_train.txt')
subject_test<-read.table('./test/subject_test.txt')
X_test<-read.table('./test/X_test.txt')
y_test<-read.table('./test/y_test.txt')



##Tidying the data set by assigning Colnames 
colnames(X_train)<-features$V2
colnames(y_train)<-"ID"
colnames(subject_train)<-"TestSubject"

colnames(X_test)<-features$V2
colnames(y_test)<-"ID"
colnames(subject_test)<-"TestSubject"

colnames(activity_labels)<-c('ID','Activity')



##Merges the training and the test sets to create one data set.

train_data<-cbind(y_train,subject_train,X_train)
test_data<-cbind(y_test,subject_test,X_test)
Final_data<-rbind(train_data,test_data)


##Extracts only the measurements on the mean and standard deviation for each measurement.

mean<-grep("mean",colnames(Final_data))
std<-grep("std",colnames(Final_data))

Extracted_data<-Final_data[,c(1,2,mean,std)]


##Uses descriptive activity names to name the activities in the data set

With_Activity_Name<-merge(activity_labels, Extracted_data ,by= "ID")

##Appropriately labeling of the data set with descriptive variable names has already
##achieved during the first step.


##From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

a<-dim(Extracted_data)
col<-colnames(Extracted_data)
col<-c("Activity",col[c(1,3:a[2])])
n<-split(Extracted_data[c(1,3:a[2])],Extracted_data$ID)
Tidy_table<-data.frame()
for(i in n){
      Tidy_table<-rbind(Tidy_table,apply(i,2,mean))
}
Tidy_table<-merge(activity_labels,Tidy_table,by.x = "ID",by.y = "X1")
colnames(Tidy_table)<-col[c(2,1,3:a[2])]

##Writing the dataset into a txt file

write.table(Tidy_table,'./Tidy_table.txt')
