

setwd("C:\\Users\\lexb4\\Desktop\\coxTest\\12.riskScore")      #设置工作目录

#绘制train组风险图
rt=read.table("riskTrain.txt",header=T,sep="\t",check.names=F,row.names=1)     #读取train输入文件
rt=rt[order(rt$riskScore),]
riskClass=rt[,"risk"]
lowLength=length(riskClass[riskClass=="low"])
highLength=length(riskClass[riskClass=="high"])
line=rt[,"riskScore"]
line[line>10]=10
pdf(file="riskScoreTrain.pdf",width = 12,height = 5)
plot(line,
     type="p",
     pch=20,
     xlab="Patients (increasing risk socre)",
     ylab="Risk score",
     col=c(rep("green",lowLength),
     rep("red",highLength)))
trainMedianScore=median(rt$riskScore)
abline(h=trainMedianScore,v=lowLength,lty=2)
dev.off()

#绘制test组风险图
rt=read.table("riskTest.txt",header=T,sep="\t",check.names=F,row.names=1)       #读取test输入文件
rt=rt[order(rt$riskScore),]
riskClass=rt[,"risk"]
lowLength=length(riskClass[riskClass=="low"])
highLength=length(riskClass[riskClass=="high"])
line=rt[,"riskScore"]
line[line>10]=10
pdf(file="riskScoreTest.pdf",width = 12,height = 5)
plot(line,
     type="p",
     pch=20,
     xlab="Patients (increasing risk socre)",
     ylab="Risk score",
     col=c(rep("green",lowLength),
     rep("red",highLength)))
abline(h=trainMedianScore,v=lowLength,lty=2)
dev.off()
