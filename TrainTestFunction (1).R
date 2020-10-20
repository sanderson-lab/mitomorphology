# Train/Test Function
# Libraries needed: 'Caret' 'factoextra' and 'Random Forest'

#Enter in Column Selection where ':' indicates 'through' in the example here 2:22 reads as 'column 2 through column 22'
Columns = (2:22)

#Set 'VC' equal to the column number for the variable of interest
VC = 22

#Set the desired name for the model to be trained, use '' to define as a string
Model = 'RFTest'

# Select types of analysis needed; TRUE = Yes, run this test; FALSE = No, don't run this test. Type TRUE or FALSE in all caps, or code won't run
ConfusionMatrix <- TRUE
TestAccuracy <- TRUE
VariableImportance <- TRUE
PCA <- TRUE 


#-------------------------------------------------------------------------------------------------------------------------------------------------------

library(caret) 

#Select the File
FileName <- rstudioapi::selectFile(caption = "Select CSV File",
                                   filter = "CSV Files (*.csv)",
                                   existing = TRUE)
#Open and randomize File
DataFile <- read.csv(FileName)
set.seed(123)
names(DataFile)[VC] <- "Variable"
DataFile$Variable = as.factor(DataFile$Variable)


#Create Data Partition
train <- createDataPartition(DataFile$Variable, p=.8, list=FALSE, times=1)
trainset <- DataFile[train,]
testset <- DataFile[-train,]

#Run Random Forest Paradigm on Selected Columns
RandomForest <- train(Variable ~ ., data = trainset[c(Columns)], method='rf')

#Rename model to desired name
assign(Model, RandomForest)

#Test Accuracy
if (TestAccuracy == TRUE) {
  Model
} else { 
  print("Test Accuracy: NA")
  }

predict <- predict(Model, testset[c(Columns)])

#Confusion Matrix
if (ConfusionMatrix == TRUE) {
    confusionMatrix(reference = testset$Variable, data = predict, mode='everything', positive='MM')
} else { 
  print("ConfusionMatrix: NA")
  }

#Variable Importance
if (VariableImportance == TRUE) {
  VariableImportance <- varImp(RandomForest)
  plot(VariableImportance)
} else  { 
  print("VariableImportance: NA")
  }

#PCA
library(factoextra)
if (PCA == TRUE) {
  NumCol =  Columns[Columns!= VC]
  all.pca.scale = prcomp(DataFile[c(NumCol)], scale = TRUE)
  fviz_pca_ind(all.pca.scale, labels = FALSE, habillage = DataFile$Variable, addEllipses = TRUE)
} else  {
  print("PCA: NA")
  }











