library(ogbox)
library(here)


setwd(here())

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoExpr.rda')
devtools::use_data(n_expressoExpr)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoSamples.rda')
devtools::use_data(n_expressoSamples)


loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseExp.rda')
devtools::use_data(TasicMouseExp)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseMeta.rda')
devtools::use_data(TasicMouseMeta)
