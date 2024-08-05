
library(dplyr)

#PF
data_PF <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_PF.csv", row.names=1) 
head(data_PF)

#SF
data_SF <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_SF.csv", row.names=1) 
head(data_SF)

#check sameness of rownames of PF and SF dataframes
all.equal(rownames(data_PF), rownames(data_SF))
all(rownames(data_PF) == rownames(data_SF))

#PF
colnames(data_PF) <- c('PFRep1','PFRep2','PFRep3', 'PFnorm_Rep1', 'PFnorm_Rep2', 'PFnorm_Rep3')
head(data_PF)

data_PF_raw <- data_PF %>% select(1,2,3)
head(data_PF_raw)

data_PF_norm <- data_PF %>% select(4,5,6)
head(data_PF_norm)

data_PF_raw <- data_PF_raw[-c(183:670),]
data_PF_norm <- data_PF_norm[-c(183:670),]


#SF
colnames(data_SF) <- c('SFRep1','SFRep2','SFRep3', 'SFnorm_Rep1', 'SFnorm_Rep2', 'SFnorm_Rep3')
head(data_SF)

data_SF_raw <- data_SF %>% select(1,2,3)
head(data_SF_raw)

data_SF_norm <- data_SF %>% select(4,5,6)
head(data_SF_norm)

data_SF_raw <- data_SF_raw[-c(183:670),]
data_SF_norm <- data_SF_norm[-c(183:670),]


#combine dataframes, PF and SF for raw and normalized data
PFvSF <- cbind(data_PF_raw, data_SF_raw)
head(PFvSF)

PFvSF_norm <- cbind(data_PF_norm, data_SF_norm)
head(PFvSF_norm)

#create label row
PFvSF <- rbind(data.frame(PFRep1="Untreated", PFRep2="Untreated", PFRep3="Untreated", SFRep1="Untreated", SFRep2="Untreated", SFRep3="Untreated"), PFvSF)
row.names(PFvSF)[1] <- "label"
head(PFvSF)

PFvSF_norm <- rbind(data.frame(PFnorm_Rep1="Untreated", PFnorm_Rep2="Untreated", PFnorm_Rep3="Untreated", SFnorm_Rep1="Untreated", SFnorm_Rep2="Untreated", SFnorm_Rep3="Untreated"), PFvSF_norm)
row.names(PFvSF_norm)[1] <- "label"
head(PFvSF_norm)

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


#combine dataframes, PF and SF for raw and normalized data
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

all.equal(rownames(PFvSF), rownames(PATvSAT))
PFSF_PATSAT <- cbind(PFvSF, PATvSAT)
head(PFSF_PATSAT)

all.equal(rownames(PFvSF_norm), rownames(PATvSAT_norm))
PFSF_PATSAT_norm <- cbind(PFvSF_norm, PATvSAT_norm)
head(PFSF_PATSAT_norm)

write.csv(PFSF_PATSAT, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PATSAT.csv", row.names = TRUE)
write.csv(PFSF_PATSAT_norm, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PATSAT_norm.csv", row.names = TRUE)


