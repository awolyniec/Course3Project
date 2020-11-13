# Summary Data on UCI HAR Dataset
Partial subset of original data, as well as some summary statistics

## Files

#### 1- `measurementFeatures.txt`

This file contains a partial subset of the data in `data/raw/UCI HAR Dataset`. The
original data contained a number of inertial signals (linear acceleration, angular
velocity, and a number of other signals derived from these) collected by a device
across multiple observations, as well as a series of summary statistics for each
observation (For a full explanation of this data, see `data/raw/UCI HAR Dataset/README.txt`).
All of the summary statistics that represented a) the mean of an inertial signal
across a single observation, or b) the standard deviation of an inertial signal across
a single observation were collected. Data was collected from both the training
and the test sets.

- Subject values were derived from `data/raw/UCI HAR Dataset/test/subject_test.txt` and `data/raw/UCI HAR Dataset/train/subject_train.txt`
- Activity values were derived from `data/raw/UCI HAR Dataset/train/y_train.txt` and `data/raw/UCI HAR Dataset/test/y_test.txt`. The labels were derived from `data/raw/UCI HAR Dataset/activity_labels.txt`. The labels, rather than the numeric values, were used.
- Feature values were derived from `data/raw/UCI HAR Dataset/train/X_train.txt` and `data/raw/UCI HAR Dataset/test/X_test.txt`
- Feature names were derived from `data/raw/UCI HAR Dataset/features.txt`

Each record in this dataset represents one record in the original dataset.

  | Column Name | Feature Name in Raw Dataset | Units | Range | Explanation |
  | ----------- | --------------------------- | ----- | ----- | ----------- |
  | Subject | | | See `data/raw/UCI HAR Dataset/README.txt` | |
  | Activity | | | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |  |
  | Body_Linear_Acceleration_Mean_X_Axis | tBodyAcc-mean()-X | g | | |
  | Body_Linear_Acceleration_Mean_Y_Axis | tBodyAcc-mean()-Y | g | | |
  | Body_Linear_Acceleration_Mean_Z_Axis | tBodyAcc-mean()-Z | g | | |
  | Body_Linear_Acceleration_Standard_Deviation_X_Axis | tBodyAcc-std()-X | g | | |
  | Body_Linear_Acceleration_Standard_Deviation_Y_Axis | tBodyAcc-std()-Y | g | | |
  | Body_Linear_Acceleration_Standard_Deviation_Z_Axis | tBodyAcc-std()-Z | g | | |
  | Gravity_Linear_Acceleration_Mean_X_Axis | tGravityAcc-mean()-X | g | | |
  | Gravity_Linear_Acceleration_Mean_Y_Axis | tGravityAcc-mean()-Y | g | | |
  | Gravity_Linear_Acceleration_Mean_Z_Axis | tGravityAcc-mean()-Z | g | | |
  | Gravity_Linear_Acceleration_Standard_Deviation_X_Axis | tGravityAcc-std()-X | g | | |
  | Gravity_Linear_Acceleration_Standard_Deviation_Y_Axis | tGravityAcc-std()-Y | g | | |
  | Gravity_Linear_Acceleration_Standard_Deviation_Z_Axis | tGravityAcc-std()-Z | g | | |
  | Body_Linear_Acceleration_Jerk_Mean_X_Axis | tBodyAccJerk-mean()-X | g/s | | |
  | Body_Linear_Acceleration_Jerk_Mean_Y_Axis | tBodyAccJerk-mean()-Y | g/s | | |
  | Body_Linear_Acceleration_Jerk_Mean_Z_Axis | tBodyAccJerk-mean()-Z | g/s | | |
  | Body_Linear_Acceleration_Jerk_Standard_Deviation_X_Axis | tBodyAccJerk-std()-X | g/s | | |
  | Body_Linear_Acceleration_Jerk_Standard_Deviation_Y_Axis | tBodyAccJerk-std()-Y | g/s | | |
  | Body_Linear_Acceleration_Jerk_Standard_Deviation_Z_Axis | tBodyAccJerk-std()-Z | g/s | | |
  | Body_Angular_Acceleration_Mean_X_Axis | tBodyGyro-mean()-X | r/s^2 | | |
  | Body_Angular_Acceleration_Mean_Y_Axis | tBodyGyro-mean()-Y | r/s^2 | | |
  | Body_Angular_Acceleration_Mean_Z_Axis | tBodyGyro-mean()-Z | r/s^2 | | |
  | Body_Angular_Acceleration_Standard_Deviation_X_Axis | tBodyGyro-std()-X | r/s^2 | | |
  | Body_Angular_Acceleration_Standard_Deviation_Y_Axis | tBodyGyro-std()-Y | r/s^2 | | |
  | Body_Angular_Acceleration_Standard_Deviation_Z_Axis | tBodyGyro-std()-Z | r/s^2 | | |
  | Body_Angular_Acceleration_Jerk_Mean_X_Axis | tBodyGyroJerk-mean()-X | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Mean_Y_Axis | tBodyGyroJerk-mean()-Y | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Mean_Z_Axis | tBodyGyroJerk-mean()-Z | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Standard_Deviation_X_Axis | tBodyGyroJerk-std()-X | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Standard_Deviation_Y_Axis | tBodyGyroJerk-std()-Y | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Standard_Deviation_Z_Axis | tBodyGyroJerk-std()-Z | r/s^3 | | |
  | Body_Linear_Acceleration_Magnitude_Mean | tBodyAccMag-mean() | g | | |
  | Body_Linear_Acceleration_Magnitude_Standard_Deviation | tBodyAccMag-std() | g | | |
  | Gravity_Linear_Acceleration_Magnitude_Mean | tGravityAccMag-mean() | g | | |
  | Gravity_Linear_Acceleration_Magnitude_Standard_Deviation | tGravityAccMag-std() | g | | |
  | Body_Linear_Acceleration_Jerk_Magnitude_Mean | tBodyAccJerkMag-mean() | g/s | | |
  | Body_Linear_Acceleration_Jerk_Magnitude_Standard_Deviation | tBodyAccJerkMag-std() | g/s | | |
  | Body_Angular_Acceleration_Magnitude_Mean | tBodyGyroMag-mean() | r/s^2 | | |
  | Body_Angular_Acceleration_Magnitude_Standard_Deviation | tBodyGyroMag-std() | r/s^2 | | |
  | Body_Angular_Acceleration_Jerk_Magnitude_Mean | tBodyGyroJerkMag-mean() | r/s^3 | | |
  | Body_Angular_Acceleration_Jerk_Magnitude_Standard_Deviation | tBodyGyroJerkMag-std() | r/s^3 | | |
  | Frequency_Domain_Body_Linear_Acceleration_Mean_X_Axis | fBodyAcc-mean()-X | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Mean_Y_Axis | fBodyAcc-mean()-Y | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Mean_Z_Axis | fBodyAcc-mean()-Z | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_X_Axis | fBodyAcc-std()-X | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_Y_Axis | fBodyAcc-std()-Y | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_Z_Axis | fBodyAcc-std()-Z | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_X_Axis | fBodyAccJerk-mean()-X | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_Y_Axis | fBodyAccJerk-mean()-Y | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_Z_Axis | fBodyAccJerk-mean()-Z | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_X_Axis | fBodyAccJerk-std()-X | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_Y_Axis | fBodyAccJerk-std()-Y | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_Z_Axis | fBodyAccJerk-std()-Z | s/g | | |
  | Frequency_Domain_Body_Angular_Acceleration_Mean_X_Axis | fBodyGyro-mean()-X | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Mean_Y_Axis | fBodyGyro-mean()-Y | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Mean_Z_Axis | fBodyGyro-mean()-Z | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_X_Axis | fBodyGyro-std()-X | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_Y_Axis | fBodyGyro-std()-Y | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_Z_Axis | fBodyGyro-std()-Z | s^2/r | | |
  | Frequency_Domain_Body_Linear_Acceleration_Magnitude_Mean | fBodyAccMag-mean() | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Magnitude_Standard_Deviation | fBodyAccMag-std() | 1/ g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Magnitude_Mean | fBodyBodyAccJerkMag-mean() | s/g | | |
  | Frequency_Domain_Body_Linear_Acceleration_Jerk_Magnitude_Standard_Deviation | fBodyBodyAccJerkMag-std() | s/g | | |
  | Frequency_Domain_Body_Angular_Acceleration_Magnitude_Mean | fBodyBodyGyroMag-mean() | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Magnitude_Standard_Deviation | fBodyBodyGyroMag-std() | s^2/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Jerk_Magnitude_Mean | fBodyBodyGyroJerkMag-mean() | s^3/r | | |
  | Frequency_Domain_Body_Angular_Acceleration_Jerk_Magnitude_Standard_Deviation | fBodyBodyGyroJerkMag-std() | s^3/r | | |

#### 2- `measurementFeaturesBySubjectActivity.txt`

This file contains the mean of every feature value in `measurementFeatures.txt`, over all
observations of a given subject doing a given activity (so, 1 WALKING, 1 LAYING, 2 WALKING, 2 LAYING, etc...).

Each record in this dataset represents a combination of activity and subject in the original dataset.

  - Activity - Same as in `measurementFeatures.txt`
  - Subject - Same as in `measurementFeatures.txt`
  - Each other column in this file is "Mean_", followed by the name of one of the 
variables in `measurementFeatures.txt`. It represents the mean of the variable across
all observations of subject <subject> doing activity <activity> in `measurementFeatures.txt`.