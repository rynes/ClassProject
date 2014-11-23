ClassProject
============

Class Project for mooc class "Getting and Cleaning Data" at Johns Hopkins


This script, "run_analysis.R", downloads data from:

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

that is described at:

"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

and creates tidy data that can be used for later analysis.

------------------

download.dataset <- function() 
    # check if zip file already exists and download it if necessary and unzip the file

load.datasets <- function() 
    # load all of the text files into R with appropriate names

merge.datasets <- function() 
    # merge training, test, and subject data

