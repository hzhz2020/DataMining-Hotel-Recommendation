#####KNN
#install package before using library

##KNN 5 fold cross
set.seed(9851)
library(class)
library(rminer)
library(caret)
library(mlbench)
library(Metrics)


##prepare data for KNN
knntrainfeature<-trainfeature
m<-apply(trainfeature[,1:16],2,mean)
s<-apply(trainfeature[,1:16],2,sd)
knntrainfeature[,1:16]<-scale(trainfeature[,1:16],m,s)

#create folds
folds<-createFolds(knntrainfeature$hotel_cluster,k=5)
str(folds)

meknn=0
for (i in 1:5)
{
  train<-knntrainfeature[(-folds[[i]]),]
  test<-knntrainfeature[folds[[i]],]
  
  knnpred<-knn(train=train[,1:16],test=test[,1:16],cl=train$hotel_cluster,k=5)
  head(knnpred,5)
  
  knncf<-table(test$hotel_cluster,knnpred)
  
  #knncf
  meknn=(1-sum(diag(knncf))/sum(knncf))+meknn
  
  #postResample(trytest$hotel_cluster,trynn_factorpred)
  
}
meknn/5
