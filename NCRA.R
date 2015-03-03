dat=read.csv("modi.csv")
dim(dat)
head(dat)
subg=subset(data,dat$class=="GALAXY")
#considering only galaxies and eliminating other objects like AGN,STARS etc close to 600 objcts
dim(sub)                                                                           
sub1=subset(subG,subG$Z<0.5)
dim(sub1)
newsub=subset(sub1,sub1$r<23)
dim(newsub)
newsub=subset(sub,sub$petro_r<22)
dim(newsub)
[1] 2822   21
newsub=subset(sub,sub$petro_r<22)
dim(newsub1)
dim(newsub)
[1] 1038   21
mod=svm(newsub$Z~newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z,data=newsub)
Error: could not find function "svm"
library(e1071)
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z,data=newsub)
summary(mod)
Call:
  svm(formula = newsub$Z ~ newsub$petro_u + newsub$petro_g + newsub$petro_r + newsub$petro_i + 
        newsub$petro_z, data = newsub)


Parameters:
  SVM-Type:  eps-regression 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.2 
epsilon:  0.1 


Number of Support Vectors:  933



p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
mean((p-newsub$Z)^2)
[1] 0.00544984
sqrt(0.005449842)
[1] 0.07382305
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z,type=nu-regression,data=newsub)
?svm
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
mean((p-newsub$Z)^2)
[1] 0.005508557
sqrt(0.005508557)
[1] 0.07421965
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z,type="nu-regression",kernel="sigmoid",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
mean((p-newsub$Z)^2)
[1] 5.283061
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z,type="nu-regression",kernel="linear",data=newsub)
predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
mean((p-newsub$Z)^2)
[1] 0.007450145
library(mlbench)
library(caret)
Loading required package: lattice
Loading required package: ggplot2
?caret
?train
data(newsub)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
model <- train(diabetes~., data=newsub, method="svm", preProcess="scale", trControl=control)
model <- train(Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z, data=newsub, method="svm", preProcess="scale", trControl=control)
model <- train(Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z, data=newsub, method="lssvmLinear", preProcess="scale", trControl=control)
Loading required package: kernlab
Eror in train.default(x, y, weights = w, ...) : 
wrong model type for regression
model <- train(Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_i+newsub$petro_z, data=newsub, method="svmBoundrangeString", preProcess="scale", trControl=control)
Error in train.default(x, y, weights = w, ...) : 
'x' should be a character matrix with a single column for string kernel methods
df=data.frame(newsub$Z,newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z)
attach(df)
model <- train(Z~., data=df, method="svmBoundrangeString", preProcess="scale", trControl=control)
Error in eval(expr, envir, enclos) : object 'Z' not found
names(df)
[1] "newsub.Z"       "newsub.petro_u" "newsub.petro_g" "newsub.petro_r" "newsub.petro_i"
[6] "newsub.petro_z"
model <- train(newsub.Z~., data=df, method="svmBoundrangeString", preProcess="scale", trControl=control)
Error in train.default(x, y, weights = w, ...) : 
'x' should be a character matrix with a single column for string kernel methods
model <- train(Z~., data=df, method="svmLinear", preProcess="scale", trControl=control)
Error in eval(expr, envir, enclos) : object 'Z' not found
model <- train(newsub.Z~., data=df, method="svmLinear", preProcess="scale", trControl=control)
importance <- varImp(model, scale=FALSE)
Loading required package: pROC
Warning message:
In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
there is no package called ‘pROC’
print(importance)
loess r-squared variable importance
Overall
newsub.petro_g 0.16859
newsub.petro_u 0.07417
newsub.petro_r 0.02245
newsub.petro_z 0.01860
newsub.petro_i 0.01214
plot(importance)
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
mean((p-newsub$Z)^2)
[1] 0.008230884
sqrt(mean((p-newsub$Z)^2))
[1] 0.09072422
 mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r,type="nu-regression",data=newsub)
 p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
sqrt(mean((p-newsub$Z)^2))
[1] 0.07637834
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_z,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
sqrt(mean((p-newsub$Z)^2))
[1] 0.07478737
 head(dat)
id       ra1       dec1         Z  class        objid    distance       ra2       dec2  petro_u
1 41037849  36.73189  0.6298728 0.7625060 GALAXY 1.237646e+18 0.003413946  36.73188  0.6298171 24.36789
2 42037703  37.60768  0.6304187 0.8548182 GALAXY 1.237646e+18 0.007493379  37.60768  0.6302939 24.14954
3 42036157  37.70085  0.6308597 0.8680737 GALAXY 1.237646e+18 0.015776042  37.70111  0.6308396 23.03538
4 43031332  37.95449  0.6310112 0.9234536 GALAXY 1.237646e+18 0.003483106  37.95449  0.6309536 22.01308
5 21050148 251.99170 35.1349300 1.0244810 GALAXY 1.237655e+18 0.018122604 251.99141 35.1347617 21.53761
6 21044864 252.00530 35.0877600 0.7922037    AGN 1.237655e+18 0.006723524 252.00519 35.0877369 22.39566
petro_g  petro_r  petro_i  petro_z         pr90          pr50     psfu     psfg     psfr     psfi
1 24.92329 24.86205 22.21800 22.69269 -9999.000000 -9999.0000000 24.42615 24.66221 24.83860 22.51499
2 24.29909 23.12824 21.77921 20.63113     1.681758     0.8134195 23.32243 24.45033 23.49420 22.28575
3 23.57205 22.89398 22.05940 21.38148     2.667115     1.5377960 25.25452 24.54177 24.06993 22.54775
4 22.68000 22.34472 21.16034 20.88411     1.520732     1.0214370 24.61973 23.76052 23.12491 21.83661
5 21.91907 21.54688 21.24201 22.83981     4.535885     1.4359210 22.86615 22.67437 22.22990 21.88906
6 22.43959 25.46410 25.69026 21.79786 -9999.000000 -9999.0000000 23.28476 22.73266 22.43353 22.41542
psfz
                1 22.41637
                2 20.94050
                3 23.18299
                4 20.84189
                5 21.36679
                6 21.70984
head(newsub)
                id      ra1        dec1          Z  class        objid    distance      ra2         dec2
                143  21051521 251.7358 35.12844000 0.16827500 GALAXY 1.237655e+18 0.006227068 251.7357 35.128430055
                151  21045864 251.8227 35.11906000 0.13150970 GALAXY 1.237655e+18 0.009062449 251.8225 35.118968427
                205  21026300 251.8818 34.92737000 0.26131210 GALAXY 1.237655e+18 0.003711311 251.8817 34.927333910
                522  22038186 252.6813 34.97673000 0.36270790 GALAXY 1.237655e+18 0.004414316 252.6812 34.976683343
                1002 31003589 351.5161 -0.08250115 0.04256271 GALAXY 1.237657e+18 0.005270818 351.5161 -0.082588047
                1061 31006077 351.9060 -0.00962562 0.06452460 GALAXY 1.237657e+18 0.003901214 351.9060 -0.009690608
                petro_u  petro_g  petro_r  petro_i  petro_z      pr90      pr50     psfu     psfg     psfr
                143  22.90212 21.83656 21.70291 21.47242 21.59039 0.9903306 0.5984894 22.87326 21.93812 21.47801
                151  24.48848 21.90731 21.37898 21.16820 20.65214 1.7752260 0.8831179 23.09637 22.39057 21.69644
                205  21.26330 21.18718 20.60295 21.29049 20.75228 2.1729010 0.8628701 21.53756 21.36796 20.88576
                522  25.48094 22.61095 21.42443 20.68011 19.75327 1.9951950 0.7902741 23.47035 22.62035 21.78257
                1002 22.44535 21.59083 21.79372 21.42394 20.86430 1.3328400 0.6535776 22.82396 22.06888 22.03313
                1061 22.40049 21.53140 21.42018 21.31433 22.06597 1.5879760 0.7732726 22.64425 21.87798 21.88668
                psfi     psfz
                143  21.42393 21.02237
                151  21.26005 20.90811
                205  21.36906 20.83166
                522  20.92776 20.15741
                1002 22.00230 21.96238
                1061 21.87778 21.31757
 mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_z+newsub$psfg,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
sqrt(mean((p-newsub$Z)^2))
[1] 0.0723106
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_z+newsub$psfg+newsub$psfr,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
sqrt(mean((p-newsub$Z)^2))
[1] 0.06290023
mod=svm(newsub$Z~newsub$petro_u+newsub$petro_g+newsub$petro_r+newsub$petro_z+newsub$psfg+newsub$psfr+newsub$psfi,type="nu-regression",data=newsub)
p=predict(mod,data.frame(newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z))
sqrt(mean((p-newsub$Z)^2))
 [1] 0.06226328
 plot(newsub$Z,p)
 plot(newsub$Z,p,xlim=c(0,1),ylim=c(0,1))
 abline(0,1)
 abline(0,1,col="red")
 cor(df)
                newsub.Z newsub.petro_u newsub.petro_g newsub.petro_r newsub.petro_i newsub.petro_z
                newsub.Z        1.00000000      0.2203385      0.3730464      0.1177211     0.05161176    -0.05902533
                newsub.petro_u  0.22033849      1.0000000      0.4257521      0.3810486     0.26129111     0.25243509
                newsub.petro_g  0.37304642      0.4257521      1.0000000      0.7494372     0.70280856     0.49110410
                newsub.petro_r  0.11772110      0.3810486      0.7494372      1.0000000     0.83089974     0.68876479
                newsub.petro_i  0.05161176      0.2612911      0.7028086      0.8308997     1.00000000     0.66663716
                newsub.petro_z -0.05902533      0.2524351      0.4911041      0.6887648     0.66663716     1.00000000
df=data.frame(newsub$Z,newsub$petro_u,newsub$petro_g,newsub$petro_r,newsub$petro_i,newsub$petro_z+newsub$psfu+newsub$psfg+newsub$psfr+newsub$psfi+newsub$psfz)
cor(df)
inTrain=createDataPartition(sub$Z,p=0.80,list=F)
train=sub[inTrain,]
test=sub[-inTrain,]
dim(train)
[1] 7203   21
dim(test)
[1] 1800   21
inTrain=createDataPartition(newsub$Z,p=0.80,list=F)
train=sub[inTrain,]
test=sub[-inTrain,]
dim(test)
[1] 8171   21
train=newsub[-inTrain]
train=newsub[inTrain,]
test=newsub[-inTrain,]
dim(train)
[1] 832  21
dim(test)
[1] 206  21
mod=svm(train$Z~train$petro_u+train$petro_g+train$petro_r+train$petro_i+train$petro_z,data=train)
p=predict(mod,data.frame(train$petro_u,train$petro_g,train$petro_r,train$petro_i,train$petro_z))
mean((p-train$Z)^2)
[1] 0.005448778
sqrt(mean((p-train$Z)^2))
 [1] 0.07381584
p=predict(mod,data.frame(test$petro_u+test$petro_g+test$petro_r+test$petro_i+test$petro_z))
mean((p-test$Z)^2)
[1] 0.01343224
Warning message:
                In p - test$Z :
                longer object length is not a multiple of shorter object length
mean((p-train$Z)^2)
[1] 0.005448778
sqrt(mean((p-train$Z)^2))
[1] 0.07381584
p1=predict(mod,data.frame(test$petro_u+test$petro_g+test$petro_r+test$petro_i+test$petro_z))
sqrt(mean((p1-test$Z)^2))
 [1] 0.1158975

