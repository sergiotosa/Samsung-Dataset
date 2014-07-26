run_analysis <- function() {
  ## Read channel names
  channel_names<-read.table("features.txt")
  channel_names<-channel_names[,2] 
  ## Read test values for test data
  test_data<-read.table("test/X_test.txt")
  ## Read test values for train data
  train_data<-read.table("train/X_train.txt")
  ## Join test and train data and add column names for each channel
  data<-rbind(test_data,train_data)
  names(data)<-channel_names
  ## Find column names with mean and std string
  data<-data[,names(data[grep(pattern="mean\\(\\)|std\\(\\)",names(data))])]
  
  ## Read user for train and test data
  test_user<-read.table("test/subject_test.txt")
  train_user<-read.table("train/subject_train.txt")
  user<-rbind(test_user,train_user)
  names(user)[1]<-"User"
  
  ## Read activity for train and test data
  test_activity<-read.table("test/y_test.txt")
  train_activity<-read.table("train/y_train.txt")
  activity<-rbind(test_activity,train_activity)
  names(activity)[1]<-"Activity Code"
  encabezado<-c("Activity")
  activity[,encabezado]<-NA
  l<-dim(activity)[1]
  for (i in 1:l){
    if (activity[i,1]==1){activity[i,2]="WALKING"}
    if (activity[i,1]==2){activity[i,2]="WALKING_UPSTAIRS"}
    if (activity[i,1]==3){activity[i,2]="WALKING_DOWNSTAIRS"}
    if (activity[i,1]==4){activity[i,2]="SITTING"}
    if (activity[i,1]==5){activity[i,2]="STANDING"}
    if (activity[i,1]==6){activity[i,2]="LAYING"}
  }
  final_data<-cbind(activity,user,data)
  final_data<-final_data[order(final_data$"User",final_data$"Activity Code"),]
  
  ## Split by subset and calculate the mean of each subset
  output<-sapply(split(final_data,list(final_data$User,final_data$Activity)),mean)
  output<-t(output)
  output<-output[order(output[,3],output[,1]),]
  for (i in 1:180){
    if (output[i,1]==1){output[i,2]="WALKING"}
    if (output[i,1]==2){output[i,2]="WALKING_UPSTAIRS"}
    if (output[i,1]==3){output[i,2]="WALKING_DOWNSTAIRS"}
    if (output[i,1]==4){output[i,2]="SITTING"}
    if (output[i,1]==5){output[i,2]="STANDING"}
    if (output[i,1]==6){output[i,2]="LAYING"}
  }
  assign("output", output, envir = .GlobalEnv)
}
