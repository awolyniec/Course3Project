library(dplyr)

## ===========================
## HELPER VARIABLES
## ===========================

numberValuePattern <- "^([0-9]+) (.+)$"
  
## for the measurement features dataset
featureNameToReadableName <- list(
  "tBodyAcc-mean()-X" = "Body_Linear_Acceleration_Mean_X_Axis",
  "tBodyAcc-mean()-Y" = "Body_Linear_Acceleration_Mean_Y_Axis",
  "tBodyAcc-mean()-Z" = "Body_Linear_Acceleration_Mean_Z_Axis",
  "tBodyAcc-std()-X" = "Body_Linear_Acceleration_Standard_Deviation_X_Axis",
  "tBodyAcc-std()-Y" = "Body_Linear_Acceleration_Standard_Deviation_Y_Axis",
  "tBodyAcc-std()-Z" = "Body_Linear_Acceleration_Standard_Deviation_Z_Axis",
  "tGravityAcc-mean()-X" = "Gravity_Linear_Acceleration_Mean_X_Axis",
  "tGravityAcc-mean()-Y" = "Gravity_Linear_Acceleration_Mean_Y_Axis",
  "tGravityAcc-mean()-Z" = "Gravity_Linear_Acceleration_Mean_Z_Axis",
  "tGravityAcc-std()-X" = "Gravity_Linear_Acceleration_Standard_Deviation_X_Axis",
  "tGravityAcc-std()-Y" = "Gravity_Linear_Acceleration_Standard_Deviation_Y_Axis",
  "tGravityAcc-std()-Z" = "Gravity_Linear_Acceleration_Standard_Deviation_Z_Axis",
  "tBodyAccJerk-mean()-X" = "Body_Linear_Acceleration_Jerk_Mean_X_Axis",
  "tBodyAccJerk-mean()-Y" = "Body_Linear_Acceleration_Jerk_Mean_Y_Axis",
  "tBodyAccJerk-mean()-Z" = "Body_Linear_Acceleration_Jerk_Mean_Z_Axis",
  "tBodyAccJerk-std()-X" = "Body_Linear_Acceleration_Jerk_Standard_Deviation_X_Axis",
  "tBodyAccJerk-std()-Y" = "Body_Linear_Acceleration_Jerk_Standard_Deviation_Y_Axis",
  "tBodyAccJerk-std()-Z" = "Body_Linear_Acceleration_Jerk_Standard_Deviation_Z_Axis",
  "tBodyGyro-mean()-X" = "Body_Angular_Acceleration_Mean_X_Axis",
  "tBodyGyro-mean()-Y" = "Body_Angular_Acceleration_Mean_Y_Axis",
  "tBodyGyro-mean()-Z" = "Body_Angular_Acceleration_Mean_Z_Axis",
  "tBodyGyro-std()-X" = "Body_Angular_Acceleration_Standard_Deviation_X_Axis",
  "tBodyGyro-std()-Y" = "Body_Angular_Acceleration_Standard_Deviation_Y_Axis",
  "tBodyGyro-std()-Z" = "Body_Angular_Acceleration_Standard_Deviation_Z_Axis",
  "tBodyGyroJerk-mean()-X" = "Body_Angular_Acceleration_Jerk_Mean_X_Axis",
  "tBodyGyroJerk-mean()-Y" = "Body_Angular_Acceleration_Jerk_Mean_Y_Axis",
  "tBodyGyroJerk-mean()-Z" = "Body_Angular_Acceleration_Jerk_Mean_Z_Axis",
  "tBodyGyroJerk-std()-X" = "Body_Angular_Acceleration_Jerk_Standard_Deviation_X_Axis",
  "tBodyGyroJerk-std()-Y" = "Body_Angular_Acceleration_Jerk_Standard_Deviation_Y_Axis",
  "tBodyGyroJerk-std()-Z" = "Body_Angular_Acceleration_Jerk_Standard_Deviation_Z_Axis",
  "tBodyAccMag-mean()" = "Body_Linear_Acceleration_Magnitude_Mean",
  "tBodyAccMag-std()" = "Body_Linear_Acceleration_Magnitude_Standard_Deviation",
  "tGravityAccMag-mean()" = "Gravity_Linear_Acceleration_Magnitude_Mean",
  "tGravityAccMag-std()" = "Gravity_Linear_Acceleration_Magnitude_Standard_Deviation",
  "tBodyAccJerkMag-mean()" = "Body_Linear_Acceleration_Jerk_Magnitude_Mean",
  "tBodyAccJerkMag-std()" = "Body_Linear_Acceleration_Jerk_Magnitude_Standard_Deviation",
  "tBodyGyroMag-mean()" = "Body_Angular_Acceleration_Magnitude_Mean",
  "tBodyGyroMag-std()" = "Body_Angular_Acceleration_Magnitude_Standard_Deviation",
  "tBodyGyroJerkMag-mean()" = "Body_Angular_Acceleration_Jerk_Magnitude_Mean",
  "tBodyGyroJerkMag-std()" = "Body_Angular_Acceleration_Jerk_Magnitude_Standard_Deviation",
  "fBodyAcc-mean()-X" = "Frequency_Domain_Body_Linear_Acceleration_Mean_X_Axis",
  "fBodyAcc-mean()-Y" = "Frequency_Domain_Body_Linear_Acceleration_Mean_Y_Axis",
  "fBodyAcc-mean()-Z" = "Frequency_Domain_Body_Linear_Acceleration_Mean_Z_Axis",
  "fBodyAcc-std()-X" = "Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_X_Axis",
  "fBodyAcc-std()-Y" = "Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_Y_Axis",
  "fBodyAcc-std()-Z" = "Frequency_Domain_Body_Linear_Acceleration_Standard_Deviation_Z_Axis",
  "fBodyAccJerk-mean()-X" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_X_Axis",
  "fBodyAccJerk-mean()-Y" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_Y_Axis",
  "fBodyAccJerk-mean()-Z" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Mean_Z_Axis",
  "fBodyAccJerk-std()-X" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_X_Axis",
  "fBodyAccJerk-std()-Y" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_Y_Axis",
  "fBodyAccJerk-std()-Z" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Standard_Deviation_Z_Axis",
  "fBodyGyro-mean()-X" = "Frequency_Domain_Body_Angular_Acceleration_Mean_X_Axis",
  "fBodyGyro-mean()-Y" = "Frequency_Domain_Body_Angular_Acceleration_Mean_Y_Axis",
  "fBodyGyro-mean()-Z" = "Frequency_Domain_Body_Angular_Acceleration_Mean_Z_Axis",
  "fBodyGyro-std()-X" = "Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_X_Axis",
  "fBodyGyro-std()-Y" = "Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_Y_Axis",
  "fBodyGyro-std()-Z" = "Frequency_Domain_Body_Angular_Acceleration_Standard_Deviation_Z_Axis",
  "fBodyAccMag-mean()" = "Frequency_Domain_Body_Linear_Acceleration_Magnitude_Mean",
  "fBodyAccMag-std()" = "Frequency_Domain_Body_Linear_Acceleration_Magnitude_Standard_Deviation",
  "fBodyBodyAccJerkMag-mean()" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Magnitude_Mean",
  "fBodyBodyAccJerkMag-std()" = "Frequency_Domain_Body_Linear_Acceleration_Jerk_Magnitude_Standard_Deviation",
  "fBodyBodyGyroMag-mean()" = "Frequency_Domain_Body_Angular_Acceleration_Magnitude_Mean",
  "fBodyBodyGyroMag-std()" = "Frequency_Domain_Body_Angular_Acceleration_Magnitude_Standard_Deviation",
  "fBodyBodyGyroJerkMag-mean()" = "Frequency_Domain_Body_Angular_Acceleration_Jerk_Magnitude_Mean",
  "fBodyBodyGyroJerkMag-std()" = "Frequency_Domain_Body_Angular_Acceleration_Jerk_Magnitude_Standard_Deviation"
)

## ===========================
## SCRIPT
## ===========================

"
  Create a list mapping column index in feature vector to readable feature name
  for the measurement features dataset
"
featureVectorColumnIndexToReadableFeatureName <- list()
con <- file("data/raw/UCI HAR Dataset/features.txt")
features <- readLines(con, 561)
close.connection(con)
meanOrStdPattern <- "(mean|std)\\(\\)"
for (line in features) {
  matches = regmatches(
    line,
    regexec(numberValuePattern, line)
  )
  number <- matches[[1]][[2]]
  name <- matches[[1]][[3]]
  ## save only those features containing mean() or std() in the name
  if (!is.null(featureNameToReadableName[[name]])) {
    featureVectorColumnIndexToReadableFeatureName[[number]] <- featureNameToReadableName[[name]]
  }
}

"
  Create a list where key is activity number, and value is its descriptive name
"
activityNumberToName <- list()
con <- file("data/raw/UCI HAR Dataset/activity_labels.txt")
activityLabels <- readLines(con)
close.connection(con)
for (line in activityLabels) {
  matches = regmatches(
    line,
    regexec(numberValuePattern, line)
  )
  number <- matches[[1]][[2]]
  name <- matches[[1]][[3]]
  activityNumberToName[[number]] <- name
}

" 
  Create the measurement features dataset 
"
xTrain <- read.table("data/raw/UCI HAR Dataset/train/X_train.txt")
con <- file("data/raw/UCI HAR Dataset/train/y_train.txt")
yTrain <- readLines(con)
close.connection(con)
con <- file("data/raw/UCI HAR Dataset/train/subject_train.txt")
subjectTrain <- readLines(con)
close.connection(con)

xTest <- read.table("data/raw/UCI HAR Dataset/test/X_test.txt")
con <- file("data/raw/UCI HAR Dataset/test/y_test.txt")
yTest <- readLines(con)
close.connection(con)
con <- file("data/raw/UCI HAR Dataset/test/subject_test.txt")
subjectTest <- readLines(con)
close.connection(con)

addDatasetToObservations <- function(observations, xTable, yList, subjectList) {
  ## look at each record
  for (recordIndex in 1:nrow(xTable)) {
    observations$Subject <- c(observations$Subject, subjectList[[recordIndex]])
    activity <- activityNumberToName[[
      yList[[recordIndex]]
    ]]
    observations$Activity <- c(observations$Activity, activity)
    ## add all mean/sd features
    for (columnIndex in names(featureVectorColumnIndexToReadableFeatureName)) {
      featureName <- featureVectorColumnIndexToReadableFeatureName[[as.character(columnIndex)]]
      featureValue <- xTable[[recordIndex, as.numeric(columnIndex)]]
      observations[[featureName]] <- c(observations[[featureName]], featureValue)
    }
  }
  return(observations)
}

observations <- addDatasetToObservations(list(), xTrain, yTrain, subjectTrain)
observations <- addDatasetToObservations(observations, xTest, yTest, subjectTest)
measurementFeatures <- data.frame(observations)
tidyFile <- "data/tidy/measurementFeatures.csv"
if (file.exists(tidyFile)) {
  file.remove(tidyFile)
}
file.create(tidyFile)
write.csv(measurementFeatures, tidyFile)

"
  make data set containing the average observational mean for each feature
  by subject-activity combination
"

## get new feature names
readableFeatureNames <- lapply(
  names(measurementFeatures)[-(1:2)],
  function(featureName) { return(paste("Mean_", featureName, sep = "")) }
)
measurementFeaturesBySubjectActivity <- group_by(measurementFeatures, Subject, Activity)
measurementFeaturesBySubjectActivity <- summarize_all(measurementFeaturesBySubjectActivity, mean)
names(measurementFeaturesBySubjectActivity)[-(1:2)] <- readableFeatureNames ## replace feature names

tidyFile <- "data/tidy/measurementFeaturesBySubjectActivity.csv"
if (file.exists(tidyFile)) {
  file.remove(tidyFile)
}
file.create(tidyFile)
write.csv(measurementFeaturesBySubjectActivity, tidyFile)
