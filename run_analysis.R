library(plyr)
analysis <- function(){
# S1 Read in and merge datasets

x.tr <- read.table("train/X_train.txt")
y.tr <- read.table("train/y_train.txt")
s.tr <- read.table("train/subject_train.txt")
x.te <- read.table("test/X_test.txt")
y.te <- read.table("test/y_test.txt")
s.te <- read.table("test/subject_test.txt")
x.dt <- rbind(x.tr, x.te) # create x data set
y.dt <- rbind(y.tr, y.te) # create y data set
s.dt <- rbind(s.tr, s.te) # create subject data set

# S2 Extract mean and std for each measurement

fts <- read.table("features.txt") # Read in features
fts_m.s <- grep("-(mean|std)\\(\\)", fts[, 2]) # get only columns with mean() or std() in names
x.dt <- x.dt[, fts_m.s] # desired col
names(x.dt) <- fts[fts_m.s, 2] # change col name

# S3&4 descriptive activity/variable names

act.lb <- read.table("activity_labels.txt") # read in files and correct col names
y.dt[, 1] <- act.lb[y.dt[, 1], 2]
names(y.dt) <- "activity"
names(s.dt) <- "subject"
# bind all the data in a single data set
con <- cbind(x.dt, y.dt, s.dt)

# S5 Create a second, independent tidy data set with the average
# of each variable for each activity and each subject.

# Remove last 2 col (activity&subject) ... 66 col left
int <- ddply(con, .(subject, activity), function(x) colMeans(x[, 1:66])) 
write.table(int, "tidy_dataset.txt", row.name=FALSE)
print("Done! Please check file 'tidy_dataset.txt'")
}
analysis() # Run function