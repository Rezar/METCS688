#!/usr/bin/env python
# coding: utf-8

# In[3]:


# install open cv like followings:
# pip install opencv-python==3.4.2.16
# pip install opencv-contrib-python==3.4.2.16
# OR
# conda install -c menpo opencv

import cv2 
import numpy as np

img = cv2.imread('/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session 6/funny-chicken.png')
gray= cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)


#sift = cv2.SIFT()

sift = cv2.xfeatures2d.SIFT_create()
kp = sift.detect(gray,None)
img = cv2.drawKeypoints(gray,kp, None, flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

cv2.imwrite('/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session 6/sifteeed.jpg',img)


# In[ ]:




