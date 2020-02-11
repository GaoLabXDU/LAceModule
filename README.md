# LAceModule
## Introduction
Competing endogenous RNAs (ceRNAs) regulate each other by competitively binding microRNAs they share. This is a vital post-transcriptional regulation mechanism and plays critical roles in physiological and pathological processes. Current computational methods for the identification of ceRNA pairs are mainly based on the correlation of the expression of ceRNA candidates and the number of shared microRNAs, without considering the sensitivity of the correlation to the expression levels of the shared microRNAs. To overcome this limitation, we introduced liquid association (LA), a dynamic correlation measure, which can evaluate the sensitivity of the correlation of ceRNAs to microRNAs, as an additional factor for the detection of ceRNAs. Here we proposed an LA-based framework, termed LAceModule, to identify ceRNA modules by integrating the conventional Pearson correlation coefficient and dynamic correlation LA with multi-view non-negative matrix factorization. 
## Platform
LAceModule is developed with R language. But the multiview-NMF is a time-consuming progress, especially with large matrices. We use matlab code for rapid multiview-NMF, supplied by Liu et al. in their paper [1]. Therefore please install matlab (R2016 and advance version) before run the codes. You are also expected to install R.matlab package in R for transforming data and command from R to matlab. 

## Data Preparation
LAceModule needs users supply three datasets:
1. Candidate ceRNA expression profiles, rows for RNAs and columns for samples;
2. MicroRNA expression profiles, rows for RNAs and columns for samples;
3. MicroRNA——ceRNA interaction, rows for RNAs and columns for samples.

Here we use a subset of BRCA dataset from TCGA as test data. We select 100 candidate ceRNAs randaomly from all the RNAs as example to run the code.
## Source Structure

LAceModule
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;.gitattributes
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;LICENSE
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;README.md
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;├─data
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.RData
&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;└─src
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;function.R
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;Rscript.R
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─mulNMF

Files in the `data` dictionary contains the test data. Files in `src` dictionary contains the LAceModule codes. `funcion.R` and codes in `mulNMF` are essential functons for LAceModule. `Rscript.R` is the runable R script, which is used directly. The spectral clustering function is provided by Wang et al in their paper [2]
## Reference
> [1] Gao J, Han J, Liu J, et al. Multi-view clustering via joint nonnegative matrix factorization[C]. siam international conference on data mining, 2013: 252-260.
> [2] Wang, B., Mezlini, A., Demir, F. et al. Similarity network fusion for aggregating data types on a genomic scale. Nat Methods 11, 333–337 (2014). https://doi.org/10.1038/nmeth.2810
