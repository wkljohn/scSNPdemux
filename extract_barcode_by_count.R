options(max.print=2000)
options(stringsAsFactors=FALSE)

library(Seurat)
args = commandArgs(trailingOnly=TRUE)

if (length(args) < 2){
	print("usage: seurate_get_usable_cellbarcodes.R <10X matrix path> <outpath> <feature cut-off)")
}
scDatapath =  args[1]
outpath = args[2]
minfeat = as.integer(args[3])


tmp10Xobject <- Read10X(data.dir = scDatapath)
if (typeof(tmp10Xobject) == "list"){
	scData <- CreateSeuratObject(counts = tmp10Xobject$`Gene Expression`, min.cells = 2, min.features = minfeat, project = "demuxbarcodes")
}else{
	scData <- CreateSeuratObject(counts = tmp10Xobject, min.cells = 2, min.features = minfeat, project = "demuxbarcodes")
}
write.table(colnames(scData),outpath,quote=F,col.names=F,row.names=F)