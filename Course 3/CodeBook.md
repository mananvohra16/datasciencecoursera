# Codebook

# Variables List and Description
Variable name    | Description
-----------------|------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity         | Activity name
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount        | Feature: Count of data points used to compute `average`
featAverage      | Feature: Average of each variable for each activity and each subject



Tidy data set:

str(dtTidy)
```
## Classes ‘data.table’ and 'data.frame':	11880 obs. of  11 variables:
## $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
## $ activity        : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
## $ featDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
## $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
## $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
## $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
## $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
## $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
## $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
## $ count           : int  50 50 50 50 50 50 50 50 50 50 ...
## $ average         : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
## - attr(*, "sorted")= chr [1:9] "subject" "activity" "featDomain" "featAcceleration" ...
##- attr(*, ".internal.selfref")=<externalptr> 
```


dtTidy
```
##subject         activity featDomain featAcceleration featInstrument featJerk featMagnitude featVariable
##    1:       1           LAYING       Time             <NA>      Gyroscope     <NA>          <NA>         Mean
##    2:       1           LAYING       Time             <NA>      Gyroscope     <NA>          <NA>         Mean
##    3:       1           LAYING       Time             <NA>      Gyroscope     <NA>          <NA>         Mean
##    4:       1           LAYING       Time             <NA>      Gyroscope     <NA>          <NA>           SD
##    5:       1           LAYING       Time             <NA>      Gyroscope     <NA>          <NA>           SD
##   ---                                                                                                        
##11876:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer     Jerk          <NA>           SD
##11877:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer     Jerk          <NA>           SD
##11878:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer     Jerk          <NA>           SD
##11879:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer     Jerk     Magnitude         Mean
##11880:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer     Jerk     Magnitude           SD
##       featAxis count     average
##    1:        X    50 -0.01655309
##    2:        Y    50 -0.06448612
##    3:        Z    50  0.14868944
##    4:        X    50 -0.87354387
##    5:        Y    50 -0.95109044
##   ---                           
##11876:        X    65 -0.56156521
##11877:        Y    65 -0.61082660
##11878:        Z    65 -0.78475388
##11879:     <NA>    65 -0.54978489
##11880:     <NA>    65 -0.58087813

```
