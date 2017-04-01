=========================================================================
This repository has the files necessary for completing the Getting and Cleaning Data Course Project. 
=========================================================================

The following files are included in the repository
==================================
- 'Read Me.md'
- 'run_analysis.R' : has the R script that analyses the given data as per instructions
- 'code book.md' : has the description about variables
- 'project.txt' : is the end result after running the R Script, exported as a text file 

About run_analysis.R
================
The R script does the following:
1. Loads the downloaded info viz., list of features, data collected about features, and respective subject , activity done by subject
2. Merges the test and train data about features. Adds all the column names using the list of features.
3. Extracts the features info about mean and standard deviation from the above merged data
4. Merges the activities done by subject while collecting the test and train data. Converts the numeric indices into descriptive labels
5. Merges the subject ids of the test and train data. 
6. Forms the big data set with the required features info against the respective activity undertaken by subject and subject id
7. Creates a new data set which has the average of each variable for each activity and subject pair. The result is exported as a text file named: project.txt
