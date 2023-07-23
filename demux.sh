#!/bin/bash
#===============================================================================
#
#          FILE:  demux.sh
#
#         USAGE:  ./demux.sh
#
#   DESCRIPTION:
#
#        AUTHOR:  John Wong, j.wong@dkfz.de
#  ORGANIZATION:  DKFZ
#       VERSION:  1.0
#===============================================================================

#program inputs
#1. read in cellranger output
#2. read in SNP info in BED/VCF format
#3. read in sample metadata in ? format

#program flow
#1. retrieve whitelist barcode
#2. call cellsnp
#3. call bcftools to process the genotyped VCF and called SNPs
#4. call vireo


#requirements
#1. module load BCFtools
#2. conda activate cellSNPvireo
#3. vireo/cellsnp-lite binary

#read parameters
programname=$0

function usage {
    echo "usage: $programname [-abch] [-i infile] [-o outfile]"
    echo "=======input files=========="
    echo "  -b      bam file path"
    echo "  -i      path to 10X Genomics matrix folder (barcodes.tsv.gz, features.tsv.gz, matrix.mtx.gz)"
    echo "=======Other parameters=========="
    echo "  -g      SNP array VCF file"
    echo "  -p      population SNP VCF file"
    echo "  -n      number of samples to demultiplex"
    echo "  -o      output path"
    echo "  -t      threads [Default=1]"
    echo "  -c      count cut-off to consider a barcode [Default=100]"
    echo "  -f      overwrite old results when f=1"
    echo "  -h      display help"
    exit 1
}

#get parameters  value
while getopts i:b:g:p:t:h:n:o:c:f: flag
do
    case "${flag}" in
        i) infile=${OPTARG};;
        b) bamfile=${OPTARG};;
        g) snpfile=${OPTARG};;
        p) popsnpfile=${OPTARG};;
        t) threads=${OPTARG};;
        n) nsamples=${OPTARG};;
        c) countcut=${OPTARG};;
        o) outpath=${OPTARG};;
        f) override=1;;
    esac
done

#check usage
if (( $# < 2 ))
then
        usage
fi

#check infile
if [ -z "$infile" ]
  then
    echo "Error: No barcode matrix path supplied"
    exit 1
fi

#check snpfile
#if [ -z "$snpfile" ]
#  then
#    echo "Error: No snpfile supplied"
#    exit 1
#fi

#check popsnpfile
if [ -z "$popsnpfile" ]
  then
    echo "Error: No population snp file supplied"
    exit 1
fi

#check bamfile
if [ -z "$bamfile" ]
  then
    echo "Error: No bamfile supplied"
    exit 1
fi

#check outpath
if [ -z "$outpath" ]
  then
    echo "Error: No outpath supplied"
    exit 1
fi

#check threads
if [ -z "$threads" ]
  then
    threads=1
fi

#check nsamples
if [ -z "$nsamples" ] && [ -z "$snpfile" ]
  then
    echo "Error: No N-samples supplied"
    exit 1
fi

#check cut-off
if [ -z "$countcut" ]
  then
    countcut=100
fi

#create output path
if [[ ! -e $outpath ]]; then
    mkdir $outpath
fi 

if [[ ! -e $outpath/cellsnp ]]; then
    mkdir $outpath/cellsnp
fi 

if [[ ! -e $outpath/vireo_1 ]]; then
    mkdir $outpath/vireo_1
fi 

if [[ ! -e $outpath/results ]]; then
    mkdir $outpath/results
else
		if [ -z "$override" ]; then
			echo "Execution halted, results folder already exists. Please delete that to re-run"
			exit 1
		else
			rm -r $outpath
			echo "Removing old results"
		fi
fi 
#######################################################
#  Job summary
#######################################################

echo "#######################################################"
echo "matrix path:      ${infile}"
echo "threads:          ${threads}"
echo "bam file:         ${bamfile}"
echo "population snp:   ${popsnpfile}"
echo "out path:         ${outpath}"
echo "count cutoff:     ${countcut}"
echo "#######################################################"

#######################################################
#  pipeline start
#######################################################
BARCODE=${infile}/barcodes.tsv.gz
OUT_DIR=${outpath}

#extract barcode if in gz
#if [[ $infile == *.gz ]]
#then
#	gunzip -c $infile > ${outpath}/barcodes.tsv
#else
#	cp $infile ${outpath}/barcodes.tsv
#fi

#extracting cell barcodes by cut-off
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo "Filtering barcodes"
Rscript $SCRIPTPATH/extract_barcode_by_count.R ${infile} ${outpath}/barcodes.tsv $countcut

#get n-barcodes
NBARCODES=$(wc -l ${outpath}/barcodes.tsv)
echo "Barcodes to use: $NBARCODES"

echo "Running cellsnp-lite"
#echo "cellsnp-lite -s $bamfile -b ${outpath}/barcodes.tsv -O $OUT_DIR -R $popsnpfile -p $threads --minMAF 0.1 --minCOUNT 10 --gzip"
cellsnp-lite -s $bamfile -b ${outpath}/barcodes.tsv -O ${outpath}/cellsnp -R $popsnpfile -p $threads --minMAF 0.1 --minCOUNT 10 --gzip



#######################################################
#  vireo start
#######################################################
## OLD MODE 1: no donor genotype
#vireo -c $outpath/cellsnp -N $nsamples  -p $threads --randSeed=1 --outDir=$outpath/vireo_1 --noPlot
## OLD MODE 2: with donor genotype
#vireo -c $outpath/cellsnp  -p $threads --randSeed=2 --outDir=$outpath/vireo_2 -d $snpfile -t GT --forceLearnGT --noPlot


if [ -z "$snpfile" ];
then
	echo "Running vireo without genotypes"
	vireo -c $outpath/cellsnp -p $threads --randSeed=1 --outDir=$outpath/vireo_1 -t GT -N $nsamples
else
	#MODE 3, expand snp scope
	echo "merging input vcf and sc vcf"
	bcftools reheader -h $SCRIPTPATH/vcfheader $outpath/cellsnp/cellSNP.base.vcf.gz | zcat | fgrep -v "AD=0;" | bgzip -c > $outpath/cellsnp/cellSNP.base.rehead.vcf.gz
	
	bcftools sort -O z -o $outpath/cellsnp/cellSNP.base.rehead.sorted.vcf.gz $outpath/cellsnp/cellSNP.base.rehead.vcf.gz
	
	bcftools index -t -f $outpath/cellsnp/cellSNP.base.rehead.sorted.vcf.gz
	
	bcftools index -t $snpfile
	
	bcftools merge -O z -o $outpath/cellsnp/merged.vcf.gz $snpfile $outpath/cellsnp/cellSNP.base.rehead.sorted.vcf.gz
	
	gunzip $outpath/cellsnp/merged.vcf.gz
	awk -v OFS="\t" '{if ($9 == "."){$9 = "GT";}; print $0}' $outpath/cellsnp/merged.vcf | bgzip -c > $outpath/cellsnp/merged.vcf.gz
	rm $outpath/cellsnp/merged.vcf
	
	echo "Running vireo"
	vireo -c $outpath/cellsnp -p $threads --randSeed=1 --outDir=$outpath/vireo_1 -d $outpath/cellsnp/merged.vcf.gz -t GT --forceLearnGT #--noPlot
fi

#####################################
#Finalize results
mv $outpath/vireo_1/donor_ids.tsv $outpath/results/
mv $outpath/vireo_1/summary.tsv $outpath/results/
mv $outpath/vireo_1/*.gz $outpath/results/

#plot results
echo "plotting diagnostic plots..."
Rscript $SCRIPTPATH/plot_GT_prob.R $outpath/results/

echo "cleaning up..."
rm -r $outpath/vireo_1
