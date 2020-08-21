# Getting and Cleaning Data
Week 4 Coursera Project on Getting and Cleaning Data

## Project Description
This project has been assigned to determine ones ability to gather data and clean them as suggested by the heading.
Gathering data includes finding reliable and relevant data. In this case, the required data is provided and can be downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repo consists of the following files:
  1. README.md - A description of the contents in this repo
  2. Codebook - A description of all variables as well as relevant modifications made 
  3. run_analysis.R - R program file containg the code used to clean the data
  
## Code Description

The `run_analysis.R` code was used to carry out the following steps in cleaning the data:
  1. Firstly, `read.table` from the `data.table` function was used to read in the the data files and assigned to unique variables.
  2. The `cbind` function is then used to combine the data from `subject_train.txt, X_train.txt, y_train.txt` files into a single data table.
  3. The above step is repeated with `subject_test.txt, X_test.txt, y_test.txt` to form a single test data table.
  4. `rbind` is then used to combine the 2 tables obtained to form a single data table.
  5. Variable names are assigned.
  6. From `dplyr` package, `select` function is used to select the variables as descriibed in the CODEBOOK.
  7. In order to assign the respective activity names, `merge` function was used and the final cleand table was stored in *final_form* variable.
  8. The final task of creating an independent data table containing the mean of the each variable with respect to activity for each person was achieved using    `aggregate` function from `dplyr` whereby the data was grouped firstly by subject and then activity and then the respective means were calculated.
  
  
