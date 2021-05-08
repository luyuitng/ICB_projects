2020-08-24 基因突变热图
library(pheatmap) #加载pheatmap函数
library(RColorBrewer)
library(openxlsx)
setwd("E:\\Lenvatinib\\mutation") 
mutation1 <- read.csv("mutation.csv", row.names = 1)#第一行不是数字是肿瘤名字
mutation2 <- read.csv("mutation total.csv", row.names = 1)#第一行不是数字是肿瘤名字
View(mutation1)
View(mutation2)
pheatmap(mutation1)
fix(mutation1)
fix(mutation2)
pheatmap(mutation1, display_numbers = TRUE)#聚类
pheatmap(mutation1, display_numbers = F)
#加数字 颜色 不聚类
pheatmap(mutation, cluster_row = FALSE, cluster_col = FALSE ,
         display_numbers = TRUE,
         color = colorRampPalette(c("white", "red"))(100))

#加数字 颜色 坐标轴长度 标题 字体大小 筛选显示的内容
pheatmap(mutation, color = colorRampPalette(c("white", "red"))(50),
         cellwidth = 15, cellheight = 15, main = "Example heatmap", fontsize = 12, 
         display_numbers =ifelse(mutation <1, "","*"))

#保留几位小数，设置数字的颜色。
#较常用的有"%.2f"（保留小数点后两位），"%.1e"（科学计数法显示，保留小数点后一位），number_color设置显示内容的颜色：
pheatmap(mutation, display_numbers = TRUE, 
         number_format = "%.0f", number_color="red",fontsize_number = 10) #"%.2f"表示保留小数点后两位

#设置整行整列名字
colnames(mutation) = paste("Tumor", 1:32, sep = "")
View(mutation)
rownames(mutation) = paste("Gene", 1:15, sep = "")
View(mutation)
#进行数据的标准化，分割图例
pheatmap(scale(mutation), legend_breaks = c(1,10,20))#scale进行数据的标准化
#可以实现按行数据间皮尔逊相关性进行聚类
pheatmap(mutation, scale = "row", clustering_distance_rows = "correlation")

#终突变热图 显示>=3%突变 ???
pheatmap(mutation, color = colorRampPalette(c("white", "#3399FF","#CC66FF"))(50),
         main = "Example heatmap", fontsize = 13, 
         display_numbers =ifelse(mutation <3, "","???"), 
         angle_col = "315",
         cellwidth = 28, cellheight = 28,
         cluster_row = FALSE)
#终突变热图 显示全部数字
pheatmap(mutation, color = colorRampPalette(c("white", "#0066CC","#9933CC"))(50),
         main = "Example heatmap", fontsize = 13, number_format = "%.0f",
         number_color="black",fontsize_number = 10,
         display_numbers =T, 
         angle_col = "315",
         cellwidth = 27, cellheight = 27,
         cluster_row = FALSE)
pheatmap(mutation1, color = colorRampPalette(c("white", "#0066CC","#9933CC"))(50),
         main = "Example heatmap", fontsize = 13, number_format = "%.0f",
         number_color="black",fontsize_number = 10,
         display_numbers =T, 
         angle_col = "315",
         cellwidth = 27, cellheight = 27,
         cluster_row = FALSE)
#画坐标轴
pheatmap(mutation2, color = colorRampPalette(c("white", "#999999","#666666"))(50),
         main = "Example heatmap", fontsize = 13, number_format = "%.0f",
         number_color="black",fontsize_number = 10,
         display_numbers =T, 
         angle_col = "315",
         cellwidth = 27, cellheight = 27,
         cluster_row = FALSE,cluster_cols = F)
write.xlsx(mutation, file = "E:/mutation.xlsx")
