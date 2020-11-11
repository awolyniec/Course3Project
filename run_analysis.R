numberValuePattern <- "^([0-9]+) (.+)$"

"
  Create a list <featureVectorColumnIndexToFeatureName> where label is
  <feature vector column index> and value is
  <descriptive name of signal mean/std feature>
  
"
  ## for line in features.txt
  ## separate into <number> <featureName>
  ## if <featureName> has mean() or std(), add the number and featureName to the list
  ## TODO: in phase 2, do transformations:
    ## make the feature name lowercase
    ## featureName will take the form <t/f><body/gravity><gyro/acc><jerk>?<mag>?<-mean/std()>(-<X/Y/Z>)?
    ## <t/f> -> <""/"Frequency_">
    ## <body/gravity> -> <"Body_"/"Gravity_">
    ## <gyro/acc> -> <"Angular_Acceleration_"/"Linear_Acceleration_">
    ## <jerk> -> <"Jerk_">
    ## <mag> -> <"Magnitude_">
    ## <mean()/std()> -> <"Mean"/"Standard_Deviation">
    ## <X/Y/Z> -> _X / _Y / _Z
featureVectorColumnIndexToFeatureName <- list()
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
  if (grepl(meanOrStdPattern, name)) {
    featureVectorColumnIndexToFeatureName[[number]] <- name
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
  Initialize a data frame <measurementMeansAndSds> containing the following columns:
  Subject, Activity, ...all descriptive signal mean/std feature names
  
  Each row is one record from the training and test datasets. All records from
  the training and test datasets are included.
"
## training data
xTrain <- read.table("data/raw/UCI HAR Dataset/train/X_train.txt")
con <- file("data/raw/UCI HAR Dataset/train/y_train.txt")
yTrain <- readLines(con)
close.connection(con)
con <- file("data/raw/UCI HAR Dataset/train/subject_train.txt")
subjectTrain <- readLines(con)
close.connection(con)

## test data
xTest <- read.table("data/raw/UCI HAR Dataset/test/X_test.txt")
con <- file("data/raw/UCI HAR Dataset/test/y_test.txt")
yTest <- readLines(con)
close.connection(con)
con <- file("data/raw/UCI HAR Dataset/test/subject_test.txt")
subjectTest <- readLines(con)
close.connection(con)

## TODO: I could refactor the script in an r-like manner, so it does this:
  ## 1- Filter out all columns in xTrain by whether or not they are features we want
  ## 2- add yTrain and subjectTrain as columns to xTrain
  ## 3- transform yTrain to use reader-friendly activity labels
  ## 4- Repeat the above 3 steps for the test files
  ## 5- add all rows in xTest to xTrain

addDatasetToObservations <- function(observations, xTable, yList, subjectList) {
  for (recordIndex in 1:nrow(xTable)) {
    observations$Subject <- c(observations$Subject, subjectList[[recordIndex]])
    activity <- activityNumberToName[[
      yList[[recordIndex]]
    ]]
    observations$Activity <- c(observations$Activity, activity)
    for (columnIndex in names(featureVectorColumnIndexToFeatureName)) {
      featureName <- featureVectorColumnIndexToFeatureName[[as.character(columnIndex)]]
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

## create new data frame measurementFeatureMeansForSubjectDoingActivity
  ## columns are: Activity, Subject, (Mean_<Feature Name> for feature in measurementFeatures.csv)
## TODO: first come up with new naming convention for columns in first data set

## delete measurementFeatureMeansForSubjectDoingActivity.csv if it exists
## save measurementFeatureMeansForSubjectDoingActivity to measurementFeatureMeansForSubjectDoingActivity.csv
