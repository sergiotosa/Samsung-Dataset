Samsung-Dataset
===============

Repo for the job to be done in coursera.
==================================================================
Human Activity Recognition Using Smartphones Dataset Analysis
Version 1.0
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

On the working directory, three files and two directories are mandatory.
Files are the following ones
'activity_labels.txt': Links the class labels with their activity name.
'features.txt': List of all features with time and frequency domain variables.

Directories are the following ones
'test' with the following files
  'subject_test.txt': test User id in order against the test set.
  'test/X_test.txt': Test set.
  'test/y_test.txt': Test labels.

'train' with the following files
  'subject_train.txt': test User id in order against the train set.
  'train/X_train.txt': Training set.
  'train/y_train.txt': Training labels.

Analysis do the following treatment based on initial data:
Merge both test and train data
Obtain means values for each serie only for signals with mean and std string on its name
Display outcome file with the mean value for each user and activity.
Furhter analysis can be done based on this file
Enjoy!
