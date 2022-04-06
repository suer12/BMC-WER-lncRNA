

setwd("C:\\Users\\lexb4\\Desktop\\coxTest\\13.survStat")             #设置工作目录

#绘制train组生存状态图
rt=read.table("riskTrain.txt",header=T,sep="\t",check.names=F,row.names=1)        #读取train输入文件
rt=rt[order(rt$riskScore),]
riskClass=rt[,"risk"]
lowLength=length(riskClass[riskClass=="low"])
highLength=length(riskClass[riskClass=="high"])
color=as.vector(rt$fustat)
color[color==1]="red"
color[color==0]="green"
pdf(file="survStatTrain.pdf",width = 12,height = 5)
plot(rt$futime,
     pch=19,
     xlab="Patients (increasing risk socre)",
     ylab="Survival time (years)",
     col=color)
abline(v=lowLength,lty=2)
dev.off()

#绘制test组生存状态图
rt=read.table("riskTest.txt",header=T,sep="\t",check.names=F,row.names=1)         #读取test输入文件
rt=rt[order(rt$riskScore),]
riskClass=rt[,"risk"]
lowLength=length(riskClass[riskClass=="low"])
highLength=length(riskClass[riskClass=="high"])
color=as.vector(rt$fustat)
color[color==1]="red"
color[color==0]="green"
pdf(file="survStatTest.pdf",width = 12,height = 5)
plot(rt$futime,
     pch=19,
     xlab="Patients (increasing risk socre)",
     ylab="Survival time (years)",
     col=color)
abline(v=lowLength,lty=2)
dev.off()

