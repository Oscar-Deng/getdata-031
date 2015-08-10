# Introduction

The script `run_analysis.R` performs the 5 steps described in the course project's definition.
Step 1: Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4: Appropriately labels the data set with descriptive variable names. 
Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`read.table()` Read in datasets
`rbind()` binds two sets into one
`grep()` subtract colnames with `mean()` or `std()`
Then we give the cols correct names by `features.txt`
From `activity_label.txt` we take activity IDs and names
Finally, generate a new dataset and save as txt file

# Variables
* `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
* Having `x.tr` `y.tr` `s.tr` `x.te` `y.te` `s.te` to be `x_train.txt`, `y_train.txt`, `x_test.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt` (files downloaded)
* `x.dt` `y.dt` `s.dt` merges test and train data together
* `fts` load from "features" , contains the correct names for the `x.dt` dataset, applying to the col names stored in `fts_m.s`.
* `con` merges `x.dt`, `y.dt` and `s.dt` to a big set. (`cbind()`)
* `ave.dt` contains the relevant averages which will be later stored in `average_dataset.txt`,
* `write.table` saves our data`(ave.dt)` to `txt file`, without rownames





