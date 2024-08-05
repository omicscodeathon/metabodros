
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

#####LOAD PACT and SACT and combine

#PACT
data_PACT <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_PACT.csv", row.names=1) 
head(data_PACT)

#SACT
data_SACT <- read.csv("C://Users/HP/Documents/metabolomics/metabodros-main/output/food/F_SACT.csv", row.names=1) 
head(data_SACT)

#check sameness of rownames of PACT and SACT dataframes
all.equal(rownames(data_PACT), rownames(data_SACT))
all(rownames(data_PACT) == rownames(data_SACT))

#PACT
colnames(data_PACT) <- c('PACTRep1','PACTRep2','PACTRep3', 'PACTnorm_Rep1', 'PACTnorm_Rep2', 'PACTnorm_Rep3')
head(data_PACT)

data_PACT_raw <- data_PACT %>% select(1,2,3)
head(data_PACT_raw)

data_PACT_norm <- data_PACT %>% select(4,5,6)
head(data_PACT_norm)

data_PACT_raw <- data_PACT_raw[-c(183:670),]
data_PACT_norm <- data_PACT_norm[-c(183:670),]

#SACT
colnames(data_SACT) <- c('SACTRep1','SACTRep2','SACTRep3', 'SACTnorm_Rep1', 'SACTnorm_Rep2', 'SACTnorm_Rep3')
head(data_SACT)

data_SACT_raw <- data_SACT %>% select(1,2,3)
head(data_SACT_raw)

data_SACT_norm <- data_SACT %>% select(4,5,6)
head(data_SACT_norm)

data_SACT_raw <- data_SACT_raw[-c(183:670),]
data_SACT_norm <- data_SACT_norm[-c(183:670),]


#combine dataframes, PF and SF for raw and normalized data
PACTvSACT <- cbind(data_PACT_raw, data_SACT_raw)
head(PACTvSACT)

PACTvSACT_norm <- cbind(data_PACT_norm, data_SACT_norm)
head(PACTvSACT_norm)

#create label row
PACTvSACT <- rbind(data.frame(PACTRep1="ACT", PACTRep2="ACT", PACTRep3="ACT", SACTRep1="ACT", SACTRep2="ACT", SACTRep3="ACT"), PACTvSACT)
row.names(PACTvSACT)[1] <- "label"
head(PACTvSACT)

PACTvSACT_norm <- rbind(data.frame(PACTnorm_Rep1="ACT", PACTnorm_Rep2="ACT", PACTnorm_Rep3="ACT", SACTnorm_Rep1="ACT", SACTnorm_Rep2="ACT", SACTnorm_Rep3="ACT"), PACTvSACT_norm)
row.names(PACTvSACT_norm)[1] <- "label"
head(PACTvSACT_norm)

all.equal(rownames(PFvSF), rownames(PACTvSACT))
PFSF_PACTSACT <- cbind(PFvSF, PACTvSACT)
head(PFSF_PACTSACT)

all.equal(rownames(PFvSF_norm), rownames(PACTvSACT_norm))
PFSF_PACTSACT_norm <- cbind(PFvSF_norm, PACTvSACT_norm)
head(PFSF_PACTSACT_norm)

write.csv(PFSF_PACTSACT, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PACTSACT.csv", row.names = TRUE)
write.csv(PFSF_PACTSACT_norm, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PACTSACT_norm.csv", row.names = TRUE)


