library(ogbox)
library(here)


setwd(here())

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoExpr.rda')
usethis::use_data(n_expressoExpr)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoSamples.rda')
usethis::use_data(n_expressoSamples)


loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseExp.rda')
usethis::use_data(TasicMouseExp)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseMeta.rda')
usethis::use_data(TasicMouseMeta)


loadGithub('PavlidisLab/neuroExpressoAnalysis/data/regionHierarchy.rda')
usethis::use_data(regionHierarchy)
