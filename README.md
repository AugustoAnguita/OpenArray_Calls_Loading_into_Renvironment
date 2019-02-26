# R scripts for the manipulation, transformation and statistical analysis of Openarray genotype datasets.

This repository holds two short scripts:

A) The first one with name "script_from_long_to_wide.r" is a short script that allows loading a genetic dataset (genotype calls) derived from OpenArray technology and transforming it into a handly-format file, which can be further imported to PLINK software. Basically, this script carries out a dataset manipulation and transformation from long to wide format.

In order to run the script, you will need:

  1. An input file derived from OpenArray technology in the long format containing information for three columns (NCBI_SNP_Reference, Sample_ID and    Genotype_Call). There is an example file in the repository with the name "Example_input_file"
 
  2. Change the arguments "aa" and "cc" according to your experimental design and characteristics.


B) The second script is named "Clayton_analysis_code.r". It gathers all functions and commands required for the application of the statistical tests developed by Clayton and collaborators (references 1 and 2)  to X chromosome genotype data from humans.

References:

1. Clayton, D. Testing for association on the X chromosome. Biostatistics 9, 593–600, doi: 10.1093/biostatistics/kxn007 (2008).
2.Clayton, D. snpStats: SnpMatrix and XSnpMatrix classes and methods. R package version 1.30.0.
