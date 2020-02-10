# LAceModule
## Introduction
## Platform
LAceModule is developed with R language. But the multiview-NMF is a time-consuming progress, especially with large matrices. We use matlab code for rapid multiview-NMF, supplied by Liu et al. in their paper [1]. Therefore please install matlab (R2016 and advance version) before run the codes. You are also expected to install R.matlab package in R for transforming data and command from R to matlab.

## Data Preparation
LAceModule needs users supply three datasets:
1. Candidate ceRNA expression profiles, rows for RNAs and columns for samples;
2. MicroRNA expression profiles, rows for RNAs and columns for samples;
3. MicroRNA——ceRNA interaction, rows for RNAs and columns for samples.

Here we use a subset of BRCA dataset from TCGA as test data. We select 100 candidate ceRNAs from all the RNAs as example to run the code.

## Code Execution

## Result Output
## Reference
> Multi-view clustering via joint nonnegative matrix factorization