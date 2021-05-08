#install.packages("pheatmap")


library(pheatmap)          
inputFile="input2.txt"
groupFile="group2.txt"  
outFile="heatmap.pdf"      
setwd("E:\\Lenvatinib\\TIME")      
rt=read.table(inputFile,header=T,sep="\t",row.names=1,check.names=F)     #读取文件
Type=read.table(groupFile, header=T, sep="\t", row.names=1, check.names=F)     #读取临床文件 

pheatmap(rt,
         annotation=Type,
         cluster_cols = F,
         cluster_rows = F,
         color = colorRampPalette(c("blue", "white", "red"))(50),
         show_colnames = F,
         #border_color ="NA",
         fontsize = 8,
         fontsize_row=6,
         fontsize_col=6)
dev.off()

