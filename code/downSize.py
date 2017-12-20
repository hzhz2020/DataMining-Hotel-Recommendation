import pandas as pd
import numpy as np

fileName = "Dataset/train.csv"
rawds = pd.read_csv(fileName)
print "--- Reading Finished ---"
rows = rawds.shape[0]

# 0.01%
arr = np.random.permutation(rows*1/10000)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize001.csv")

# 0.05%
arr = np.random.permutation(rows*5/10000)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize005.csv")

# 0.1%
arr = np.random.permutation(rows*1/100)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize01.csv")

# 0.5%
arr = np.random.permutation(rows*5/1000)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize05.csv")

# 1%
arr = np.random.permutation(rows*1/100)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize1.csv")

# 5%
arr = np.random.permutation(rows*5/100)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize5.csv")

# 10%
arr = np.random.permutation(rows*10/100)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize10.csv")

# 15%
arr = np.random.permutation(rows*15/100)
dsds = rawds[rawds.index.isin(arr)]
dsds.to_csv("Dataset/train-downsize15.csv")

print "--- Downsize Finished --- "
