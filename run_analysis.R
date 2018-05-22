initialwd<-getwd()

testdir<-paste0(initialwd,"/test")
traindir<-paste0(initialwd,"/train")


#read id and names of activities  from activity_labels.txt
activity<-read.table("activity_labels.txt")
names(activity)<-c("activityid","activityname")

# read names of columns for initial datasets
features<-read.table("features.txt")

# read test dataset
setwd(testdir)
xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")  
subjecttest<-read.table("subject_test.txt")

# labels the data set with descriptive variable names using names of variables from  features.txt
names(xtest)<-features$V2
names(subjecttest)<-c("subjectid")

#combine test data to one dataset
finaltest<-cbind(subjecttest,xtest)
# get names of activities instead of id for test dataset
names(ytest)<-c("activityid")
testactivities<-merge(ytest,activity,by.x = "activityid",by.y = "activityid", sort = FALSE)
finaltest<-cbind(testactivities["activityname"],finaltest)

#read train data
setwd(traindir)
xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")  
subjecttrain<-read.table("subject_train.txt")

# labels the data set with descriptive variable names using names of variables from  features.txt
names(xtrain)<-features$V2
names(subjecttrain)<-c("subjectid")

#combine train data to one dataset
finaltrain<-cbind(subjecttrain,xtrain)
# get names of activities instead of id for train dataset
names(ytrain)<-c("activityid")
trainactivities<-merge(ytrain,activity,by.x = "activityid",by.y = "activityid", sort = FALSE)
finaltrain<-cbind(trainactivities["activityname"],finaltrain)

# Merges the training and the test sets to create one data set.
finaldataset <- rbind(finaltrain,finaltest)

#Extracts only the measurements on the mean and standard deviation for each measurement
selds<-grep("mean\\()|std\\()",names(finaldataset))
meanandstddata<-finaldataset[,c(1,2,selds)]

#remove some simbols from column names
tmpnames<-names(meanandstddata)
tmpnames<-gsub("\\()","",tmpnames)
tmpnames<-gsub("-","",tmpnames)
names(meanandstddata)<-tmpnames

#ceate a second, independent tidy data set with the average of each variable for each activity and each subject
groupeddata<-group_by(meanandstddata,activityname,subjectid)
avgdata<- groupeddata %>% summarise_at(vars(tBodyAccmeanX:fBodyBodyGyroJerkMagstd), mean, na.rm = TRUE)

setwd(initialwd)