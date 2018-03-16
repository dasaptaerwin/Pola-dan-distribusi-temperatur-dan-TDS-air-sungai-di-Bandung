######################################################
#####################################################
#####################################################
#####################################################

# PCA of Bandung Area
# Data: BPLH Project in Bandung Area
# Team leader: Dasapta Erwin Irawan
# Code and analysis: Dasapta Erwin Irawan
# Field data: Adhi P., Ali L., Cepi H., Fachrurrozi

source("http://bioconductor.org/biocLite.R") 
biocLite('pcaMethods')
library(pcaMethods) # for pcaMethods package
library(cluster) # for cluster analysis
#library(readxl) # for opening data directly from xls format
#install.packages('gstat')
#library('gstat')
#library('vegan')
library('factoextra')
library('magrittr')

# Load data
df <- read.csv("data/processed/gw_qual_data.csv", header=TRUE)
df <- na.omit(df) # omitting NA if any
is.na(df) # checking NA if any
attach(df)
head(df)
row.names(df)<-df$code # setting row names 
row.names(df)
str(df)# viewing data structure

# Exploratory using pairs() function
# Assesing data patterns
pairs(df[6:15],
      lower.panel=panel.smooth, 
      upper.panel=NULL, 
      pch=20)
pairs(df[16:31],
      lower.panel=panel.smooth, 
      upper.panel=NULL, 
      pch=20)
library('corrplot')
dfcor <- cor(df[6:31])
corrplot(dfcor, method = 'ellipse', type='lower')

# Run PCA (using factoextra package)
## svdImpute = standard pca, with imputation, standardised, method univariate (uv)
df_x <- df[6:31]
pca <- prcomp(df_x, scale = TRUE)
summary(pca)
scores(pca)

## Evaluating results
dev.off()
fviz_eig(pca)

## Plotting results (loadings and scores)
dev.off()
fviz_pca_ind(pca, col.ind = df$type) # plotting scores
fviz_pca_var(pca, col.var = "contrib") # plotting loadings


# Cluster analysis (using 'factoextra' package)
res.dist <- get_dist(df_x, stand = TRUE, method = "pearson")
fviz_dist(res.dist, 
          gradient = list(low = "#00AFBB", 
                          mid = "white", 
                          high = "#FC4E07", 
                          type='lower'))
fviz_nbclust(df_x, kmeans, method = "gap_stat")
km.res <- kmeans(df_x, 3, nstart = 25)
fviz_cluster(km.res, data = df_x,
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal())

# Optimal number of clusters
install.packages('NbClust')
library("NbClust")
res.nbclust <- df_x %>%
  scale() %>%
  NbClust(distance = "euclidean",
          min.nc = 2, max.nc = 10, 
          method = "complete", index ="all") 


# Ref:
## http://www2.stat.unibo.it/montanari/Didattica/Multivariate/CA_lab.pdf
## http://cc.oulu.fi/~jarioksa/opetus/metodi/sessio3.pdf
## http://www2.stat.unibo.it/montanari/Didattica/Multivariate/PCA_lab1.pdf
## http://bioconductor.wustl.edu/bioc/vignettes/pcaMethods
## https://cran.r-project.org/web/packages/vegan/vignettes/intro-vegan.pdf
## http://cc.oulu.fi/~jarioksa/opetus/metodi/vegantutor.pdf

# Geostat analysis 
## Regression tree
library(rpart)
library(rpart.plot)
library(randomForest)

df1 <- df[6:15]
df2 <- df[16:24] 

pairs(df1,
      lower.panel=panel.smooth, 
      upper.panel=NULL, 
     pch=20)
pairs(df2,
     lower.panel=panel.smooth, 
     upper.panel=NULL, 
     pch=20)

tree.bdg <- rpart(Ecoli ~ elv + gwd + wd + DO + EC + PH,
        data = df, minsplit = 2, cp = 0.003) # building the model
print(tree.bdg) 
rpart.plot(tree.bdg, digits = 3, type = 4, extra = 1) # plotting tree
tree.bdg$variable.importance # printing variable importance
printcp(tree.bdg) # printing and plotting error rate
plotcp(tree.bdg)

## make a prediction
ecoli.pred <- predict(tree.bdg, newdata = df)
length(unique(ecoli.pred))
plot(df$Ecoli ~ ecoli.pred, asp = 1, pch = 20, 
     xlab = "fitted",
     ylab = "actual", 
     main = "Ecoli concentration, Bandung, Regression Tree")
grid()
abline(0,1)
dev.off()

## RandomForest

Ecoli.rf <- randomForest(Ecoli ~ elv + gwd + wd + DO + EC + PH, 
                         data = df, importance = T, 
                         na.action = na.omit,
                         mtry = 3) # building an RF model
print(Ecoli.rf) # printing result summary
plot(Ecoli.rf) # plotting error vs num of trees
importance(Ecoli.rf, type = 1)
varImpPlot(Ecoli.rf, type = 1)
Ecoli.pred.rf <- predict(Ecoli.rf, newdata = df)
plot(df$Ecoli ~ Ecoli.pred.rf, asp = 1, pch = 20, 
     xlab = "fitted",
     ylab = "actual", 
     main = "Ecoli concentration, Bandung, Random Forest")
grid()
abline(0,1)

