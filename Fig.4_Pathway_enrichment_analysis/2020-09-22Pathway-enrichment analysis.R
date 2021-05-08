library(openxlsx)
library(clusterProfiler)
library(ggplot2)
library(enrichplot)
library(GOplot)
library(DOSE)
library(stringr)
library(UpSetR)

library(grid)
library(plyr)
#用原始数据进行富集分析
#设置工作路径：
setwd("E:\\NEW GO") 
#读取文件：
gdc.gene.select <- read.csv("gdc.gene.select.len.csv")
View(gdc.gene.select)
suppressMessages(library(org.Hs.eg.db))#加载包
gene<- bitr(gdc.gene.select$genes,fromType = 'SYMBOL' , toType = 'ENTREZID',OrgDb = 'org.Hs.eg.db')
#基因名ID转换，把基因名转换成ENTREZID
GO <- enrichGO(
  gene$ENTREZID,
  OrgDb = 'org.Hs.eg.db',
  keyType = "ENTREZID",
  ont = "ALL",
  pvalueCutoff = 0.05,
  pAdjustMethod = "BH",
  qvalueCutoff = 0.05,
  minGSSize = 10,
  maxGSSize = 500,
  readable = TRUE
) #GO富集
#方式二，从GO.len富集结果中挑选需要的通GO.select画图，读取整理的文件GO.select.CSV
GO.len <- read.csv("GO.select.CSV")
View(GO.len)
GO.select<-list(GO.len)#修改最前面和最后面，CSV中第一例删去；修改最前面；修改最后面row.name.具体在文件中txt
View(GO.select)
fix(GO.select)
GO.select <- setReadable(GO.select, 'org.Hs.eg.db', 'ENTREZID')
fix(GO)

#KEGG富集分析
KEGG<-enrichKEGG(
  
  gene$ENTREZID,
  
  organism = "hsa",#我用到是数据是人的组织数据，所以这里选择‘hsa’
  
  keyType = "kegg",
  
  pvalueCutoff = 0.05,
  
  pAdjustMethod = "BH",
  
  universe,
  
  minGSSize = 5,
  
  maxGSSize = 500,
  
  qvalueCutoff = 0.2,
  
  use_internal_data = FALSE
  
) #KEGG富集
 KEGG <- setReadable(KEGG, 'org.Hs.eg.db', 'ENTREZID')#将数字转换为基因
#方式二，从KEGG富集结果中挑选需要的通KEGG.len画图，读取整理的文件GO.select.CSV
fix(KEGG)
KEGG.len <- read.csv("KEGG.select.CSV")
View(KEGG.len)
KEGG.len<-list(KEGG.len)#修改最前面和最后面，CSV中第一例删去；修改最前面；修改最后面row.name; universe删除一个括号；后面的name不要，具体在文件中txt
fix(KEGG.len)
KEGG.len <- setReadable(KEGG.len, 'org.Hs.eg.db', 'ENTREZID')
#柱形图，气泡图
barplot(GO.select, split="ONTOLOGY", showCategory  = 32)+facet_grid(ONTOLOGY~., scale="free") #facet_grid定义离散变量的矩阵的格式，scale为尺度.Fig1-BP:生物过程，CC：细胞组成，MF:分子功能。
dotplot(GO.select, split="ONTOLOGY", showCategory  = 32)+facet_grid(ONTOLOGY~., scale="free") #GO聚类气泡图,fig2
barplot(KEGG.len, showCategory  = 16) #KEGG聚类条形图,showCategory图片展示多少
dotplot(KEGG.len, showCategory  = 16) #KEGG聚类气泡图
#网络图
enrichplot::cnetplot(GO.select,circular=TRUE,showCategory  = 16, colorEdge = TRUE)#GO通路-基因网络图，fig5
enrichplot::cnetplot(KEGG.len,circular=TRUE,showCategory  = 16, colorEdge = TRUE)#KEGG通路-基因网络图,fig6
#此图可能不显示线条，解决方案下载随意一个包，重新更新R就会出现，加载后要从头重新加载原来的包
install.packages("ggplot2")
#热图
enrichplot::heatplot(GO.select,showCategory = 32) #GO富集瀑布图,fig7。差异基因太多就不好看
enrichplot::heatplot(KEGG.len,showCategory = 16) #kegg富集瀑布图,fig8
#集合图
upsetplot(GO.select,16)
upsetplot(KEGG.len, 16)

upset(GO.select)
#互作图
emapplot(GO.select,showCategory = 16, circular=TRUE)
emapplot(KEGG.len,showCategory = 16, circular=TRUE)
install.packages("plyr")
#集合图,数据集为0,1
library(UpSetR)
require(ggplotify)
example = read.csv("GO.chord.len.CSV",header=TRUE,row.names=1,check.names = FALSE)
upset(example, sets = c("Regulation of ERK1 and ERK2 cascade", 
 "Regulation of PI3K signaling", 
"FGFR signaling pathway", 
"Regulation of MAPK activity" ,
"Positive regulation of cell adhesion",
"T cell activation",
"VEGFR signaling pathway",
"Regulation of receptor signaling pathway via JAK-STAT",
"Negative regulation of immune system process",
"Sprouting angiogenesis",
"Negative regulation of cytokine production",
"Leukocyte proliferation"),
      group.by = 'degree',
      order.by = "freq",
      point.size = 3, # 交互点的大小
      line.size = 1, # 交互线的宽度
      att.pos = 'bottom',
      att.color = 'yellowgreen', # 变量展示图颜色
      number.angles = 0,
      text.scale = 2,
      matrix.color=c("black"), #点点颜色
      sets.bar.color=c("seagreen"),#左条形图颜色
      main.bar.color="#3399CC")#上条形图颜色

example1 = read.csv("KEGG.chord.len.CSV",header=TRUE,row.names=1,check.names = FALSE)
upset(example1, sets = c("Rap1 signaling pathway", 
                        "Ras signaling pathway", 
                        "MAPK signaling pathway", 
                        "Central carbon metabolism in cancer" ,
                        "PI3K-Akt signaling pathway",
                        "EGFR tyrosine kinase inhibitor resistance",
                        "Regulation of actin cytoskeleton",
                        "Focal adhesion",
                        "Signaling pathways regulating pluripotency of stem cells",
                        "Endocytosis",
                        "Cell adhesion molecules",
                        "Gap junction"),
      group.by = 'degree',
      order.by = "freq",
      point.size = 3, # 交互点的大小
      line.size = 1, # 交互线的宽度
      att.pos = 'bottom',
      att.color = 'yellowgreen', # 变量展示图颜色
      number.angles = 0,
      text.scale = 2,
      matrix.color=c("black"), 
      sets.bar.color=c("seagreen"),
      main.bar.color="#3399CC")
#韦恩图
library(VennDiagram) 
library(yyplot)
library(devtools)
library(qrcode)
library(yyplot)
library(ggimage)
library(rJava)
library(venneuler)
#第一种韦恩图，数据集是0,1
fix(chord.len.GO)
yyplot::ggvenn(chord.len.GO)+
  theme_void()+
  theme(legend.position = "none")
#第二种韦恩图，数据集是通路基因
data.GO =read.table("GO.venn.txt",header = T,sep="\t")
View(data.GO)
venn.plot <- venn.diagram(list(A = data.GO$Regulation.of.ERK1.and.ERK2.cascade,
           B = data.GO$Regulation.of.PI3K.signaling,
           C=data.GO$Regulation.of.MAPK.activity,
           D=data.GO$Positive.regulation.of.cell.adhesion,
           E=data.GO$T.cell.activation),
 filename ="2Venn.tiff",
 lty =1,
 lwd =2,
 col ="black",  #"transparent",
 fill =c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
 cat.col =c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
 cat.cex =1,
 cat.fontface="bold",
 margin =0.05,
 cex=1.3,#里面交集字的大小
 alpha = 0.5)#透明度 

data.KEGG =read.table("KEGG.venn.txt",header = T,sep="\t")
View(data.KEGG)
venn.plot1 <- venn.diagram(list(A = data.KEGG$Rap1.signaling.pathway,
                               B = data.KEGG$Ras.signaling.pathway,
                               C=data.KEGG$MAPK.signaling.pathway,
                               D=data.KEGG$PI3K.Akt.signaling.pathway,
                               E=data.KEGG$Central.carbon.metabolism.in.cancer),
                          filename ="Venn1.tiff",
                          lty =1,
                          lwd =2,
                          col ="black",  #"transparent",
                          fill =c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
                          cat.col =c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
                          cat.cex =1,
                          cat.fontface="bold",
                          margin =0.05,
                          cex=1.3,#里面交集字的大小
                          alpha = 0.5)#透明度 )

#GO和弦图
GOplotIn.len<-GO.select[1:12,c(2,3,7,9)] #根据P值排列，我们先提取GO富集结果的前10行，和提取ID,Description,p.adjust,GeneID四列。
View(GOplotIn.len)
GOplotIn.len$geneID <-str_replace_all(GOplotIn.len$geneID,'/',',') #把GeneID列中的’/’替换成‘,’
names(GOplotIn.len)<-c('ID','Term','adj_pval','Genes')#修改列名，后面和弦图绘制的时候需要这样的格式，不然会报错
GOplotIn.len$Category = "BP"#因为我们提取的前10列为BP,所以再加一列分类信息
View(GOplotIn.len)
genedata.len<- data.frame(ID=gdc.gene.select$genes,logFC=gdc.gene.select$logFC)
circ.len.GO<-GOplot::circle_dat(GOplotIn.len,genedata.len) #GOplot导入数据格式整理
chord.len.GO<-chord_dat(data = circ.len.GO,genes = genedata.len) #生成含有选定基因的数据框
View(chord.len.GO)
write.csv(chord.len.GO, file = "GO.chord.len.CSV")
fix(chord.len.GO)

GOChord( #GO富集和弦图，fig9
  data = chord.len.GO,
  title = 'GOchord plot',
  space = 0,#GO Term间距
  limit = c(1,1),
  gene.order = 'logFC',
  gene.space = 0.25,
  gene.size = 4,
  lfc.col = c('red','pink'), #上下调基因颜色
  #ribbon.col = brewer.pal(length(GOplotIn$Term)),#GO Term colors
  process.label = 10
  #GO Term字体大小
)
#KEGG和弦图
KEGGplotIn.len<-KEGG.len[1:12,c(1,2,6,8)]
View(KEGGplotIn.len)
KEGGplotIn.len$geneID <-str_replace_all(KEGGplotIn.len$geneID,'/',',') #把GeneID列中的’/’替换成‘,’
names(KEGGplotIn.len)<-c('ID','Term','adj_pval','Genes')#修改列名，后面和弦图绘制的时候需要这样的格式，不然会报错
KEGGplotIn.len$Category = "KEGG"#因为我们提取的前10列为BP,所以再加一列分类信息
View(KEGGplotIn.len)
genedata.len<- data.frame(ID=gdc.gene.select$genes,logFC=gdc.gene.select$logFC)
circ.len.KEGG<-GOplot::circle_dat(KEGGplotIn.len,genedata.len) #GOplot导入数据格式整理
chord.len.KEGG<-chord_dat(data = circ.len.KEGG,genes = genedata.len) #生成含有选定基因的数据框
View(genedata.len)
View(chord.len.KEGG)
write.csv(chord.len.KEGG, file = "KEGG.chord.len.csv")
fix(chord.len.KEGG)

GOChord( #GO富集和弦图，fig9
  data = chord.len.KEGG,
  title = 'KEGGchord plot',
  space = 0,#GO Term间距
  limit = c(1,1),
  gene.order = 'adj_pval',
  gene.space = 0.25,
  gene.size = 4,
  lfc.col = c('red','pink'), #上下调基因颜色
  #ribbon.col = brewer.pal(length(GOplotIn$Term)),#GO Term colors
  process.label = 10
  #GO Term字体大小
)

#柱形图，气泡图
barplot(GO.select, split="ONTOLOGY", showCategory  = 14, title = 'GO analysis ')+facet_grid(ONTOLOGY~., scale="free") #facet_grid定义离散变量的矩阵的格式，scale为尺度.Fig1-BP:生物过程，CC：细胞组成，MF:分子功能。
dotplot(GO.select, split="ONTOLOGY", showCategory  = 15)+facet_grid(ONTOLOGY~., scale="free") #GO聚类气泡图,fig2
barplot(KEGG.len, showCategory  = 22, title = 'KEGG analysis ') #KEGG聚类条形图,showCategory图片展示多少
dotplot(KEGG.len, showCategory  = 22) #KEGG聚类气泡图
#网络图
enrichplot::cnetplot(GO.select,circular=TRUE,showCategory  = 14, colorEdge = TRUE)#GO通路-基因网络图，fig5
enrichplot::cnetplot(KEGG.len,circular=TRUE,showCategory  = 16, colorEdge = TRUE)#KEGG通路-基因网络图,fig6
#此图可能不显示线条，解决方案下载随意一个包，重新更新R就会出现，加载后要从头重新加载原来的包
install.packages("ggplot2")
#热图
enrichplot::heatplot(GO.select,showCategory = 50) #GO富集瀑布图,fig7。差异基因太多就不好看
enrichplot::heatplot(KEGG.len,showCategory = 50) #kegg富集瀑布图,fig8
#网络图
cnetplot(GO.select)
cnetplot(KEGG.len)
#集合图
upsetplot(GO.select)
upsetplot(KEGG.len )
#互作图
emapplot(GO.len,showCategory = 20, circular=TRUE)
emapplot(KEGG.len,circular=TRUE)
emapplot(GO.select,showCategory = 14, circular=TRUE)


Regulation.of.ERK1.and.ERK2.cascade=data.GO$Regulation.of.ERK1.and.ERK2.cascade,
Regulation.of.PI3K.signaling=data.GO$Regulation.of.PI3K.signaling,
FGFR.signaling.pathway=data.GO$FGFR.signaling.pathway,
Regulation.of.MAPK.activity=data.GO$Regulation.of.MAPK.activity,
Positive.regulation.of.cell.adhesion=data.GO$Positive.regulation.of.cell.adhesion,
T.cell.activation=data.GO$T.cell.activation,
VEGFR.signaling.pathway=data.GO$VEGFR.signaling.pathway,
Regulation.of.receptor.signaling.pathway.via.JAK.STAT=data.GO$Regulation.of.receptor.signaling.pathway.via.JAK.STAT,
Negative.regulation.of.immune.system.process=data.GO$Negative.regulation.of.immune.system.process,
Sprouting.angiogenesis=data.GO$Sprouting.angiogenesis,
Negative.regulation.of.cytokine.production=data.GO$Negative.regulation.of.cytokine.production,
Leukocyte.proliferation=data.GO$Leukocyte.proliferation,
Regulation.of.DNA.biosynthetic.process=data.GO$Regulation.of.DNA.biosynthetic.process,
Positive.regulation.of.cell.cycle=data.GO$Positive.regulation.of.cell.cycle,
Regulation.of.extrinsic.apoptotic.signaling.pathway=data.GO$Regulation.of.extrinsic.apoptotic.signaling.pathway,
Response.to.ROS=data.GO$Response.to.ROS),


#首先查看R 版本信息

sessionInfo()

R version 3.6.2 (2019-12-12)

#R版本3.5以上可以安装ggtree 2.0

#安装ggtree，首先需要安装BiocManager

install.packages("BiocManager")

#然后安装ggtree

library(BiocManager)

BiocManager::install("ggtree")

#安装 devtools安装来自github上的包

install.packages("yyplot")
install.packages("ggimage")
install.packages("devtools")
install.packages("qrcode")
#安装yyplot
install.packages("ggimage")
install.packages("devtools")
install.packages("qrcode")
library(devtools)
library(ggtree)
library(qrcode)
library(yyplot)
library(ggimage)
showtextdb
devtools::install_github('YuLab-SMU/ggtree')
devtools::install_github("GuangchuangYu/yyplot")
ggqrcode("Haozhi ke neng shi ge sha zi hahahha")




upset(movies, # 绘图数据集
      sets.bar.color = "red", # 侧边柱子颜色
      matrix.color = 'blue', # 相互关系连线（点）的颜色
      main.bar.color = 'black', # 交互数量柱状图颜色及附图颜色
      mainbar.y.label = 'Intersection Size', # 主柱状图Y轴标题
      sets.x.label = '这是X轴标题', # 左侧柱状图X轴标题
      point.size = 1.8, # 交互点的大小
      line.size = 1.2, # 交互线的宽度
      att.pos = 'bottom',
      att.color = 'yellowgreen', # 变量展示图颜色
      number.angles = 0, # 柱状图上数字旋转角度
      group.by = 'degree', # 数据分组标准可以降序（degree)也可以按数据集（sets)
      # 下面的代码主要是展示感兴趣的变量之间的关系
      attribute.plots=list(gridrows=60,
                           plots=list(list(plot=scatter_plot, 
                                           x="ReleaseDate", 
                                           y="AvgRating"),
                                      list(plot=scatter_plot, 
                                           x="ReleaseDate", 
                                           y="Watches"),
                                      list(plot=scatter_plot, 
                                           x="Watches", 
                                           y="AvgRating"),
                                      list(plot=histogram, 
                                           x="ReleaseDate")), 
                           ncols = 2))
