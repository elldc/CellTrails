test_findStates <- function(){
  data(exSCE)
  dat <- SingleCellExperiment(assay=list(logcounts=logcounts(exSCE)))
  se <- embedSamples(dat)
  d <- findSpectrum(se$eigenvalues, frac=30)
  latentSpace(dat) <- se$components[, d]

  #TEST
  RUnit::checkEquals(length(findStates(dat, min_size=-1)), ncol(dat)) #unusual min_size
  RUnit::checkEquals(length(findStates(dat, min_size=0)), ncol(dat))
  RUnit::checkException(findStates(dat, min_size=1000))
  cl <- findStates(dat,
                   min_size=0.01,
                   min_feat=-1, #negative feature number
                   max_pval=1e-4,
                   min_fc=2)
  RUnit::checkEquals(levels(cl), paste0("S", seq_len(20)))
  cl <- findStates(dat,
                   min_size=0.01,
                   min_feat=2,
                   max_pval=-1, #negative pvalue
                   min_fc=-1)
  RUnit::checkEquals(levels(cl), "S1")
  cl <- findStates(dat,
                   min_size=0.01,
                   min_feat=2,
                   max_pval=2, #pvalue > 1
                   min_fc=2)
  RUnit::checkEquals(levels(cl), paste0("S", seq_len(19)))
  cl <- findStates(dat,
                   min_size=0.01,
                   min_feat=2,
                   max_pval=1e-4,
                   min_fc=-1) #fold_change < 0
  RUnit::checkEquals(levels(cl), paste0("S", seq_len(5)))
  cl <- findStates(dat,
                   min_size=0.01,
                   min_feat=2,
                   max_pval=1e-4,
                   min_fc=2)
  RUnit::checkEquals(levels(cl), paste0("S", seq_len(5)))
  states(dat) <- cl
}
