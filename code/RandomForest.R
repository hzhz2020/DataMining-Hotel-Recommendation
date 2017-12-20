#####Random Forest
#install package before using library

library(randomForest)
library(rminer)
library(caret)
library(mlbench)
library(Metrics)


#create folds
folds<-createFolds(trainfeature$hotel_cluster,k=5)
str(folds)

merf=0
for (i in 1:5)
 {
  train<-trainfeature[(-folds[[i]]),]
  test<-trainfeature[folds[[i]],]
  rfm1<-randomForest(hotel_cluster~.,data = train)
  print(rfm1)
  rfpred<-predict(rfm1,type="class",test)
  #head(rfpred,5)
  #head(test,5)
  #rfpred
  rfm1_cf<-table(test$hotel_cluster,rfpred)
  #rfm1_cf
  #print(head(table(test$hotel_cluster,treepredict),5))
  merf=1-sum(diag(rfm1_cf))/sum(rfm1_cf)+merf

  #print(postResample(test$hotel_cluster,rfpred))

 }

merf/5


# cv_result<-lapply(folds, function(x){
#     # train<-trainfeature[(-folds[[i]]),]
#     # test<-trainfeature[folds[[i]],] 
#     train<-trainfeature[-x,]
#     test<-trainfeature[x,]
#     rfm1<-randomForest(hotel_cluster~.,data = train)
#     rfpred<-predict(rfm1,type="class",test)
#     return(mmetric(test$hotel_cluster,rfpred,c("ACC")))
# }
#   )