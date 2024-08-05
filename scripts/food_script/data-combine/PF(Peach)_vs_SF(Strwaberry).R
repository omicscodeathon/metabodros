
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
PFvSF <- rbind(data.frame(PFRep1="PF", PFRep2="PF", PFRep3="PF", SFRep1="SF", SFRep2="SF", SFRep3="SF"), PFvSF)
row.names(PFvSF)[1] <- "label"
head(PFvSF)

PFvSF_norm <- rbind(data.frame(PFnorm_Rep1="PF", PFnorm_Rep2="PF", PFnorm_Rep3="PF", SFnorm_Rep1="SF", SFnorm_Rep2="SF", SFnorm_Rep3="SF"), PFvSF_norm)
row.names(PFvSF_norm)[1] <- "label"
head(PFvSF_norm)

#export to file
write.csv(PFvSF, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PF_v_SF.csv", row.names = TRUE)
write.csv(PFvSF_norm, "C://Users/HP/Documents/metabolomics/metabodros-main/output/food/dataframes/PF_v_SF_norm.csv", row.names = TRUE)
