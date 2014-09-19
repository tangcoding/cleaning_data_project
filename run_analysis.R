# read data and check the dimensions
train_x<-read.table("train/x_train.txt")
train_y<-read.table("train/y_train.txt")
train_sub<-read.table("train/subject_train.txt")
dim(train_x); dim(train_y); dim(train_sub)

test_x<-read.table("test/x_test.txt")
test_y<-read.table("test/y_test.txt")
test_sub<-read.table("test/subject_test.txt")
dim(test_x); dim(test_y); dim(test_sub)

feature<-read.table("features.txt",stringsAsFactors=F)

# assign column names
names(test_x)<-feature[,2]
names(train_x)<-feature[,2]

names(train_sub)<-"Subject"
names(test_sub)<-"Subject"

names(test_y) <- "Activity"
names(train_y) <- "Activity"

# find columns for mean and std
col_num <- grep("(mean()|std())",feature$V2 ,ignore.case = F)

# Extracts the measurements on the mean and standard deviation for each measurement
s_test_x <- test_x[,col_num]
s_train_x<- train_x[,col_num]

# combine data
tmp_test <- cbind(s_test_x,test_y,test_sub)
tmp_train <- cbind(s_train_x,train_y, train_sub)
comb_data<-rbind(tmp_test, tmp_train)


# read descriptive activity names 
activity<-read.table("activity_labels.txt",stringsAsFactors=F)

#value labels for activity
comb_data$Activity <- factor(comb_data$Activity,levels=activity[,1],labels=activity[,2])

# aggregate
agg_data <- aggregate(.~ Subject + Activity,data= comb_data,FUN=mean)

# write to txt file
write.table(agg_data, file="tidy_data.txt",sep="\t", row.names=FALSE)

