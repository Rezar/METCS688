#!/usr/bin/env python
# coding: utf-8

# In[15]:


#---- PCA toy example --------
import numpy as np
from sklearn.decomposition import PCA
from sklearn.decomposition import IncrementalPCA

X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [2,2] ,[3, 2],[3,3]])
ipca = IncrementalPCA(n_components=1) # IncrementalPCA is better than PCA, because it manages memory
ipca.fit(X)
IncrementalPCA(n_components=1)
ipca.transform(X)


# In[74]:


#----LDA dimensionality reduction toy example ------
import numpy as np
#from sklearn.lda import LDA
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA

X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [2,2] ,[3, 2], [3,3]])
Y = np.array([1, 1, 1, 1, 2, 2,1,1]) # Y is used for class labels (blue and red)
trf = LDA() 
trf.fit(X,Y)
trf.transform(X)


# In[3]:


from scipy.fftpack import fft, ifft
import numpy as np
x = np.array([1.0, 2.0, 1.0, -1.0, 1.5])
y = fft(x)
y


# In[ ]:





# In[ ]:




