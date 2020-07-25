# Code Book

This code book summarizes the resulting data fields in `tidy.txt` and the steps performed in the `run_analysis.R` script.

## Identifiers

* `Subject` - The ID of the test subject,
* `Activity` - The activity being performed by the subject when the corresponding measurements were taken.

## Measurements

* ` tBodyAccMeanX `
* ` tBodyAccMeanY `
* ` tBodyAccMeanZ `
* ` tBodyAccStdX `
* ` tBodyAccStdY `
* ` tBodyAccStdZ `
* ` tGravityAccMeanX `
* ` tGravityAccMeanY `
* ` tGravityAccMeanZ `
* ` tGravityAccStdX `
* ` tGravityAccStdY `
* ` tGravityAccStdZ `
* ` tBodyAccJerkMeanX `
* ` tBodyAccJerkMeanY `
* ` tBodyAccJerkMeanZ `
* ` tBodyAccJerkStdX `
* ` tBodyAccJerkStdY `
* ` tBodyAccJerkStdZ `
* ` tBodyGyroMeanX `
* ` tBodyGyroMeanY `
* ` tBodyGyroMeanZ `
* ` tBodyGyroStdX `
* ` tBodyGyroStdY `
* ` tBodyGyroStdZ `
* ` tBodyGyroJerkMeanX `
* ` tBodyGyroJerkMeanY `
* ` tBodyGyroJerkMeanZ `
* ` tBodyGyroJerkStdX `
* ` tBodyGyroJerkStdY `
* ` tBodyGyroJerkStdZ `
* ` tBodyAccMagMean `
* ` tBodyAccMagStd `
* ` tGravityAccMagMean `
* ` tGravityAccMagStd `
* ` tBodyAccJerkMagMean `
* ` tBodyAccJerkMagStd `
* ` tBodyGyroMagMean `
* ` tBodyGyroMagStd `
* ` tBodyGyroJerkMagMean `
* ` tBodyGyroJerkMagStd `
* ` fBodyAccMeanX `
* ` fBodyAccMeanY `
* ` fBodyAccMeanZ `
* ` fBodyAccStdX `
* ` fBodyAccStdY `
* ` fBodyAccStdZ `
* ` fBodyAccMeanFreqX `
* ` fBodyAccMeanFreqY `
* ` fBodyAccMeanFreqZ `
* ` fBodyAccJerkMeanX `
* ` fBodyAccJerkMeanY `
* ` fBodyAccJerkMeanZ `
* ` fBodyAccJerkStdX `
* ` fBodyAccJerkStdY `
* ` fBodyAccJerkStdZ `
* ` fBodyAccJerkMeanFreqX `
* ` fBodyAccJerkMeanFreqY `
* ` fBodyAccJerkMeanFreqZ `
* ` fBodyGyroMeanX `
* ` fBodyGyroMeanY `
* ` fBodyGyroMeanZ `
* ` fBodyGyroStdX `
* ` fBodyGyroStdY `
* ` fBodyGyroStdZ `
* ` fBodyGyroMeanFreqX `
* ` fBodyGyroMeanFreqY `
* ` fBodyGyroMeanFreqZ `
* ` fBodyAccMagMean `
* ` fBodyAccMagStd `
* ` fBodyAccMagMeanFreq `
* ` fBodyBodyAccJerkMagMean `
* ` fBodyBodyAccJerkMagStd `
* ` fBodyBodyAccJerkMagMeanFreq `
* ` fBodyBodyGyroMagMean `
* ` fBodyBodyGyroMagStd `
* ` fBodyBodyGyroMagMeanFreq `
* ` fBodyBodyGyroJerkMagMean `
* ` fBodyBodyGyroJerkMagStd `
* ` fBodyBodyGyroJerkMagMeanFreq `

## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

##Steps of Transformation:

1. Download the project dataset files if not already available in the currently working directory and extract the contents if the extracted file is not alrady available
2. Load the Activity names and the measurement labels
3. Keep the Measurement labels that represents mean and std values. Discard the rest
4. Make the Measurement labels easily readable
5. Load the train and test datasets with the measurement values, subject ids and activity ids
6. Combine the train and test datasets into a single dataset
7. Convert the Subject and Activity variables into factors
8. Melt the combined data with Subject and Activity as ids
9. Compute the mean values of each measurement for each activity and each subject using the dcast() function.
10. Write the dataset out with the file name `tidy_data.txt`
