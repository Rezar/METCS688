#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import numpy as np
import cv2 as cv
filename = "/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session 6/chickenpic.jpg"
img = cv.imread(filename)
print(img)

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
gray = np.float32(gray)
dst = cv.cornerHarris(gray,2,3,0.04)
#result is dilated for marking the corners, not important
dst = cv.dilate(dst,None)
# Threshold for an optimal value, it may vary depending on the image.
img[dst>0.01*dst.max()]=[0,0,255]
cv.imshow('dst',img)
if cv.waitKey(0) & 0xff == 27:
    cv.destroyAllWindows()


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




