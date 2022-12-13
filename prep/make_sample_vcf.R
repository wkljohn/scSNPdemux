library("vcfR")

if (length(args)==0) {
  stop("barcode argument must be supplied (barcode).csv", call.=FALSE)
} else if (length(args)==1) {
  barcode_sample_assignment=read.csv(args[1])

}

DP=Matrix::readMM("cellSNP.tag.DP.mtx")
AD=Matrix::readMM("cellSNP.tag.AD.mtx")
OTH=Matrix::readMM("cellSNP.tag.OTH.mtx")
barcodes=read.table("cellSNP.samples.tsv")
#read existing vcf
vcf <- read.vcfR("cellSNP.base.vcf.gz", verbose = FALSE )

colnames(DP) = barcodes$V1
colnames(AD) = barcodes$V1
colnames(OTH) = barcodes$V1

#subset informative barcodes
#barcodes_valid = which(barcodes$V1 %in% barcode_sample_assignment$cell_barcode)
DP=DP[,barcode_sample_assignment$cell_barcode]
AD=AD[,barcode_sample_assignment$cell_barcode]
OTH=OTH[,barcode_sample_assignment$cell_barcode]
#barcodesSubset=barcodes$V1[barcodes_valid]
samplelist=unique(barcode_sample_assignment$feature_call)
samplelist=samplelist[!grepl("\\|",samplelist)]

#create gt sum per sample
ADlist=list()
DPlist=list()
OTHlist=list()
for (i in 1:length(samplelist)){
	print(paste("processing",samplelist[i]))
	barcodes_of_sample = barcode_sample_assignment[which(barcode_sample_assignment$feature_call == samplelist[i]),]$cell_barcode
	#print(head(barcodes_of_sample))
	#barcodesidx = which(as.character(barcodesSubset) %in% barcodes_of_sample)
	barcodesidx = which(as.character(barcodes$V1) %in% barcodes_of_sample)
	ADlist[[length(ADlist) + 1]] = (Matrix::rowSums(AD[,barcodesidx]))
	print(max(DP[,barcodesidx]))
	DPlist[[length(DPlist) + 1]]  = (Matrix::rowSums(DP[,barcodesidx]))
	OTHlist[[length(OTHlist) + 1]] = (Matrix::rowSums(OTH[,barcodesidx]))
}

ADmtx = do.call(cbind,ADlist)
DPmtx = do.call(cbind,DPlist)
OTHmtx = do.call(cbind,OTHlist)


#select informative rows
informativerows = which(rowSums(ADmtx) > 50)
ADmtx = ADmtx[informativerows,]
DPmtx = DPmtx[informativerows,]
OTHmtx = OTHmtx[informativerows,]
vcffilt = vcf[informativerows]
GRatioMTX = ADmtx / DPmtx
GTmtx = ADmtx
HomoGT = GRatioMTX >= 0.95 #GTmtx == DPmtx
HeteroGT = GRatioMTX>=0.05 & !HomoGT
WTGT = GRatioMTX <= 0.05 | GTmtx == 0
LowDP = DPmtx < 8
GTmtx[HomoGT] = "1/1"
GTmtx[HeteroGT] = "0/1"
GTmtx[WTGT] = "0/0"
GTmtx[LowDP] = "."

GTmtx = data.frame(GTmtx,stringsAsFactors=F)
colnames(GTmtx) = samplelist

write.vcf(vcffilt,"vcffilt.vcf.gz")
write.table(GTmtx,"GT_encoded_matrix.tsv",sep="\t",quote=F,row.names=F)

write.table(data.frame(rep("GT",dim(GTmtx)[1])),"GT_col.tsv",sep="\t",quote=F,row.names=F)
