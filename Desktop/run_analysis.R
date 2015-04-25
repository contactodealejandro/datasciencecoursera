

## Reading Files 
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")

x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")



## Merging dataframes
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)



features <- read.table("features.txt")

## Select columns with mean or std

columnsmean <- grep("mean|std)", features[,2])

## Subsetting desired columns

subsetx <- x[, columnsmean]
names(subsetx) <- features[columnsmean, 2]



## Activities
activities <- read.table("activity_labels.txt")

## Assign name of activites
y[,1] <- activities[y[,1],2]

names(y) <- c("activity")

## Subjects

subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

subject <- rbind(subject_train, subject_test)
names(subject) <- c("subject")

#Attach all to complete the data frame

final_dataframe <- cbind(subsetx,y,subject)

## Getting Tidy Frame

tidy_dataframe <- aggregate(final_dataframe, by=list(activity = final_dataframe$activity, subject=final_dataframe$subject), mean)

write.table(tidy_dataframe, "tidydata.txt", sep="\t"))
