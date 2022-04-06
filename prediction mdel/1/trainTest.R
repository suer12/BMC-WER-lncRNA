

#install.packages("caret")

setwd("C:\\Users\\lexb4\\Desktop\\coxTest\\04.trainTest")      
rt=read.table("expTime.txt",sep="\t",header=T,check.names=F)


library(caret)
inTrain<-createDataPartition(y=rt[,3],p=0.5,list=F)
train<-rt[inTrain,]
test<-rt[-inTrain,]
write.table(train,file="train.txt",sep="\t",quote=F,row.names=F)
write.table(test,file="test.txt",sep="\t",quote=F,row.names=F)


