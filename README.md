ClassProject
============

Class Project for mooc class "Getting and Cleaning Data" at Johns Hopkins

 The script, "run_analysis.R", downloads data from:
 "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 that is described at:
 "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
 and creates tidy data that can be used for later analysis.

download.dataset <- function() {
    # check if zip file already exists and download it if necessary
    url     <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"

load.datasets <- function() {
    # loads data from all txt files into R objects
    # load the "feature_labels" table
    # load the "activity_labels" table
    # load training data
    # load the "X_train" table
    # load the "y_train" table
    # load the "subject_train" table
    # load the subject_train" table
    # load the "X_test" table
    # load the "y_test" table
    # load the "subject_test" table

merge.datasets <- function() {
    # merge training and test data

    merged.x       <- rbind(X_train,       X_test)
    merged.y       <- rbind(y_train,       y_test)
    merged.subject <- rbind(subject_train, subject_test)

    # return a list of these merged data.frames
    merged.list    <- list(merged.x, merged.y, merged.subject)
    merged.list
