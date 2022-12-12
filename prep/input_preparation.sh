#!/bin/bash

PATHOUT=$1
HOSTDOWNLOAD=$2

#please find out the hostname here:
#you would be able to find it out after accepting the agreement
#https://www.10xgenomics.com/resources/datasets/20k-mixture-of-nsclc-dtcs-from-7-donors-3-v3-1-with-intronic-reads-3-1-standard
#HOSTDOWNLOAD=https://??.10xgenomics.com/

cd $PATHOUT

mkdir $PATHOUT/d1
cd $PATHOUT/d1
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d2
cd $PATHOUT/d2
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d3
cd $PATHOUT/d3
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d4
cd $PATHOUT/d4
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d5
cd $PATHOUT/d5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d6
cd $PATHOUT/d6
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_cloupe.cloupe
curl -O https://s3-us-west-2.amazonaws.com/10x.files/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_analysis.tar.gz
# Output Files
mkdir $PATHOUT/d7
cd $PATHOUT/d7
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_web_summary.html
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_metrics_summary.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_cloupe.cloupe
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_alignments.bam
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_alignments.bam.bai
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_barcodes.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_feature_bc_matrix.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_feature_bc_matrix.tar.gz
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_molecule_info.h5
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_feature_reference.csv
curl -O $HOSTDOWNLOAD/samples/cell-exp/6.1.2/20k_NSCLC_DTC_3p_nextgem_intron_donor_7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_analysis.tar.gz

#merge bam
mkdir $PATHOUT/merged/
samtools merge -o $PATHOUT/merged/merged.bam -@ 2 \
$PATHOUT/d4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_alignments.bam \
$PATHOUT/d7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_alignments.bam \
$PATHOUT/d3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_alignments.bam \
$PATHOUT/d2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_alignments.bam \
$PATHOUT/unassigned/20k_NSCLC_DTC_3p_nextgem_intron_Multiplex_count_unassigned_alignments.bam \
$PATHOUT/d1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_alignments.bam \
$PATHOUT/d6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_alignments.bam \
$PATHOUT/d5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_alignments.bam 

samtools index $PATHOUT/merged/merged.bam

#extract matrix
tar -xvf $PATHOUT/d4/20k_NSCLC_DTC_3p_nextgem_intron_donor_4_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d4/
tar -xvf $PATHOUT/d7/20k_NSCLC_DTC_3p_nextgem_intron_donor_7_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d7/
tar -xvf $PATHOUT/d3/20k_NSCLC_DTC_3p_nextgem_intron_donor_3_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d3/
tar -xvf $PATHOUT/d2/20k_NSCLC_DTC_3p_nextgem_intron_donor_2_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d2/
tar -xvf $PATHOUT/unassigned/20k_NSCLC_DTC_3p_nextgem_intron_Multiplex_count_raw_feature_bc_matrix.tar.gz -C $PATHOUT/unassigned/
tar -xvf $PATHOUT/d1/20k_NSCLC_DTC_3p_nextgem_intron_donor_1_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d1/
tar -xvf $PATHOUT/d6/20k_NSCLC_DTC_3p_nextgem_intron_donor_6_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d6/
tar -xvf $PATHOUT/d5/20k_NSCLC_DTC_3p_nextgem_intron_donor_5_count_sample_feature_bc_matrix.tar.gz -C $PATHOUT/d5/

#matrix merging 
mkdir $PATHOUT/merged/sample_feature_bc_matrix/
zcat $PATHOUT/d4/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d7/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d3/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d2/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/unassigned/raw_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d1/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d6/sample_feature_bc_matrix/barcodes.tsv.gz \
$PATHOUT/d5/sample_feature_bc_matrix/barcodes.tsv.gz | bgzip -c > $PATHOUT/merged/sample_feature_bc_matrix/barcodes.tsv.gz

cp $PATHOUT/unassigned/raw_feature_bc_matrix/features.tsv.gz $PATHOUT/merged/sample_feature_bc_matrix/

SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
Rscript $SCRIPTPATH/merge_matrix.R $PATHOUT
