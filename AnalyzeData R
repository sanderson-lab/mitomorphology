#First Pop up: Select the Data you'd like to analyze
#Second Pop Up: Select the Folder you'd like to store

#Experimental Columns of Interest; Select the Columns you'd like to analyze
ExperimentColumns = (2:21)

#Select model for classificaiton
Model = RFTest

#-------------------------------------------------------------------------------------------------------------------------------------

library(caret)
#Select the File
ExperimentFile <- rstudioapi::selectFile(caption = "Select CSV File",
                                   filter = "CSV Files (*.csv)",
                                   existing = TRUE)

Results <- rstudioapi::selectDirectory(
  caption = "Select Directory",
  label = "Select")

Results <- paste(Results, "/results.csv", sep = "")


ExperimentData <- read.csv(ExperimentFile)
set.seed(123)


ExperimentPredict <- predict(Model, ExperimentData[c(ExperimentColumns)])
ExperimentData$Classification = as.factor(ExperimentPredict)


write.csv(ExperimentData, file = Results)
