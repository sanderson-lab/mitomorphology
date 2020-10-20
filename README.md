# mitomorphology

Instructions for how to use R functions described in Fogo & Anzell et al. 2020 (Machine Learning-Based Classification of Mitochondrial Morphology in Primary Neurons and Cerebral Tissue)

The following steps are for training a random forest model on a hand-classified data set:

Step 1: Open the 'TrainTestFunction.R' file in Rstudio
Step 2: Install 3 libraries (1) caret (2) factoextra (3) Random Forest
  To install libraries, go to the 'Tools' lab and select 'Install Packages' and type in the desired packages. 
  If you forget to install, the console should prompt you to install before it runs the code. 
Step 3: Set 'Columns' equal to the range of columns within your spreadsheet you want included in the model.
  IMPORTANT NOTE: Do not change the anything other than the numbers in line 5. The ':' indicates 'through' so (2:22) = (2 through 22)
  IMPORTANT NOTE: Columns of interest must be numerical
Step 4: Set 'VC' equal to the column number for the variable of interest (or Hand-Classified Variable). 
  If 'Classification' is the variable you want to look at and it is located in column 22, then set VC = 22. 
Step 5: Set 'Model' equal to the desired name for the model to be trained
  IMPORTANT NOTE: Make sure your name is contained with '' to indicate a string
  'RFTest' is correct; RFTest is incorrect
Step 6: Select the types of analysis desired. Make sure your answer is written in all capilization.
  TRUE = Yes, run this test
  FALSE = No, do not run this test
Step 7: Run the code 
  IMPORTANT NOTE: The first pop up window will ask you to select the file you'd like to train on.
  IMPORTANTE NOTE: Input file must be .csv
  
***Test Accuracy and  Confusion Matrix will appear in the console, while PCA and Variable Importance will appear in the lower right hand side under 'plots'. Only one plot will appear at once, toggle arrows to see other plot***

When satisfied with model performance, save and export needed objects in the enviorment/workspace

The following steps are for analyzing experimental data (no hand-classification) after model training:

Step 8: Open 'AnalyzeData.R' file in Rstudio
Step 9: Set 'ExperimentColumns' equal to the columns you'd like to analyze
  Same syntax as before, ':' reads as through
  IMPORTANT NOTE: Column names must be identical to those used in model training
Step 10: Set 'Model' equal to whatever you named your model in Step 5.
  IMPORTANT NOTE: Do not include '' this time
Step 11: Run the code
  IMPORTANT NOTE: The first pop up window will prompt you to select the file you'd like to analyze. The second pop up window will ask you to select the folder you'd like the resulting csv to be saved to 
Step 12: Your results will be saved in the folder you selected as 'Results'. 
  IMPORTANT NOTE: Make sure to go in and rename your results before running the next test or previous results will be written over. 
