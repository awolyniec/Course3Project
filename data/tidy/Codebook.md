# Summary Data on UCI HAR Dataset
Partial subset of original data, as well as some summary statistics

## Files

- measurementFeatures.csv

This file contains a partial subset of the data in `data/raw/UCI HAR Dataset`. The
original data contained a number of inertial signals (linear acceleration, angular
velocity, and a number of other signals derived from these) collected by a device
across multiple observations, as well as a series of summary statistics for each
observation (For a full explanation of this data, see `data/raw/UCI HAR Dataset/README.txt`).
All of the summary statistics that represented a) the mean of an inertial signal
across a single observation, or b) the standard deviation of an inertial signal across
a single observation were collected. Data was collected from both the training
and the test sets. 
  Columns in this dataset:
  | Column Name | Feature Name in Raw Dataset | Units | Explanation |
  | ----------- | --------------------------- | ----- | ----------- |
  | Body_Linear_Acceleration_Mean_X_Axis | tBodyAcc-mean()-X | g | |
  

- Quote the original README, explaining what each record was in the original dataset (several features related to 1 observation of the device)
- This file combines the test and training data from the raw dataset, and includes
  a subset of the features in the original dataset. These features are summary (mean/std)
  statistics of signals recorded in a single device observation,
- List activity and subject, as well as their ranges
- List features as follows:
  - Feature Name  Original Name in raw dataset  Units Explanation

measurementFeaturesBySubjectActivity.csv
- This file contains the mean of every feature value in measurementFeatures.csv, over all
observations of a given subject doing a given activity (so, 1 WALKING, 1 LAYING, 2 WALKING, 2 LAYING, etc...)
- Each record is a combination of subject and activity
- The Activity and Subject columns are the same variables seen in measurementFeatures.csv
- Each other column in this file is "Mean_", followed by the name of one of the 
variables in measurementFeatures.csv. It represents the mean of the variable across
all observations of subject <subject> doing activity <activity> in measurementFeatures.csv.