#removing not useful feature
trainfeature<-train.downsize001
trainfeature$X<-NULL
trainfeature$ids_booking<-NULL
trainfeature$cnt<-NULL
trainfeature$date_time<-NULL
trainfeature$srch_ci<-NULL
trainfeature$srch_co<-NULL
trainfeature$user_id<-NULL
trainfeature$orig_destination_distance<-NULL
trainfeature$hotel_cluster<-factor(trainfeature$hotel_cluster)

library(randomForest)
library(rminer)
library(caret)
library(mlbench)
library(Metrics)


rfm1<-randomForest(hotel_cluster~.,data = train)
print(rfm1)
# print(rfm1) same as command rfm1

#after creating the model, can be used to make prediction on test set
rfpred<-predict(rfm1,newdata=test)
head(test$hotel_cluster,10)

library(data.table)

write.csv(rfpred,file="rfpred",col.names = TRUE)
#write.csv(rfpred,file="rfpred",row.names= FALSE)
setnames(rfpred, old=c("X","x"), new=c("id", "hotel_cluster"))
View(rfpred)

