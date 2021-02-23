#' @title Calculate the P-values of the Generalized Berk-Jones (GBJ) test, the generalized higher criticism (GHC) test, the the MinimumP second-level (MinP) test and the omnibus (OMNI) test.
#' @param Z_score Vector of test statistics for each factor in the set (i.e. marginal test statistic for each trait).
#' @param Sigma d*d matrix of the correlations between all the test statistics in the set, where d is the total number of test statistics in the set. You only need to specify EITHER cor_mat OR pairwise_cors.
#' @return The p-values of the GBJ, GHC, MinP and OMNI tests, given the size of the set
#' @import mvtnorm GBJ MASS Matrix compiler
#' @export
#'
#'
########


Multi_Analysis<-function(Z_score,Sigma){
  compiler::enableJIT(4)


  GHC_p<-GHC(Z_score,Sigma)$GHC_pvalue

  GBJ_p<-GBJ(Z_score, Sigma)$GBJ_pvalue

  minP_p<-minP(Z_score, Sigma)$minP_pvalue

  OMNI_p<-CCT(c(GHC_p,GBJ_p,minP_p))

  return(c(GHC_p,GBJ_p,minP_p,OMNI_p))
}
