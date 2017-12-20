#####Neural Network (multinomial classification)
#install package before using library

##try multinomial_int

##hotel_cluster need to stay factor
library(nnet)
library(caret)
library(RCurl)
library(Metrics)


###5 fold cross validation
library(rminer)
library(caret)
library(mlbench)

set.seed(500)
#create folds
folds<-createFolds(trainfeature$hotel_cluster,k=5)
str(folds)

menn=0
for (i in 1:5)
{
  train<-trainfeature[(-folds[[i]]),]
  test<-trainfeature[folds[[i]],]
 
  nn<-multinom(hotel_cluster~., data=train, maxit=200, trace=T, MaxNWts = 10000)
  
  
  ##prediction
  nnpred<-predict(nn,type="class",newdata = test)
  #head(nnpred,5)
  
  #remark: predict() type="probs" ordered likely cases
  
  #confusion matrix
  nn_cf<-table(test$hotel_cluster,nnpred)
  #misclassification error
  menn=(1-(sum(diag(nn_cf))/sum(nn_cf)))+menn
  
  
  #postResample(test$hotel_cluster,nnpred)
  
  
}
menn/5

