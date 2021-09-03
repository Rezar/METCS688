#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session6/chickenpic.jpg

import cv2
import numpy as np

#Create MSER object
mser = cv2.MSER_create()

#Your image path i-e receipt path
img = cv2.imread('/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session 6/chickenpic.jpg')

#Convert to gray scale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
vis = img.copy()

#detect regions in gray scale image
regions, _ = mser.detectRegions(gray)
hulls = [cv2.convexHull(p.reshape(-1, 1, 2)) for p in regions]
cv2.polylines(vis, hulls, 1, (0, 255, 0))
cv2.imshow('img', vis)
cv2.waitKey(0)






