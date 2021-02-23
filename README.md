# onmiTest：An Omnibus Test for Detecting Multiple Phenotype Associations based on GWAS Summary Level Data 
omniTest includs three approches (GHC, GBJ and OMNI) for detecting the association between a single SNP and multiple traits based on GWAS summary statistics while accounting for the correlation structure among multiple traits.

## Setup

Please use the following command in R to install the package:
```
install.packages("devtools") 
library(devtools)
install_github("Vivian-Liu-Wei64/Onmi_Multi")
```
## Usage

The onmiTest performs the multiple traits association test based on GWAS summary statistics.

The Multi_Analysis function is used to calculate the P_values of GHC, GBJ, MinP and OMNI tests. 

```
Multi_Analysis(Z_score, Sigma)
```
Given Z_score and Sigma, the Multi_Analysis function provids the P-values of the GHC, GBJ and OMNI tests. 


## Example 
```
library(onmiTest)  # load the onmiTest package

# Z_score shold be a matrix of test statistics for each factor in the set (i.e. marginal test statistic for each trait).
# Sigma shpuld be a matrix of the correlations between all the test statistics in the set.

#example 

Sigma<-matrix(rep(1,9),3,3)  
        
diag(Sigma)<-rep(1,3)

Z_score<- rmvnorm(1,mean=c(2,2,2),sigma=Sigma) 


Multi_Analysis(Z_score,Sigma) 

out = MRCIP(data=example) # analyze the data with the MRCIP method. By default, MRCIP uses the suggested h value in the "plot_h" function.

-----------Estimation and inference for the causal effect-----------
out$beta 
     beta_hat    pval 95%CI (ll) 95%CI (ul)
[1,]  0.03491 0.35649   -0.03929     0.1091

# beta_hat: the estimated causal effect is 0.03491.
# pval: the corresponding p value (H0: the causal effect is zero) is 0.0.35649.
# 95%CI: the 95% confidence interval is (-0.03929,0.1091). The 95%CI (ll) and 95%CI (ul) represent the lower limit and upper limit, respectively.

-----------Estimation and inference for correlated pleiotropy index (CPI)-------
out$rho
      rho_hat    pval
[1,] -0.16256 0.05359

# rho_hat: the estimated correlated pleiotropy index (CPI) is -0.16256.
# pval: the corresponding p value (H0: the correlated pleiotropy index is zero) is 0.05359.

```
