#####Naive Bayes
#install package before using library

######nb_factor 5 fold cross
set.seed(2333)
library(e1071)
library(rminer)
library(caret)
library(mlbench)
library(Metrics)


##prepare data for nb_factor
nbtrainfeature<-trainfeature
nbtrainfeature$hotel_market<-factor(nbtrainfeature$hotel_market)
nbtrainfeature$hotel_country<-factor(nbtrainfeature$hotel_country)
nbtrainfeature$hotel_continent<-factor(nbtrainfeature$hotel_continent)
nbtrainfeature$srch_destination_type_id<-factor(nbtrainfeature$srch_destination_type_id)
nbtrainfeature$srch_destination_id<-factor(nbtrainfeature$srch_destination_id)
nbtrainfeature[,1]<-factor(nbtrainfeature[,1])

for (i in 2:8)
{
  nbtrainfeature[,i]<-factor(nbtrainfeature[,i])
}


#create folds
folds<-createFolds(nbtrainfeature$hotel_cluster,k=5)
str(folds)

nbme_factor=0
for (i in 1:5)
{
  train<-nbtrainfeature[(-folds[[i]]),]
  test<-nbtrainfeature[folds[[i]],]
  
  nb_factor<-naiveBayes(hotel_cluster~.,data=train)
  #nb_factor
  
  nbpredict_factor<-predict(nb_factor,test)
  #nbpredict_factor
  
  nbcf_factor<-table(test$hotel_cluster,nbpredict_factor)
  #print(head(nbcf_factor,3))
  
  nbme_factor=(1-sum(diag(nbcf_factor))/sum(nbcf_factor))+nbme_factor
  #print(nbme_factor)
  
  #postResample(trytest$hotel_cluster,trynn_factorpred)
  
}

nbme_factor/5