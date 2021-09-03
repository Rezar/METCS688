

import cv2 as cv
    
filename = "/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS688_WebAnalyticsMining/toGithub/Session 6/funny-chicken.png"
img = cv.imread(filename)
#print(img)

hog = cv.HOGDescriptor()
h = hog.compute(img)

print(h)




