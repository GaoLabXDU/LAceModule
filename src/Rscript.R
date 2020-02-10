setwd("D:/LAceModule")
# Loding Data and Codes
source('src/function.R')
load('data/data.RData')
# Set Prameters
core=5
Klist=seq(2,10)
geneset=rownames(rna.exp)
useGPU=T
resultpath=paste(getwd(),'/tempresult/',sep="")
# Transform the candidate ceRNA expression profiles
rna.exp=log(rna.exp+1)

# Calculation MS, PCC and LA
MS=gene_pair(geneset = geneset,mirwalk = mirwalk,core = core)
PCC=gene_correlation(geneset = geneset,rna.exp = rna.exp)
PCC=PCC$correlation
LA=liquid_association(geneset = geneset,rna.exp = rna.exp,miRNA.exp = micro.exp,mirwalk = mirwalk,core = core)

## Remove Invalid Paris
PCC[MS>=0.05]=0
LA[MS>=0.05]=0
diag(PCC)=0
diag(PCC)=0

PCC[PCC<0]=0
LA[LA<0]=0

PCC[PCC==0|LA==0]=0
LA[PCC==0|LA==0]=0

# writeMat(LA=LA,PCC=PCC,Klist=Klist,useGPU=useGPU,resultpath=resultpath,con = 'dataset.mat')
# 
# data=readMat('dataset.mat')
# PCC=data$PCC
# LA=data$LA
# Klist=data$Klist
# resultpath=data$resultpath
# useGPU=data$useGPU

## Multiview NMF
library(R.matlab)
Matlab$startServer()
matlab=Matlab()
#### Set parameter of matlab recall, these parameters may be modified according to the time-consuming of tasks
setOption(matlab, "readResult/interval", 10); # Default is 1 second
setOption(matlab, "readResult/maxTries", 30*(60/10)); # ~30 minutes
## Start Matlab Server and detect LAceModule
open(matlab)
#### Pass data to Matlab Server
setVariable(matlab,PCC=PCC)
setVariable(matlab,LA=LA)
setVariable(matlab,Klist=Klist)
setVariable(matlab,useGPU=useGPU)
setVariable(matlab,resultpath=resultpath)
#### Set matlab code path
evaluate(matlab,'addpath("src/mulNMF/");')
#### Detect LAceModule with candidate Klist for one time
evaluate(matlab,'runMultiNMF(PCC,LA,Klist,useGPU,resultpath);')
#### Find clusters and evaluation 
cluster=parseResult(VC.path = resultpath,Klist = Klist)
eva=doevaluation(cluster = cluster,simlist = list(PCC,LA),simlabel = c("PCC",'LA'),matlab = matlab)
#### Decide Final K
finalK=6
#### Detect LAceModule with finalK for 10 times and get the consensed module
setVariable(matlab,finalK=finalK)
evaluate(matlab,'finalC=repeatMultiNMF(PCC,LA,finalK,useGPU,resultpath);')
finalC=getVariable(matlab,'finalC')$finalC # Final module
close(matlab)
