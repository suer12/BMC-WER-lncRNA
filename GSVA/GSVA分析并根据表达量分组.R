#整理tcga数据,提取肿瘤组数据
a=read.table("symbol.txt",header = T)
#基因名称有重复，处理下呢
library(limma)
rt=as.matrix(a)
rownames(rt)=rt[,1]
exp=rt[,2:ncol(rt)]
dimnames=list(rownames(exp),colnames(exp))
data=matrix(as.numeric(as.matrix(exp)),nrow=nrow(exp),dimnames=dimnames)
data=avereps(data)#出现重复样本取均值处理
data=data+1
data=log(data)

#做GSVA
library(GSVA)
library(GSEABase)
geneSet=getGmt("c2.cp.kegg.v7.0.symbols.gmt")
keggEs=gsva(expr = as.matrix(data),
            gset.idx.list = geneSet,
            kcdf="Gaussian",
            parallel.sz=10,
            method="gsva")
write.csv(keggEs,"GSVAresult.csv")
#来个热图
library(pheatmap)
pheatmap(keggEs,cluster_row = FALSE,
         show_colnames = F,
         cluster_cols = F,
         fontsize_row=3 )  #算了吧，天啊太多了

#根据嘌呤通路的激活状态对样本分组,b1组是抑制组，b2组是激活组
library(dplyr)
b=read.table("purinestate.txt",header = T)
k=median(b$KEGG_PURINE_METABOLISM)
b1=filter(b,b$KEGG_PURINE_METABOLISM<k)
b2=filter(b,b$KEGG_PURINE_METABOLISM>k)
b1$Group=1
b2$Group=2
write.csv(b1,"抑制组.csv")
write.csv(b2,"激活组.csv")
