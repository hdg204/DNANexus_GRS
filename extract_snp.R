extract_snp=function(chr,bp){
  #------------------------------------------------------------------------------
	# Function Name: extract_snp
	# Purpose: A function to extract particular snps on the DNA Nexus platform from the RStudio Workbench implementation
	# Author: Dr. Harry Green, University of Exeter
	# Date Created: 24/01/23
	# Dependencies: depends on the package rbgen being installed. Use install.packages( "http://www.well.ox.ac.uk/~gav/resources/rbgen_v1.1.5.tgz", repos = NULL, type = "source" ) then library('rbgen') to ensure the correct version is installed
	# Notes: this function takes two inputs, the chromosome and base pair position in build 37. It exports a list with two elements, one is a dataframe with the imputed genotypes from dna nexus and one is the snp info, with rsid and the allele codes
	#------------------------------------------------------------------------------
	
  bgen_file=paste("../../mnt/project/Bulk/Imputation/UKB\ imputation\ from\ genotype/ukb22828_c",chr,"_b0_v3.bgen",sep='')
 
  sample=read.table("../../mnt/project/Bulk/Imputation/UKB\ imputation\ from\ genotype/ukb22828_c1_b0_v3.sample",header=T) #this file has all the samples in it, but there's a dummy line at the start
  eid=sample$ID_1[2:nrow(sample)]
  
  #the rbgen package wants the chromosome in two digit form, e.g. '08'
  if (chr<10){
    chr_str=paste('0',chr,sep='')
  }else{
    chr_str=as.character(chr)
  }
  
  #this tells rbgen where to look
  ranges = data.frame(
    chromosome = chr_str,
    start = bp,
    end = bp
  )

  data=bgen.load(bgen_file, ranges )
  
  if (nrow(data$variants)==0){
	return('SNP not found')
  }else{
  mat=data$data[1,,]
  genotypes=as.numeric(mat[,2]+2*mat[,3])
  
  out=list(snp_data=data.frame(eid,genotypes),variant_info=data$variants)
  return(out)
  }
}
