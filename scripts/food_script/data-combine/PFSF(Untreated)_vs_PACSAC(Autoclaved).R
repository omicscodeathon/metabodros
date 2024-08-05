
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
#PFvSF <- rbind(data.frame(PFRep1=0, PFRep2=0, PFRep3=0, SFRep1=1, SFRep2=1, SFRep3=1), PFvSF)
PFvSF <- rbind(data.frame(PFRep1="Untreated", PFRep2="Untreated", PFRep3="Untreated", SFRep1="Untreated", SFRep2="Untreated", SFRep3="Untreated"), PFvSF)
row.names(PFvSF)[1] <- "label"
head(PFvSF)

PFvSF_norm <- rbind(data.frame(PFnorm_Rep1="Untreated", PFnorm_Rep2="Untreated", PFnorm_Rep3="Untreated", SFnorm_Rep1="Untreated", SFnorm_Rep2="Untreated", SFnorm_Rep3="Untreated"), PFvSF_norm)
#PFvSF_norm <- rbind(data.frame(PFRep1=0, PFRep2=0, PFRep3=0, SFRep1=1, SFRep2=1, SFRep3=1), PFvSF_norm)
row.names(PFvSF_norm)[1] <- "label"
head(PFvSF_norm)

#####LOAD PAC and SAC and combine

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


#combine dataframes, PF and SF for raw and normalized data
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

all.equal(rownames(PFvSF), rownames(PACvSAC))
PFSF_PACSAC <- cbind(PFvSF, PACvSAC)
head(PFSF_PACSAC)

all.equal(rownames(PFvSF_norm), rownames(PACvSAC_norm))
PFSF_PACSAC_norm <- cbind(PFvSF_norm, PACvSAC_norm)
head(PFSF_PACSAC_norm)

write.csv(PFSF_PACSAC, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PACSAC.csv", row.names = TRUE)
write.csv(PFSF_PACSAC_norm, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PFSF_PACSAC_norm.csv", row.names = TRUE)


