# ----- TSMining is a R package for Time Series Feature Extraction

install.packages("TSMining")
library(ggplot2)
library(TSMining)

data(test)
#plot.ts(test)
#plot.ts(test$TS1)
#plot.ts(test$TS2)

res.1 <- Func.motif(ts = test$TS1, global.norm = TRUE, local.norm = FALSE,
                    window.size = 10, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)

res.2 <- Func.motif(ts = test$TS2, global.norm = TRUE, local.norm = FALSE,
                    window.size = 20, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
#Perform multivaraite motif discovery
res.multi <- Func.motif.multivariate(motif.list = list(res.1$Indices, res.2$Indices),
                                     window.sizes = c(10,20), alpha = .8)

data.multi <- Func.visual.MultiMotif(data = test, multi.motifs = res.multi, index = 1)

ggplot(data = data.multi) +
  geom_line(aes(x = T, y = X)) +
  geom_point(aes(x = T, y = X, col=Lab, shape=Lab)) + facet_grid(Facet~.)