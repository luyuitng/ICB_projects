#install.packages("corrplot")

library(corrplot)                   #引用包
setwd("E:\\Lenvatinib\\corroplot")    #设置工作目录

#读取免疫结果文件，并对数据进行整理
immune=read.table("Pancancer.txt",sep="\t",header=T,row.names=1,check.names=F)
immune=as.matrix(immune)
#绘制相关性图形
pdf(file="PanCancer.pdf",width=8,height=8)
corrplot(immune, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "upper", #("full", "lower", "upper"
         tl.pos = "lt",# If character, it must be one of"lt", "ld", "td", "d" or "n". "lt"(default if type=="full") means left andtop, "ld"(default if type=="lower") means left and diagonal, "td"(default iftype=="upper") means top and diagonal(near), "d" means diagonal, "n" mean don’t add textlabel.
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         bg ="white",#背景颜色
         tl.cex=1.1,#标签字体大小
         title = "PanCancer", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("#00305d", "white", "#9c1915"))(50))
corrplot(immune,
         add = TRUE, 
         type = "lower", 
         method = "number", 
         order = "original",
         col = "black", 
         diag = FALSE, #diag是否显示对角线值
         tl.pos = "n", #坐标基因的位置
         cl.pos = "n",
         number.cex = 0.7)#数字大小
dev.off()
#BRCA.txt
BRCA=read.table("BRCA.txt",sep="\t",header=T,row.names=1,check.names=F)
BRCA=as.matrix(BRCA)
pdf(file="1BRCA.pdf",width=8,height=8)
corrplot(BRCA, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "BRCA", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#BLCA.txt
BLCA=read.table("BLCA.txt",sep="\t",header=T,row.names=1,check.names=F)
BLCA=as.matrix(BLCA)
pdf(file="BLCA.pdf",width=8,height=8)
corrplot(BLCA, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "BLCA", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#ESCA.txt
ESCA=read.table("ESCA.txt",sep="\t",header=T,row.names=1,check.names=F)
ESCA=as.matrix(ESCA)
pdf(file="ESCA.pdf",width=8,height=8)
corrplot(ESCA, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "ESCA", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#GBM.txt
GBM=read.table("GBM.txt",sep="\t",header=T,row.names=1,check.names=F)
GBM=as.matrix(GBM)
pdf(file="GBM.pdf",width=8,height=8)
corrplot(GBM, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "GBM", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#HNSC.txt
HNSC=read.table("HNSC.txt",sep="\t",header=T,row.names=1,check.names=F)
HNSC=as.matrix(HNSC)
pdf(file="HNSC.pdf",width=8,height=8)
corrplot(HNSC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "HNSC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

KIRC=read.table("KIRC.txt",sep="\t",header=T,row.names=1,check.names=F)
KIRC=as.matrix(KIRC)
pdf(file="KIRC.pdf",width=8,height=8)
corrplot(KIRC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "KIRC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#KIRP.txt
KIRP=read.table("KIRP.txt",sep="\t",header=T,row.names=1,check.names=F)
KIRP=as.matrix(KIRP)
pdf(file="KIRP.pdf",width=8,height=8)
corrplot(KIRP, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "KIRP", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#LIHC.txt
LIHC=read.table("LIHC.txt",sep="\t",header=T,row.names=1,check.names=F)
LIHC=as.matrix(LIHC)
pdf(file="LIHC.pdf",width=8,height=8)
corrplot(LIHC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "LIHC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#LUAD.txt
LUAD=read.table("LUAD.txt",sep="\t",header=T,row.names=1,check.names=F)
LUAD=as.matrix(LUAD)
pdf(file="LUAD.pdf",width=8,height=8)
corrplot(LUAD, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "LUAD", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#LUSC.txt
LUSC=read.table("LUSC.txt",sep="\t",header=T,row.names=1,check.names=F)
LUSC=as.matrix(LUSC)
pdf(file="LUSC.pdf",width=8,height=8)
corrplot(LUSC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "LUSC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#OV.txt
OV=read.table("OV.txt",sep="\t",header=T,row.names=1,check.names=F)
OV=as.matrix(OV)
pdf(file="OV.pdf",width=8,height=8)
corrplot(OV, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "OV", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#PAAD.txt
PAAD=read.table("PAAD.txt",sep="\t",header=T,row.names=1,check.names=F)
PAAD=as.matrix(PAAD)
pdf(file="PAAD.pdf",width=8,height=8)
corrplot(PAAD, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "PAAD", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#PRAD.txt
PRAD=read.table("PRAD.txt",sep="\t",header=T,row.names=1,check.names=F)
PRAD=as.matrix(PRAD)
pdf(file="PRAD.pdf",width=8,height=8)
corrplot(PRAD, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "PRAD", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#READ.txt
READ=read.table("READ.txt",sep="\t",header=T,row.names=1,check.names=F)
READ=as.matrix(READ)
pdf(file="READ.pdf",width=8,height=8)
corrplot(READ, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "READ", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#SKCM.txt
SKCM=read.table("SKCM.txt",sep="\t",header=T,row.names=1,check.names=F)
SKCM=as.matrix(SKCM)
pdf(file="SKCM.pdf",width=8,height=8)
corrplot(SKCM, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "SKCM", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#STAD.txt
STAD=read.table("STAD.txt",sep="\t",header=T,row.names=1,check.names=F)
STAD=as.matrix(STAD)
pdf(file="STAD.pdf",width=8,height=8)
corrplot(STAD, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "STAD", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#THCA.txt
THCA=read.table("THCA.txt",sep="\t",header=T,row.names=1,check.names=F)
THCA=as.matrix(THCA)
pdf(file="THCA.pdf",width=8,height=8)
corrplot(THCA, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "THCA", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#UCEC.txt
UCEC=read.table("UCEC.txt",sep="\t",header=T,row.names=1,check.names=F)
UCEC=as.matrix(UCEC)
pdf(file="UCEC.pdf",width=8,height=8)
corrplot(UCEC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "UCEC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#CHOL.txt
CHOL=read.table("CHOL.txt",sep="\t",header=T,row.names=1,check.names=F)
CHOL=as.matrix(CHOL)
pdf(file="CHOL.pdf",width=8,height=8)
corrplot(CHOL, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "CHOL", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
#CESC.txt
CESC=read.table("CESC.txt",sep="\t",header=T,row.names=1,check.names=F)
CESC=as.matrix(CESC)
pdf(file="CESC.pdf",width=8,height=8)
corrplot(CESC, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "CESC", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()

#COAD.txt
COAD=read.table("COAD.txt",sep="\t",header=T,row.names=1,check.names=F)
COAD=as.matrix(COAD)
pdf(file="COAD.pdf",width=8,height=8)
corrplot(COAD, 
         order = "original", #"original","AOE", "FPC", "hclust", "alphabet"
         type = "lower", #("full", "lower", "upper"
         method="pie",#"circle", "square", "ellipse", "number","shade","color", "pie"
         tl.col="black",#标签字体颜色
         tl.cex=1.1,#标签字体大小
         bg ="white",#背景颜色
         number.cex = 0.9,
         addCoef.col = "gray",#增加数字
         title = "COAD", mar=c(0, 0, 1, 0),
         col=colorRampPalette(c("blue", "white", "red"))(50))
dev.off()
