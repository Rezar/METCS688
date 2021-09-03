#!/usr/bin/env python
# coding: utf-8

# In[10]:


#------- One hot coding ---------
from numpy import array
from numpy import argmax
from sklearn.preprocessing import LabelBinarizer
import pandas as pd


# define example
sampledata = ['chicken', 'chicken', 'cat', 'chicken', 'dog', 'dog', 'horse', 'chicken', 'dog', 'horse']
values = array(sampledata)
print(values)

lb = LabelBinarizer()
lb_results = lb.fit_transform(sampledata)
lb_results_df = pd.DataFrame(lb_results)

print("one-hot encoded:")
print(lb_results_df.head())

#------ Dummy coding -------------
import pandas as pd

df = pd.DataFrame(data=sampledata, columns=['dummy'])
dummies = pd.get_dummies(df['dummy'])
print("dummies:")
print(dummies)
 


# In[ ]:





# In[ ]:




