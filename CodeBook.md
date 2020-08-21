# Code Book
The details of the data as well as the modifications made to the data are as described below>

## Introduction To The Data
The data consists of acceleration and velocity data obtained from Samsung Galaxy S II smart watches from 30 separate volunteers when they engage in various activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The data from the participants is then randomly split into two groups, train and test, by a proportion of 70% and 30% respectively.
The TRAIN dataset consists of 3 files: `subject_train.txt, X_train.txt, y_train.txt`.
The TEST dataset also consists of 3 similar files: `subject_test.txt, X_test.txt, y_test.txt`.
The subject files contain values of the the subject, the X files contain the results of the experiments, and y files contain the activity labels.

## Tidying Process
The `run_analysis.R` code was used to carry out the following steps in cleaning the data:
  1. Firstly, `read.table` from the `data.table` function was used to read in the the data files and assigned to unique variables.
  2. The `cbind` function is then used to combine the data from `subject_train.txt, X_train.txt, y_train.txt` files into a single data table.
  3. The above step is repeated with `subject_test.txt, X_test.txt, y_test.txt` to form a single test data table.
  4. `rbind` is then used to combine the 2 tables obtained to form a single data table.
  5. Variable names are assigned.
  6. From `dplyr` package, `select` function is used to select the following variables:
    "tBodyAcc-mean()-X"           
    "tBodyAcc-mean()-Y"          
    "tBodyAcc-mean()-Z"           
    "tBodyAcc-std()-X"           
    "tBodyAcc-std()-Y"            
    "tBodyAcc-std()-Z"           
    "tGravityAcc-mean()-X"        
    "tGravityAcc-mean()-Y"       
    "tGravityAcc-mean()-Z"        
    "tGravityAcc-std()-X"        
    "tGravityAcc-std()-Y"         
    "tGravityAcc-std()-Z"        
    "tBodyAccJerk-mean()-X"       
    "tBodyAccJerk-mean()-Y"      
    "tBodyAccJerk-mean()-Z"       
    "tBodyAccJerk-std()-X"       
    "tBodyAccJerk-std()-Y"        
    "tBodyAccJerk-std()-Z"       
    "tBodyGyro-mean()-X"          
    "tBodyGyro-mean()-Y"         
    "tBodyGyro-mean()-Z"          
    "tBodyGyro-std()-X"          
    "tBodyGyro-std()-Y"           
    "tBodyGyro-std()-Z"          
    "tBodyGyroJerk-mean()-X"      
    "tBodyGyroJerk-mean()-Y"     
    "tBodyGyroJerk-mean()-Z"      
    "tBodyGyroJerk-std()-X"      
    "tBodyGyroJerk-std()-Y"       
    "tBodyGyroJerk-std()-Z"      
    "tBodyAccMag-mean()"          
    "tBodyAccMag-std()"          
    "tGravityAccMag-mean()"       
    "tGravityAccMag-std()"       
    "tBodyAccJerkMag-mean()"      
    "tBodyAccJerkMag-std()"      
    "tBodyGyroMag-mean()"         
    "tBodyGyroMag-std()"         
    "tBodyGyroJerkMag-mean()"     
    "tBodyGyroJerkMag-std()"     
    "fBodyAcc-mean()-X"           
    "fBodyAcc-mean()-Y"          
    "fBodyAcc-mean()-Z"           
    "fBodyAcc-std()-X"           
    "fBodyAcc-std()-Y"            
    "fBodyAcc-std()-Z"           
    "fBodyAccJerk-mean()-X"       
    "fBodyAccJerk-mean()-Y"      
    "fBodyAccJerk-mean()-Z"       
    "fBodyAccJerk-std()-X"       
    "fBodyAccJerk-std()-Y"        
    "fBodyAccJerk-std()-Z"       
    "fBodyGyro-mean()-X"          
    "fBodyGyro-mean()-Y"         
    "fBodyGyro-mean()-Z"          
    "fBodyGyro-std()-X"          
    "fBodyGyro-std()-Y"           
    "fBodyGyro-std()-Z"          
    "fBodyAccMag-mean()"          
    "fBodyAccMag-std()"          
    "fBodyBodyAccJerkMag-mean()"  
    "fBodyBodyAccJerkMag-std()"  
    "fBodyBodyGyroMag-mean()"     
    "fBodyBodyGyroMag-std()"     
    "fBodyBodyGyroJerkMag-mean()" 
    "fBodyBodyGyroJerkMag-std()"
  7. In order to assign the respective activity names, `merge` function was used and the final cleand table was stored in *final_form* variable.
  8. The final task of creating an independent data table containing the mean of the each variable with respect to activity for each person was achieved using    `aggregate` function from `dplyr` whereby the data was grouped firstly by subject and then activity and then the respective means were calculated.
  
  -End-
