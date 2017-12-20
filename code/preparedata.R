#removing not useful feature
trainfeature<-train.downsize001
trainfeature$X<-NULL
trainfeature$is_booking<-NULL
trainfeature$cnt<-NULL
trainfeature$date_time<-NULL
trainfeature$srch_ci<-NULL
trainfeature$srch_co<-NULL
trainfeature$user_id<-NULL
trainfeature$orig_destination_distance<-NULL
trainfeature$hotel_cluster<-factor(trainfeature$hotel_cluster)







