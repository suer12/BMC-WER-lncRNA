

#install.packages("pheatmap")

library(pheatmap)
setwd("C:\\Users\\lexb4\\Desktop\\coxTest\\11.pheatmap")                   #设置工作目录

#绘制train组风险热图
rt=read.table("riskTrain.txt",sep="\t",header=T,row.names=1,check.names=F)      #读取train输入文件
rt=rt[order(rt$riskScore),]
rt1=rt[c(3:(ncol(rt)-2))]
rt1=t(rt1)
rt1=log2(rt1+0.01)
annotation=data.frame(type=rt[,ncol(rt)])
rownames(annotation)=rownames(rt)
pdf(file="heatmapTrain.pdf",width = 12,height = 5)
pheatmap(rt1, 
         annotation=annotation, 
         cluster_cols = FALSE,
         fontsize_row=11,
         fontsize_col=3,
         color = colorRampPalette(c("green", "black", "red"))(50) )
dev.off()

#绘制test组风险热图
rt=read.table("riskTest.txt",sep="\t",header=T,row.names=1,check.names=F)      #读取test输入文件
rt=rt[order(rt$riskScore),]
rt1=rt[c(3:(ncol(rt)-2))]
rt1=t(rt1)
rt1=log2(rt1+0.01)
annotation=data.frame(type=rt[,ncol(rt)])
rownames(annotation)=rownames(rt)
pdf(file="heatmapTest.pdf",width = 12,height = 5)
pheatmap(rt1, 
         annotation=annotation, 
         cluster_cols = FALSE,
         fontsize_row=11,
         fontsize_col=3,
         color = colorRampPalette(c("green", "black", "red"))(50) )
dev.off()

