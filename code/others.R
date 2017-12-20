###PCA can only be used on numverical variable
#######many of the variable are actually categorical, but listed as int in the dataset
#######is it valid to perform PCA this way?
trainfeaturePCA<-trainfeature[,-17]
pc<-princomp(trainfeaturePCA,cor = TRUE, scores = TRUE)
pc
###how many component to choose: decision choice:1.usually when "cumulative proportion" reach 0.98
#look at std of each component and choose the components with std above 1
summary(pc)
plot(pc)
###elbow curve
plot(pc,type="l")
##visual way to look at principle component

##loading of PC
##score of pc 
##get the matrix:
pc_choice<-pc$scores[,1:12]
head(pc_choice,5)

#how to combine two matrix in R:(any easier way?) use cbind
#pca_matrix_svm<-cbind(trainfeature[,1:3],trainfeature[,17])
pca_matrix_svm<-cbind(as.data.frame(pc_choice),trainfeature$hotel_cluster)
head(pca_matrix_svm,5)

#changes the names of the attributes.
names(pca_matrix_svm)[names(pca_matrix_svm)=="trainfeature$hotel_cluster"]<-"hotel_cluster"
head(pca_matrix_svm,5)


##########################


#tuned<-tune(svm_factor,hotel_cluster~.,data=winetrain ,kerner="linear",ranges = list(cost=c(0.001,0.01,0.1,1,10)))
#summary(tuned)
ind<-sample(2,nrow(trainfeature),replace = TRUE,pro=c(2/3,1/3))
trytrain<-trainfeature[ind==1,]
trytest<-trainfeature[ind==2,]
svm_factor<-svm(hotel_cluster~.,data=trytrain,kernel="linear",cost=0.1,scale=FALSE)
print(svm_factor)
svm_factor_pred<-predict(svm_factor,trytest)
head(svm_factor_pred,5)


###########################################
muti_trainfeature<-trainfeature
ind<-sample(2,nrow(muti_trainfeature),replace = TRUE,pro=c(2/3,1/3))
trytrain<-muti_trainfeature[ind==1,]
trytest<-muti_trainfeature[ind==2,]

trynn<-multinom(hotel_cluster~., data=trytrain, maxit=1000, trace=T, MaxNWts = 10000)


##sort by most influential variable
topModels<-varImp(trynn)
topModels$Variables<-row.names(topModels)
topModels<-topModels[order(-topModels$Overall),]
head(topModels,5)

