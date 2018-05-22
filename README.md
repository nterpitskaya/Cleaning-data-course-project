---
title: "README.md"
author: "Nadia Terpitskaya"
date: "5/20/2018"
output: html_document
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### Purpose
The repo contains script for transformation of raw data collected from the accelerometers from the Samsung Galaxy S smartphone to tidy data by the rules described in coursera "Getting and Cleaning Data" Course Project

### Content
The repo contains:  
1. run_analysis.R - script containing all transformations needed for preparing tidy dataset.  Please refer to  "How to RUN section", to run the script.
2. CodeBook.md - it describes variables, transformations and  link to raw dataset. 

### How to RUN
1. Download and unzip data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
2. Set working directory to unziped folder, make sure it has name  "UCI HAR Dataset"   
3. Copy "run_analysis.R" file to "UCI HAR Dataset" folder
4. Make sure that dplyr packache is installed and soursed
```{r}
 install.packages("dplyr")  
 library(c)  
``` 
5. Open "run_analysis.R" in R studion and run it using "Source with echo command"  
6. Use "avgdata" dataframe. It contains tidy data set requiered to be prepared by this course project