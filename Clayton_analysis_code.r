
source("https://bioconductor.org/biocLite.R")
biocLite('snpStats') #Install the library

library(snpStats) #Call the library

fam  <-read.table("...fam", header=F,stringsAsFactors=F) #read fam file

sex <- fam[,5]
sex [ sex == 1] <- 0    
sex [ sex == 2] <- 1
sex [ sex == -9] <- NA

sex <- as.logical(sex)

SNP_MATRIX_DATA <- read.plink("....bed","....bim","....fam", na.strings = c("0", "-9"), sep = "." , select.subjects = NULL, select.snp = NULL ) #load binary files downloaded from the EGA archive (containing all subjects). It is important to mention that, since the binary files available online in the EGA repository are splitted by experimental condition (one dataset for normalweight and one dataset for overweight/obese), they should be combined into a single dataset containing three unique .bed .bim and .fam files before applying this function. So that, all subjects from the study will be arranged into a single dataset.

Genotypes_SNP_MATRIX_DATA <- SNP_MATRIX_DATA$genotypes


Genotypes_X_SNP_MATRIX_DATA <- new("XSnpMatrix", Genotypes_SNP_MATRIX_DATA, diploid=sex) #create object of class XSnpMatrix

row.summary(Genotypes_X_SNP_MATRIX_DATA)
col.summary(Genotypes_X_SNP_MATRIX_DATA)


PHEN_OBESITY <- fam[,6]
PHEN_OBESITY [ PHEN_OBESITY == 1] <- 0    #Set as NA if only females are intended to be considered
PHEN_OBESITY [ PHEN_OBESITY == 2] <- 1
PHEN_OBESITY [ PHEN_OBESITY == -9] <- NA

SINGLE_SNP_TEST <- single.snp.tests(PHEN_OBESITY, snp.data=Genotypes_X_SNP_MATRIX_DATA,
rules=NULL, uncertain = TRUE, score=TRUE)

 #The behaviour of this function for objects of class XSnpMatrix is as described by Clayton (2008).  Males are treated as homozygous females and corrected variance estimates are used.



# QQ plot for each test
qq.chisq(chi.squared(SINGLE_SNP_TEST, 1), 1)
qq.chisq(chi.squared(SINGLE_SNP_TEST, 2), 2)


SINGLE_SNP_TEST 


################# Test association with other phenotypes

PHENO_ZScore  <- read.table("....", header=TRUE,stringsAsFactors=F) #Load input file with phenotype data for BMI Zscore
PHENO_HOMA  <- read.table("....", header=TRUE,stringsAsFactors=F) #Load input file with phenotype data for HOMA

#Both files can be generated from the metadata table number 3 (available online). Each file should contain three columns; the first column referring the subject ID, the second column referring again the subject ID and the third column containing the values for the study phenotype.

#Of note is that each phenotype file should contain subject phenotype data in the same order than subject are displayed in .bed .bim and .fam files.

DBP  <- PHENO_DBP[,3] 
DBP [ DBP == -9 ] <- NA 
WHR  <- PHENO_WHR[,3] 
WHR [ WHR == -9 ] <- NA 
ZScore  <- PHENO_ZScore[,3] 
ZScore [ ZScore == -9 ] <- NA 
HOMA  <- PHENO_HOMA[,3] 
HOMA [ HOMA == -9 ] <- NA 



SINGLE_SNP_TEST_HOMA <- single.snp.tests(HOMA,snp.data=Genotypes_X_SNP_MATRIX_DATA,rules=NULL, uncertain =TRUE, score=TRUE)
#The behaviour of this function for objects of class XSnpMatrix is as described by Clayton (2008).  Males are treated as homozygous females and corrected variance estimates are used.
SINGLE_SNP_TEST_HOMA


SINGLE_SNP_TEST_ZScore <- single.snp.tests(ZScore,snp.data=Genotypes_X_SNP_MATRIX_DATA,rules=NULL, uncertain =TRUE, score=TRUE)
#The behaviour of this function for objects of class XSnpMatrix is as described by Clayton (2008).  Males are treated as homozygous females and corrected variance estimates are used.
SINGLE_SNP_TEST_ZScore



 



