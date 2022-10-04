# Part 1: Print decision tree

# a. We begin by setting the working directory, loading the required packages (rpart and mlbench) and then loading the Ionosphere dataset.

#set working directory if needed (modify path as needed)

setwd('Data-Set')

#load required libraries – rpart for classification and regression trees

library(rpart)

#mlbench for Ionosphere dataset

library(mlbench)

#load Ionosphere

data(Ionosphere)

#b. Use the rpart() method to create a regression tree for the data.

rpart(Class~.,Ionosphere)
rpart.ionosphere=rpart(Class~.,Ionosphere)


#c. Use the plot() and text() methods to plot the decision tree.
plot(rpart.ionosphere)
text(rpart.ionosphere, pretty = 0)

# Part 2: Estimate accuracy

# a. Split the data a test and train subsets using the sample() method.

set.seed(42)
train<-sample(1:nrow(Ionosphere), 200)
Ionosphere.test<-Ionosphere[-train,]

# b. Use the rpart method to create a decision tree using the training data.

rpart(Class~.,Ionosphere,subset=train)
#
# c. Use the predict method to find the predicted class labels for the testing data.

rpart.pred<-predict(rpart.ionosphere, Ionosphere.test, type = 'class')

# d. Use the table method to create a table of the predictions versus true labels and then compute the accuracy. The accuracy is the number of correctly assigned good cases (true positives) plus the number of correctly assigned bad cases (true negatives) divided by the total number of testing cases.
table(rpart.pred, Ionosphere$Class[-train])

(50+90)/(50+1+10+90)

