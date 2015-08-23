
## read data, subject and activities

library(reshape2)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

x_merged <- rbind(x_train,x_test)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_merged <- rbind(y_train,y_test)

sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
sub_merged <- rbind(sub_train,sub_test)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Pick up only mean and standard deviation measures 

features <- read.table("./UCI HAR Dataset/features.txt")
required_vectors <- grep('mean|std',features[,2])
features_req_names <- features[required_vectors,]

x_trunc <- x_merged[,required_vectors]

# Merge Overall data and rename with activity labels

Data <- cbind(sub_merged,y_merged,x_trunc)

colnames(Data) <- c("Subject","Activity",as.character(features_req_names[,2]))

Data$Activity <- factor(Data$Activity,levels = activity_labels[,1],labels = activity_labels[,2])
Data$Subject <- as.factor(Data$Subject)


# new data with mean across subject and activities 

new_Data <- melt(Data,id = c("Subject","Activity"))

Mean_Data <- dcast(new_Data, Subject + Activity ~ variable, mean)

write.table(Mean_Data,"./CourseProjectTidyData.txt")









