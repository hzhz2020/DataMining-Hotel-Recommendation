# coding: utf-8

# import libraries
import pandas as pd
import numpy as np
from sklearn import cross_validation
from sklearn.ensemble import RandomForestClassifier

# read training set
fileName = "Dataset/train.csv"
#fileName = "Dataset/isbooking.csv"
df = pd.read_csv(fileName)
print ("--- Reading Finished ---")

#print (df)

# drop unused features
df.drop(df.columns[0], axis=1, inplace=True)
print (df.shape)
df.drop(['date_time','orig_destination_distance','user_id','is_booking','cnt','srch_ci','srch_co'], axis=1, inplace=True)
print (df.shape)
#df.to_csv("hey.csv")

array = df.values
X = array[:,0:16]
Y = array[:,16]
num_folds = 5
num_instances = len(X)
num_trees = 50
print(Y)

kfold = cross_validation.KFold(n=num_instances, n_folds=num_folds) #random_state=seed
model = RandomForestClassifier(n_estimators=num_trees,criterion='gini',n_jobs=-1)
model.fit(X,Y)
#print (model.feature_importances_)
#results = cross_validation.cross_val_score(model, X, Y, cv=kfold)
#print(results.mean())

# read testing set
fileNamet = "Dataset/test.csv"
dft = pd.read_csv(fileNamet)
print ("--- Reading Finished ---")

# drop unused features
dft.drop(dft.columns[0], axis=1, inplace=True)
dft.drop(['date_time','orig_destination_distance','user_id','srch_ci','srch_co'], axis=1, inplace=True)
print(dft.shape)

# ind1 = 0
# ind2 = ind1+100
# df = dft[ind1:ind2]
# array = df.values
# X = array[:,0:16]
# result1 = model.predict_proba(X)
# resultdf1 = pd.DataFrame(result1)
# print (resultdf1)

def kLargest(k,df):
    df = pd.DataFrame(df)
    result={}
    for i in range(0,df.shape[0]):
        row = df.ix[i]
        index = row.idxmax(axis=1)
        result[i]=str(index)
        row[index]=0
        for j in range(1,k):
            index = row.idxmax(axis=1)
            result[i]+=' ' + str(index)
            row[index]=0
    result = pd.DataFrame.from_dict(result,orient='index')
    return result


ind1 = 0
ind2 = ind1+252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result1 = model.predict_proba(X)
result1 = kLargest(5,result1)


ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result2 = model.predict_proba(X)
result2 = kLargest(5,result2)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result3 = model.predict_proba(X)
result3 = kLargest(5,result3)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result4 = model.predict_proba(X)
result4 = kLargest(5,result4)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result5 = model.predict_proba(X)
result5 = kLargest(5,result5)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result6 = model.predict_proba(X)
result6 = kLargest(5,result6)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result7 = model.predict_proba(X)
result7 = kLargest(5,result7)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result8 = model.predict_proba(X)
result8 = kLargest(5,result8)

ind1 += 252825
ind2 += 252825
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result9 = model.predict_proba(X)
result9 = kLargest(5,result9)

ind1 += 252825
ind2 = 2528244
df = dft[ind1:ind2]
array = df.values
X = array[:,0:16]
result10 = model.predict_proba(X)
result10 = kLargest(5,result10)


#array = dft.values
#X = array[:,0:16]
#result = model.predict(X)
#print(result)
#resultdf = pd.DataFrame(result)


combineresult = np.append(result1, result2) 
combineresult = np.append(combineresult, result3) 
combineresult = np.append(combineresult, result4) 
combineresult = np.append(combineresult, result5) 
combineresult = np.append(combineresult, result6) 
combineresult = np.append(combineresult, result7) 
combineresult = np.append(combineresult, result8) 
combineresult = np.append(combineresult, result9) 
combineresult = np.append(combineresult, result10) 

resultdf = pd.DataFrame(combineresult)
#print (resultdf)

resultdf.index.name = 'id'
resultdf.columns = ['hotel_cluster']
resultdf.to_csv('result.csv')
