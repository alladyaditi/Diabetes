# Diabetes

## Abstract 
### Purpose
It could be said that the topic of diabetes is common today, and my intrest in this dataset was sparked because the heritage Pima indians have high obesity , and glucose which is a cause of diabetes. Diabetes is diagonised to people everyday with obesity, and i have myself had almost been diagonised with diabetes. The Purpose of this application is to determine if the Females that are around the age of 21 and are Pima Indian heritage have diabetes or not. 
### About the data set Pima Indian Diabetes
The data set Pima Indian Diabetes has 768 outcomes and 9 variables and comes from the National Institute of Diabetes and Digestive and Kidney Diseases. Their is one class variable which is the diabetes varaible which is the test for diabetes saying postive or negtive. The diabetes varaible is the outocome expected at the end of the model. The other 8 variables are the medical predictor variables which are number of pregnancies the patient has had, their BMI, insulin level, age, Diastolic blood pressure (mm Hg),	Triceps skin fold thickness (mm),Plasma glucose concentration (glucose tolerance test), and 	Diabetes pedigree function.
### Resource/Output Expected 
#### Resources about the dataset 
https://www.kaggle.com/uciml/pima-indians-diabetes-database

https://www.rdocumentation.org/packages/mlbench/versions/2.1-3/topics/PimaIndiansDiabetes
#### Output Expected 
One of the Outputs that are expected is that for saying that the age and the body mass weight is an extermly important part to determine if the person has a pos or neg outcome of diabetes, the data proves that if their is a higher body weight and are younger are more likely to get diabetes. A high body mass, and a high glucose level prove that their will be a postive dignoisis of diabetes.
## How to Run Diabetes 
### Requirement
R >= 4.0.2

Shiny >= 1.2.0

Open R Studio 

```R
install.packages('shiny')
library(shiny)
shiny::runGitHub(repo = "Diabetes",username = "alladyaditi",ref="main") 
```
### Tutorial of Diabetes can be downloaded at
https://github.com/alladyaditi/Diabetes/blob/main/DIebetes.pdf

### Run Diabetes using shinyapps.io with free RStudio service
http://alladyaditi.shinyapps.io/Diabetes

Their are three different tabs, the first one being descriptive statstics tab where you can upload the dataset, and it will show the summary or the mean, and median of the dataset variables, and displays the dataset on the page. The next tab is the visualation tab where the dataset will be diplayed as a boxplot and it can by setting two contiuous or categorical varaibles or either or, with a third aesthetic varaible which is either contiuous or categorical variable. The third tab is the statistical anylysis tab where we will conduct three tests which are the One and Two sample t-tests, and Wilcox Test. We can choose our response and explantory varaible. 
