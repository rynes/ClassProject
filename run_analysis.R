# run_analysis.R
# 11/23/2014 5:00:00 PM

# This script, "run_analysis.R", downloads data from:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# that is described at:
# "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
# and creates tidy data that can be used for later analysis.

# -----------------------------------------------------------------------------
download.dataset <- function() {
    # check if zip file already exists and download it if necessary

    url     <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"

    if (!file.exists(zipfile)) {

        # download the zip file from the Internet
        # since protocol is "https" we need to use "curl" or "wget"
        # in the course videos, curl is used
        # the "--insecure" parameter means "Allow connections to SSL (https) sites without certificates"
        download.file(url, zipfile, method="curl", extra="--insecure")

        # unzip the file
        # this creates subdirectory "UCI HAR Dataset"
        unzip(zipfile)
    }
}

# -----------------------------------------------------------------------------
load.datasets <- function() {
    # load the "feature_labels" table
    # ncol = 2, nrow = 6
    feature_labels <- read.table("./UCI HAR Dataset/features.txt", col.names=c("id", "label"), stringsAsFactors = FALSE)

    #load the "activity_labels" table
    # ncol = 2, nrow = 6
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("id", "label"), stringsAsFactors = FALSE)

    # load training data
    #------------------
    #load the "X_train" table
    # ncol = 561, nrow = 7352
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")

    #load the "y_train" table
    # ncol = 1, nrow = 7352
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = "integer")

    #load the "subject_train" table
    # ncol = 1, nrow = 7352
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "integer")

    # load testing data
    #------------------
    # load the "X_test" table
    # ncol = 561, nrow = 7352
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")

    #load the "y_test" table
    # ncol = 1, nrow = 7352
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = "integer")

    #load the "subject_test" table
    # ncol = 1, nrow = 7352
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "integer")
}

merge.datasets <- function() {
    # merge training and test data

    merged.x       <- rbind(X_train,       X_test)
    merged.y       <- rbind(y_train,       y_test)
    merged.subject <- rbind(subject_train, subject_test)

    # return a list of these merged data.frames
    merged.list    <- list(merged.x, merged.y, merged.subject)
    merged.list
}
