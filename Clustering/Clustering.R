x <- c(0, 0, 21, 14, 1, 1)
y <- c(1, 0, 11, 13, 0, 1)

data <- rbind(x,y)
dist(data, method = "euclidean")
dist(data, method = "manhattan")
dist(data, method = "minkowski", p=1) #p=1 manhattan, p=2 eculidean


#------- mahalanobis distace:
#play with the second column and check the result
ma <- cbind(1:6, 4:7)
ma
# var is used to get the variance/co-variance of the data 
S <-  cov(ma)
S
mahalanobis(c(0, 0), 1:2, S)

#------- Hamming distance -------
install.packages("e1071")
library("e1071")
x <- c(1, 0, 0)
y <- c(1, 0, 1)
hamming.distance(x, y)

#------- Levenstein distance -------
install.packages("stringdist")
library("stringdist")
adist("TGGCCAA", "TGGCCGAC")

#------- Cosine 
install.package("coop")
install.packages("lsa")
library("lsa")

vec1 = c( 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 4 )
vec2 = c( 0, 1, 1, 1, 1, 1, 0, 1, 0, 19, 3 )
cosine(vec1, vec2) 


#------- Jaccard --------

install.packages("philentropy")
library("philentropy")

x <- c(1,2,3,4)
y <- c(1,2,3,9)
mymat <- rbind(x,y)
distance(mymat, method = "jaccard")

#-------------DTW --------

install.packages("dtw")
library('dtw')

#note that they are not equal in the size and DTW can tolerate a bit of unequality
vec1 = c( 12, 11, 40, 40, 20, 10, 23, 32, 14, 22, 10 )
vec2 = c( 0, 1, 1, 20, 10, 23, 32, 14, 22, 0, 0, 11, 11 )

res2 <- dtw(vec1,vec2)
res2$distance
res2$index1

#-----------------------------------
idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;
idx
query
reference<-cos(idx)
alignment<-dtw(query,reference,keep=TRUE);

dtwPlotDensity(alignment,main="Sine/cosine: symmetric  alignment, no constraints")

#----------------------------------------------------
#-------- k-means clustering -------------------------

library('stats')
# example has been adapted from: https://www.guru99.com/r-k-means-clustering.html
df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54),
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot(df)

kmresult <- kmeans(df, 3, iter.max = 20)
plot(df, col = kmresult$cluster) 

#-------- k-medoids clustering -------------------------

install.packages("cluster")
library("cluster")
df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54),
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot(df)

kmedres <- pam(df, 3, metric = "euclidean", stand = FALSE)

plot(df, col = kmedres$cluster) 

#-------- DBScan Clustering ----------------------------

install.packages("dbscan")
library("dbscan")
data(iris)
iris
# remove the last column which is text
iris <- as.matrix(iris[,1:4])
iris
plot(iris)

dbsres <- dbscan(iris, eps = 0.8, minPts = 2)
dbsres
plot(iris, col = dbsres$cluster + 1L)

# visualizaing with convex hull: hullplot(iris, dbsres)

#---------OPTICS clusterin --------------------------
library("dbscan")
set.seed(2)
n <- 400
df <- cbind( x = runif(4, 0, 1) + rnorm(n, sd = 0.1),
             y = runif(4, 0, 1) + rnorm(n, sd = 0.1))
true_clusters <- rep(1:4, time = 100)

plot(df)

### run OPTICS
res <- optics(df, eps = 10,  minPts = 10)
res

#  reachability plot
plot(res)

# plot reachability in dendrogram
dend <- as.dendrogram(res)
dend
plot(dend, ylab = "Reachability dist.", leaflab = "none")

#-------------- DIANA  ------------
library('cluster')
data(votes.repub)
votes.repub
dv <- diana(votes.repub, metric = "manhattan", stand = TRUE)
print(dv)
plot(dv)


#-------- GMM ---------------
install.packages('ClusterR')
library('ClusterR')

data(dietary_survey_IBS)
dim(dietary_survey_IBS)

# data (excluding the response variable)
x = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]
dim(x)
# the response variable
y = dietary_survey_IBS[, ncol(dietary_survey_IBS)]
dim(y)

# centering and scaling the data
dat <- center_scale(x, mean_center = T, sd_scale = T)
plot(dat)

gmmres = GMM(dat, 2, dist_mode = "maha_dist", seed_mode = "random_subset", km_iter = 10,em_iter = 10, verbose = F)

plot(gmmres$Log_likelihood)


#---- GMM example 2--------
install.packages("mclust")

library(mclust)

plot(iris)
mb = Mclust(iris[,-5])
summary(mb, parameters = TRUE)

plot(mb, what=c("classification"))
plot(mb, what=c("BIC"))
plot(mb, what=c("uncertainty"))
plot(mb, what=c("density"))


#----------- Elbow Method

df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54), 
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot (df)
# Compute and plot wss for k = 2 to k = 15.
k.max <- 10
wss <- sapply(1:k.max, 
              function(k){ 
                kmeans(df, k, nstart=50, iter.max=10 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

#------- Silhoutte Index---------
# RUN THIS CODE IN R FOR  READABILITY
install.packages('cluster')
library (cluster)

df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54), 
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot (df)

kres <- kmeans(df, 3, iter.max=10 )
#plot(df, col = kmresult$cluster) 

sil <- silhouette(kres$cluster,  df)
sil

print(sil)
windows() # RStudio sometimes does not display silhouette plots correctly
plot(sil)

distiris <- as.matrix(dist(iris[,1:4]))
res <- fastkmed(distiris, 3)
silhouette <- sil(distiris, res$medoid, res$cluster)
silhouette$result[c(1:3,70:75,101:103),]
silhouette$plot


#---------Davies Bouldin, Dunn Index, Entropy -----------

install.packages("clusterCrit")
library("clusterCrit")

df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54), 
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot (df)

kres <- kmeans(df, 2, iter.max=30 )
plot(df, col = kmresult$cluster) 

df <- as.matrix(df)
class(df)

intCriteria(df,kres$cluster,c("davies_bouldin","dunn","silhouette"))

# Compute all the internal indices
intCriteria(df,kres$cluster,"all")
