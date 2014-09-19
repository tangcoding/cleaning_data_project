This code is used to clean the Samsung data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. It captured 3-axial linear acceleration and 3-axial angular velocity when people are performing the following six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Both the training and test data have 3 parts: the x part that has the measurement of 3-axial linear acceleration and 3-axial angular velocity; the y part that has the activity name; and the subject part that has the subject number. 

The code will tranform the data with the following steps:

1) The code first reads the measurements for the training and test set in train_x and test_x. The subject and activity associated with each observation are read into train_sub(or test_sub) and train_y (or test_y). 

2) The code assigns the names to the columns in all these data set.

3) The code will selecte the columns in training and test set that contrain the mean and standard deviation for each measurement. The created subsets are s_test_x and s_train_x.

4) The code will combine the test and training data, so each observation will have the measurement of acceleration, the acitivity name and the subject number. The combined data set is called comb_data.

5) The code will do an aggregation to make a tidy data set called agg_data, which has the average of each variable for each activity and each subject. This tidy data set is written to a file called "tidy_data.txt".
