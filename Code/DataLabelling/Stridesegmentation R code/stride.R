getwd() 
template <- list(stride_template$left_ankle[[1]][1, ],
                 stride_template$left_ankle[[2]][1, ],
                 stride_template$left_ankle[[2]][2, ],
                 stride_template$left_ankle[[3]][1, ],
                 stride_template$left_ankle[[3]][2, ],
                 stride_template$left_ankle[[3]][3, ],
                 stride_template$left_ankle[[4]][1, ],
                 stride_template$left_ankle[[4]][2, ],
                 stride_template$left_ankle[[4]][3, ],
                 stride_template$left_ankle[[4]][4, ],
                 stride_template$left_ankle[[5]][1, ],
                 stride_template$left_ankle[[5]][2, ],
                 stride_template$left_ankle[[5]][3, ],
                 stride_template$left_ankle[[5]][4, ], 
                 stride_template$left_ankle[[5]][5, ]                 
                 )
stride_template

par(mfrow = c(1,2), cex = 1) 
plot(template[[1]], type = "l", xlab = "", ylab = "", main = "Left ankle: template 1")
plot(template[[4]], type = "l", xlab = "", ylab = "", main = "Left ankle: template 2")

devtools::install_github("martakarass/adept")

library(adept)
library(adeptdata)
library(lubridate)
options(digits.secs = 2)
head(acc_walking_IU)
library(lubridate)
library(dplyr)
library(ggplot2)
library(reshape2)
library(gridExtra)
library(magrittr)

acc_walking_IU %<>% mutate(vm = sqrt(x^2 + y^2 + z^2))
acc_walking_IU$vm
x.la <- acc_walking_IU$vm[acc_walking_IU$loc_id == "left_ankle"]
out1.la <- segmentPattern(
  x = x.la,
  x.fs = 100,
  template = template,
  pattern.dur.seq = seq(0.5, 1.8, length.out = 50),
  similarity.measure = "cor",
  x.adept.ma.W = 0.15,
  finetune = "maxima",
  finetune.maxima.ma.W = 0.05,
  finetune.maxima.nbh.W = 0.2,
  compute.template.idx = TRUE,
  run.parallel = TRUE)

head(out1.la)

acc_walking_IU$vm

typeof(out1.la)
getOption("max.print")
write.csv(out1.la, file = 'LeftAnklestridesegments1.csv', row.names = FALSE)
write.csv(x.la, file = 'LeftAnkledataset.csv', row.names = FALSE)
write.csv(acc_walking_IU, file = 'Fulldatasetwalking.csv', row.names = FALSE)

typeof(acc_walking_IU)
acc_walking_IU

