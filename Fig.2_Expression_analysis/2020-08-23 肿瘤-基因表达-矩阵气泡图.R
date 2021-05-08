2020-8-21叠型柱状图
#加载包
library(ggplot2)
library(reshape2)
library(openxlsx)
setwd("E:\\课题\\ICB 联合Len课题\\Lenvatinib\\express")  
express_melt <- read.xlsx("express.xlsx")#第一行不是数字是肿瘤名字
names(express_melt) = c( 'Tumor', 'Gene','Value',"Type")
ggplot(express_melt, aes(x = Tumor, y = Gene, size = Value, color=Type)) + geom_point()+
  scale_color_gradientn(colours = c('#9c1915',"#81144e","#00305d"))+
  theme(panel.background = element_blank(),#背景为空白
        panel.grid.major = element_line(colour = "gray", linetype  = "dashed"), 
        panel.border = element_rect(colour="black",fill=NA),
        axis.text.x = element_text(size = 12,angle = 45),
        axis.text.y = element_text(size = 12),
        axis.title.y= element_text(size=7,face = "bold"),
        axis.title.x= element_text(size=7,face = "bold"))#边框为黑色

#改x轴标题
axis.title.y= element_text(size=15)
#改x轴文本
theme(axis.text.x = element_text(size = 15, family = "myFont", color = "green", face = "bold", face = "bold", angle = 45,face = "bold", angle = 45face = "bold", angle = 45))## face取值：plain普通，bold加粗，italic斜体，bold.italic斜体加粗

#改图例
theme(legend.text= element_text(size=15, family="myFont",color="black", face= "bold", vjust=0.5, hjust=0.5))
express <- read.xlsx("E:/tumor sun.xlsx",header=TRUE, sep=",",stringsAsFactors = FALSE , row.names = 1)
express <- read.xlsx("E:/sun.xlsx")#第一行不是数字是肿瘤名字
View(express)
fix(express)
express_melt<-melt (express)
View(express_melt)
write.xlsx(express_melt, file = "E:/sun1.xlsx")
??ggplot                

                                           