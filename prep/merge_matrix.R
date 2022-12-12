
args = commandArgs(trailingOnly=TRUE)
if (length(args) < 1) {
  stop("Usage: Rscript merge_matrix.R <path> ", call.=FALSE)
}
pathin = args[1]

listread = c("d4","d7","d3","d2","unassigned","d1","d6","d5")
mmfinal = Matrix::readMM(paste(pathin,"/",listread[1],"/sample_feature_bc_matrix/matrix.mtx.gz",sep=""))
for (i in 2:length(listread)){
	print(paste("read matrix",listread[i]))
	if (listread[i] == "unassigned"){
		mmfinal = cbind(mmfinal, Matrix::readMM(paste(pathin,"/",listread[i],"/raw_feature_bc_matrix/matrix.mtx.gz",sep="")))
	}else{
		mmfinal = cbind(mmfinal, Matrix::readMM(paste(pathin,"/",listread[i],"/sample_feature_bc_matrix/matrix.mtx.gz",sep="")))
	}
}

Matrix::writeMM(mmfinal,paste(pathin,"/merged/sample_feature_bc_matrix/matrix.mtx.gz",sep=""))