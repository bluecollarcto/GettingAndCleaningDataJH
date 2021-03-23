# Code Book

This code book describes all of the data fields in the `tidy.txt` file and the processing required to create this file.

## Background
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data Infomration and Source
* Original description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Original raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### The dataset includes the following files:
- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

#### Each record in the Training and Test set conatins
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The following files are available for the train and test data. Their descriptions are equivalent. This data was not used in creating the tidy dataset
- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 
- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Steps to create the Tidy Data Set
1. Download data and extract into appropriate folder structure
2. Load data in *data.table* for `features.txt` and `activity_labels.txt` to get the appropriate names for columns related to means and standard deviation
3. Load and reshape the Test and Train data files to just have mean and standard deviation columns as determined in above step
4. Merge the Test and Train datasets
5. Melt the data set to get one row for each feature variable per subject and activity
6. Create the tidy data file `tidy_data.txt`set with the mean value for each feature variable for each subject and activity (30 subjects with 6 rows each for 180 total rows)

## Data in Tidy Data Set
### Identifiers

 - `SubjectID` - `integer` - The ID of the test subject from 1-30
 - `ActivityName` - `string` - The type of activity that they were performing when the measurements were taken
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
   - LAYING

### Measurements

These variables are all of the `mean` values for the corresponding measurement based on the subject and the activity.  These are all of data type `numeric`.

 - tBodyAccmeanX
 - tBodyAccmeanY
 - tBodyAccmeanZ
 - tBodyAccstdX
 - tBodyAccstdY
 - tBodyAccstdZ
 - tGravityAccmeanX
 - tGravityAccmeanY
 - tGravityAccmeanZ
 - tGravityAccstdX
 - tGravityAccstdY
 - tGravityAccstdZ
 - tBodyAccJerkmeanX
 - tBodyAccJerkmeanY
 - tBodyAccJerkmeanZ
 - tBodyAccJerkstdX
 - tBodyAccJerkstdY
 - tBodyAccJerkstdZ
 - tBodyGyromeanX
 - tBodyGyromeanY
 - tBodyGyromeanZ
 - tBodyGyrostdX
 - tBodyGyrostdY
 - tBodyGyrostdZ
 - tBodyGyroJerkmeanX
 - tBodyGyroJerkmeanY
 - tBodyGyroJerkmeanZ
 - tBodyGyroJerkstdX
 - tBodyGyroJerkstdY
 - tBodyGyroJerkstdZ
 - tBodyAccMagmean
 - tBodyAccMagstd
 - tGravityAccMagmean
 - tGravityAccMagstd
 - tBodyAccJerkMagmean
 - tBodyAccJerkMagstd
 - tBodyGyroMagmean
 - tBodyGyroMagstd
 - tBodyGyroJerkMagmean
 - tBodyGyroJerkMagstd
 - fBodyAccmeanX
 - fBodyAccmeanY
 - fBodyAccmeanZ
 - fBodyAccstdX
 - fBodyAccstdY
 - fBodyAccstdZ
 - fBodyAccJerkmeanX
 - fBodyAccJerkmeanY
 - fBodyAccJerkmeanZ
 - fBodyAccJerkstdX
 - fBodyAccJerkstdY
 - fBodyAccJerkstdZ
 - fBodyGyromeanX
 - fBodyGyromeanY
 - fBodyGyromeanZ
 - fBodyGyrostdX
 - fBodyGyrostdY
 - fBodyGyrostdZ
 - fBodyAccMagmean
 - fBodyAccMagstd
 - fBodyBodyAccJerkMagmean
 - fBodyBodyAccJerkMagstd
 - fBodyBodyGyroMagmean
 - fBodyBodyGyroMagstd
 - fBodyBodyGyroJerkMagmean
 - fBodyBodyGyroJerkMagstd
 
 
#### Feature Details 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in `features.txt`
