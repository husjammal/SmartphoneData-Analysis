## Overview
This document describes the variables in the tidy dataset and the transformations performed on the original Human Activity Recognition dataset.

## Variables in the Tidy Dataset
- **subject**: An identifier for each of the 30 subjects (1-30).
- **activity**: The activity performed by the subject. Possible values are:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **[Feature Variables]**: Each of the 561 feature variables corresponds to measurements of the mean and standard deviation for each axis of accelerometer and gyroscope readings. For example:
  - `tBodyAcc-mean-X`: Mean of body acceleration in the X direction
  - `tBodyAcc-std-Y`: Standard deviation of body acceleration in the Y direction

## Data Transformations
1. **Merging Datasets**: Combined training and test datasets.
2. **Extracting Measurements**: Filtered the dataset to retain only mean and standard deviation measurements.
3. **Descriptive Activity Names**: Replaced activity codes with descriptive names.
4. **Labeling Variables**: Renamed variables to be more descriptive.
5. **Creating Tidy Dataset**: Grouped the data by subject and activity, calculating the average for each variable.

## Additional Notes
- The dataset is normalized and bounded within [-1, 1].
- The final tidy dataset is saved as `tidy_data.txt`.
