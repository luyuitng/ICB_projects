2020-8-21µşĞÍÖù×´Í¼
#¼ÓÔØ°ü
install.packages("ggplot2")
library(ggplot2)
setwd("E:\\Lenvatinib\\mutation")  
#¶ÁÈëÎÄ¼ş
Mutation0 <- read.csv("mutation.gene.csv",header=TRUE, sep=",",stringsAsFactors = FALSE)
Mutation1 <- read.csv("E:/mutation.tumor.line1.csv",header=TRUE, sep=",",stringsAsFactors = FALSE)
Mutation2 <- read.csv("mutation.tumor.line2.csv",header=TRUE, sep=",",stringsAsFactors = FALSE)

View(Mutation0)
View(Mutation1)
View(Mutation2)
fix(Mutation0)

#»­Í¼
ggplot(Mutation0,aes(x=Gene,y=Data,fill=factor(Mutation)))+
  geom_col(position = "fill", width = 0.8)+
  scale_fill_manual ( values=rev(c('#0066CC', '#666666','#9933CC', '#CC3366',"#009933") ) )+#ºì »Ò ×Ï À¶ ÂÌ
  theme(axis.title.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y = element_blank(),
        axis.text.y.left = element_blank())

ggplot(Mutation2,aes(x=Tumor,y=Data,fill=factor(Mutation)))+
  geom_col(position = "fill", width = 0.8)+
  scale_fill_manual ( values=rev(c('#0066CC', '#666666','#9933CC', '#CC3366',"#009933" ) ) )+#ºì »Ò ×Ï À¶ ÂÌ
  theme(axis.title.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank())
??ggplot
