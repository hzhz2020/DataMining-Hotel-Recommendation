import pandas as pd
import numpy as np

fileName = "Dataset/train.csv"
rawds = pd.read_csv(fileName)
print "--- Reading Finished ---"

rawds=rawds.loc[rawds['is_booking'] == 1]
rows = rawds.shape[0]
rawds.to_csv("Dataset/isbooking.csv")

print "--- Finished --- "
