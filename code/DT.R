#####DT
#install package before using library
library(party)

###5 fold cross validation
library(rminer)
library(caret)
library(mlbench)
library(Metrics)

#create folds
folds<-createFolds(trainfeature$hotel_cluster,k=5)
str(folds)

me=0
for (i in 1:5)
{
  train<-trainfeature[(-folds[[i]]),]
  test<-trainfeature[folds[[i]],]
  dtm<-ctree(hotel_cluster~.,train)
  treepredict<-predict(dtm,test)
  #trypredict=predict(dtm,type="prob",test)
  head(trypredict,5)
  cftree<-table(test$hotel_cluster,treepredict)
  #print(head(table(test$hotel_cluster,treepredict),5))
  print(ce(as.numeric(test$hotel_cluster),as.numeric(treepredict)))
  me=(1-sum(diag(cftree))/sum(cftree))
  
  #test
  print(postResample(test$hotel_cluster,treepredict))
}
me/5

