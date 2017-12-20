import pandas as pd

fileName = "rfpred.csv"
rawds = pd.read_csv(fileName)
print "--- Reading Finished ---"
print rawds.shape
rawds.index.name = 'id'
rawds.columns = ['hotel_cluster']
rawds.to_csv("rfpred.csv")
