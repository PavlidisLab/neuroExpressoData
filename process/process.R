library(ogbox)
library(here)
library(readr)
library(dplyr)

setwd(here())
dir.create('data-raw')

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoExpr.rda')
write_tsv(n_expressoExpr,'data-raw/n_expressoExpr')
usethis::use_data(n_expressoExpr,overwrite = TRUE)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoSamples.rda')
write_tsv(n_expressoSamples,'data-raw/n_expressoSamples.rda')
usethis::use_data(n_expressoSamples,overwrite = TRUE)


loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseExp.rda')
write_tsv(as.data.frame(TasicMouseExp),'data-raw/TasicMouseExp')
usethis::use_data(TasicMouseExp,overwrite = TRUE)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/TasicMouseMeta.rda')
getGithubFile('PavlidisLab/neuroExpressoAnalysis/data-raw/Mouse_Cell_Type_Data/singleCellMatchings.tsv',
              downloadPath = 'data-raw/singleCellMatchings.tsv')
singleCellMatchings = read_tsv('data-raw/singleCellMatchings.tsv')
seq_along(singleCellMatchings$Tasic) %>% lapply(function(i){
    data.frame(singleCellMatchings[i,,drop=FALSE],
               primary_type = singleCellMatchings$Tasic[i] %>% strsplit(', ') %>% {.[[1]]},
               stringsAsFactors = FALSE) ->out

    out = out[,!names(out) %in% 'Tasic']
}) %>% do.call(rbind,.) -> singleCellMatchings

TasicMouseMeta = left_join(TasicMouseMeta,singleCellMatchings)
write_tsv(TasicMouseMeta,'data-raw/TasicMouseMeta.tsv')

usethis::use_data(TasicMouseMeta,overwrite = TRUE)


loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoSamplesWithRNAseq.rda')
write_tsv(n_expressoSamplesWithRNAseq,'data-raw/n_expressoSamplesWithRNAseq.rda')
usethis::use_data(n_expressoSamplesWithRNAseq,overwrite = TRUE)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/n_expressoExprWithRNAseq.rda')
write_tsv(n_expressoExprWithRNAseq,'data-raw/n_expressoExprWithRNAseq.rda')
usethis::use_data(n_expressoExprWithRNAseq,overwrite = TRUE)

loadGithub('PavlidisLab/neuroExpressoAnalysis/data/regionHierarchy.rda')
usethis::use_data(regionHierarchy,overwrite = TRUE)
