
library(dplyr)

#PAC
data_PAC <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_PAC.csv", row.names=1) 
head(data_PAC)

#SAC
data_SAC <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_SAC.csv", row.names=1) 
head(data_SAC)

#check sameness of rownames of PAC and SAC dataframes
all.equal(rownames(data_PAC), rownames(data_SAC))
all(rownames(data_PAC) == rownames(data_SAC))

#PAC
colnames(data_PAC) <- c('PACRep1','PACRep2','PACRep3', 'PACnorm_Rep1', 'PACnorm_Rep2', 'PACnorm_Rep3')
head(data_PAC)

data_PAC_raw <- data_PAC %>% select(1,2,3)
head(data_PAC_raw)

data_PAC_norm <- data_PAC %>% select(4,5,6)
head(data_PAC_norm)

data_PAC_raw <- data_PAC_raw[-c(183:670),]
data_PAC_norm <- data_PAC_norm[-c(183:670),]

#SAC
colnames(data_SAC) <- c('SACRep1','SACRep2','SACRep3', 'SACnorm_Rep1', 'SACnorm_Rep2', 'SACnorm_Rep3')
head(data_SAC)

data_SAC_raw <- data_SAC %>% select(1,2,3)
head(data_SAC_raw)

data_SAC_norm <- data_SAC %>% select(4,5,6)
head(data_SAC_norm)

data_SAC_raw <- data_SAC_raw[-c(183:670),]
data_SAC_norm <- data_SAC_norm[-c(183:670),]

#combine dataframes, PAC and SAC for raw and normalized data
PACvSAC <- cbind(data_PAC_raw, data_SAC_raw)
head(PACvSAC)

PACvSAC_norm <- cbind(data_PAC_norm, data_SAC_norm)
head(PACvSAC_norm)

#create label row
PACvSAC <- rbind(data.frame(PACRep1="Autoclaved", PACRep2="Autoclaved", PACRep3="Autoclaved", SACRep1="Autoclaved", SACRep2="Autoclaved", SACRep3="Autoclaved"), PACvSAC)
row.names(PACvSAC)[1] <- "label"
head(PACvSAC)

PACvSAC_norm <- rbind(data.frame(PACnorm_Rep1="Autoclaved", PACnorm_Rep2="Autoclaved", PACnorm_Rep3="Autoclaved", SACnorm_Rep1="Autoclaved", SACnorm_Rep2="Autoclaved", SACnorm_Rep3="Autoclaved"), PACvSAC_norm)
row.names(PACvSAC_norm)[1] <- "label"
head(PACvSAC_norm)

#####LOAD PAT and SAT and combine

#PAT
data_PAT <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_PAT.csv", row.names=1) 
head(data_PAT)

#SAT
data_SAT <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_SAT.csv", row.names=1) 
head(data_SAT)

#check sameness of rownames of PACT and SACT dataframes
all.equal(rownames(data_PAT), rownames(data_SAT))
all(rownames(data_PAT) == rownames(data_SAT))

#PAT
colnames(data_PAT) <- c('PATRep1','PATRep2','PATRep3', 'PATnorm_Rep1', 'PATnorm_Rep2', 'PATnorm_Rep3')
head(data_PAT)

data_PAT_raw <- data_PAT %>% select(1,2,3)
head(data_PAT_raw)

data_PAT_norm <- data_PAT %>% select(4,5,6)
head(data_PAT_norm)

data_PAT_raw <- data_PAT_raw[-c(183:670),]
data_PAT_norm <- data_PAT_norm[-c(183:670),]

#SAT
colnames(data_SAT) <- c('SATRep1','SATRep2','SATRep3', 'SATnorm_Rep1', 'SATnorm_Rep2', 'SATnorm_Rep3')
head(data_SAT)

data_SAT_raw <- data_SAT %>% select(1,2,3)
head(data_SAT_raw)

data_SAT_norm <- data_SAT %>% select(4,5,6)
head(data_SAT_norm)

data_SAT_raw <- data_SAT_raw[-c(183:670),]
data_SAT_norm <- data_SAT_norm[-c(183:670),]


#combine dataframes, PAT and SAT for raw and normalized data
PATvSAT <- cbind(data_PAT_raw, data_SAT_raw)
head(PATvSAT)

PATvSAT_norm <- cbind(data_PAT_norm, data_SAT_norm)
head(PATvSAT_norm)

#create label row
PATvSAT <- rbind(data.frame(PATRep1="AntibioticsT", PATRep2="AntibioticsT", PATRep3="AntibioticsT", SATRep1="AntibioticsT", SATRep2="AntibioticsT", SATRep3="AntibioticsT"), PATvSAT)
row.names(PATvSAT)[1] <- "label"
head(PATvSAT)

PATvSAT_norm <- rbind(data.frame(PATnorm_Rep1="AntibioticsT", PATnorm_Rep2="AntibioticsT", PATnorm_Rep3="AntibioticsT", SATnorm_Rep1="AntibioticsT", SATnorm_Rep2="AntibioticsT", SATnorm_Rep3="AntibioticsT"), PATvSAT_norm)
row.names(PATvSAT_norm)[1] <- "label"
head(PATvSAT_norm)


all.equal(rownames(PACvSAC), rownames(PATvSAT))
PACSAC_PATSAT <- cbind(PACvSAC, PATvSAT)
head(PACSAC_PATSAT)

all.equal(rownames(PACvSAC_norm), rownames(PATvSAT_norm))
PACSAC_PATSAT_norm <- cbind(PACvSAC_norm, PATvSAT_norm)
head(PACSAC_PATSAT_norm)

write.csv(PACSAC_PATSAT, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PACSAC_PATSAT.csv", row.names = TRUE)
write.csv(PACSAC_PATSAT_norm, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PACSAC_PATSAT_norm.csv", row.names = TRUE)


