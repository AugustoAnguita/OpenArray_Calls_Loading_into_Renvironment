
GENOTYPE_CALLS   <-read.table("...", header=T,stringsAsFactors=F, na.strings="NA") #load input data
aa <- 1057 #change this number by the number of samples in your dataset
cc <- 256  #change this number by the number of SNPs in your dataset
new_GENOTYPE_CALLS <- matrix(NA, aa, cc) #create empty matrix
a <- 1057  #change this number by the number of samples in your dataset
b <- 1 #initialization
for(j in 1:cc){
b <- b
a <- a  
print(b)
print(a)
new_GENOTYPE_CALLS[1:aa,j] <- GENOTYPE_CALLS[b:a,3]
b <- a+1
a <- a+aa
}
colnames(new_GENOTYPE_CALLS) <- unique(GENOTYPE_CALLS[,1]) #assing SNP ID
rownames(new_GENOTYPE_CALLS) <- GENOTYPE_CALLS[1:aa,2] #assing Samples ID
new_GENOTYPE_CALLS #output file
write.table(new_GENOTYPE_CALLS, file="...", append=FALSE, quote=TRUE) #write output to a table
