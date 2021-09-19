# omniTest：An Omnibus Test for Detecting Multiple Phenotype Associations based on GWAS Summary Level Data 
omniTest includs three approches (GHC, GBJ and OMNI) for detecting the association between a single SNP and multiple traits based on GWAS summary statistics while accounting for the correlation structure among multiple traits.

## Setup

Please use the following command in R to install the package:
```
install.packages("devtools") 
library(devtools)
install_github("Vivian-Liu-Wei64/Omni_Multi")
```
## Usage

The omniTest performs the multiple traits association test based on GWAS summary statistics.

The Multi_Analysis function is used to calculate the P_values of GHC, GBJ, MinP and OMNI tests. 

```
Multi_Analysis(Z_score, Sigma)
```
Given Z_score and Sigma, the Multi_Analysis function provids the P-values of the GHC, GBJ and OMNI tests. 


## Example 
```
library(omniTest)  # load the omniTest package

# Z_score shold be a vector of test statistics for each factor in the set (i.e. marginal test statistic for each trait).

# Sigma shpuld be a matrix of the correlations between all the test statistics in the set.

#example 

Sigma<-matrix(rep(1,9),3,3)  
        
diag(Sigma)<-rep(1,3)

Z_score<- rmvnorm(1,mean=c(2,2,2),sigma=Sigma) 

Multi_Analysis(Z_score,Sigma) 


-----------The p_values of GHC, GBJ, MinP and OMNI tests-----------

      GHC_p      GBJ_p    MinP_p    OMNI_p
[1] 0.9103539 1.0000000 0.9971193 1.0000000

```

## Reference
Liu, W., Guo, Y. and Liu, Z.#,  2021. An Omnibus Test for Detecting Multiple Phenotype Associations based on GWAS Summary Level Data. (in press)

