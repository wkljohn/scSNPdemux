
options(max.print=2000)
options(stringsAsFactors=FALSE)

library(Seurat)
library(reshape2)
library(ggplot2)
args = commandArgs(trailingOnly=TRUE)

if (length(args) < 1){
	print("usage: plot_GT_prob.R <outpath>")
}
outpath = args[1]


prob = read.table(paste(outpath,"/prob_singlet.tsv.gz",sep=""),header=T,row.names=1)
#calculate distance
distmat = matrix(0,dim(prob)[2],dim(prob)[2])
for (i in 1:dim(prob)[2]){
	for (j in 1:dim(prob)[2]){
		distmat[i,j] = mean(abs(prob[,i] - prob[,j ]))
	}
}
rownames(distmat) = colnames(prob)
colnames(distmat) = colnames(prob)

pdf(paste(outpath,"/Sample_GT_distance.pdf",sep=""),width=5,height=5)
col<- colorRampPalette(c("blue", "white", "red"))(256)
heatmap(distmat, col =  col,  scale="column",cexRow=1,cexCol=1)#, cexRow=1 + 1/log10(nrow(distmat)), cexCol=1 + 1/log10(nrow(distmat))) Colv = NA, Rowv = NA,
dev.off()


#convert
probdf = melt(prob)
colnames(probdf) = c("Sample","genotype_probability")
probdf = probdf

probdf = probdf[which(probdf$genotype_probability > 0.01),]
pdf(paste(outpath,"/GT_prob_plot_no_zero.pdf",sep=""))
ggplot(probdf, aes(x=Sample, y=genotype_probability)) + 
    geom_violin() #+ ylim(0.01,max(probdf$genotype_probability))
dev.off()