# Getting and Cleaning Data Course Project

This is the course project for Coursera's Getting and Cleaning Data Course provided by John Hopkins University. The 'dataset_codebook.md' file, describes each variable in the 'tidy_data.txt' and provides explanation with how the 'data_cleaning.R' script works. The data_cleaning.R script, performs the following tasks:

 1. Downloads the project's dataset files if not already available in the working directory.
 2. Combines the train and test dataset.
 3. Names the dataset columns descriptively and changes the activities values in to descriptive values.
 4. Creates a tidy dataset with the average values of each variable for each activity and each subject.
 5. Also generates a text file of the tidy dataset with the name "tidy_data.txt".
