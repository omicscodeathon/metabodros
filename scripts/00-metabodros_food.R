#!/usr/bin/env R

library(tidyverse)
setwd("C:/Users/Olaitan/Desktop/ds4biomed")

data_path1 <- "data/mx1_755347_drosophila_larvae_cell_metabolism1.csv"
data_path2 <- "data/mx2_637006_peach_strawberry_cell_metabolism2.csv"

metabodata1 <- read_csv(data_path1)
metabodata2 <- read_csv(data_path2)

str(metabodata1)
metabodata1
metabodata2
str(metabodata2)

# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAT_748 )

# ------ PF, 440, 748, 907
# ------
# ------
# F_PF_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_PF_13_013  <- as.numeric(metabodata2$F_PF_13_013)
metabodata2$F_PF_14_014  <- as.numeric(metabodata2$F_PF_14_014)
metabodata2$F_PF_15_015  <- as.numeric(metabodata2$F_PF_15_015)
class(metabodata2$F_PF_13_013)
class(metabodata2$F_PF_14_014)
class(metabodata2$F_PF_15_015)

metabodata2 %>% select("BinBase name",F_PF_13_013,F_PF_14_014,F_PF_15_015)
metabodata2_F_PF_subset <- metabodata2 %>%
  select("BinBase name",F_PF_13_013,F_PF_14_014,F_PF_15_015)

str(metabodata2_F_PF_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_PF_13_013 <- sum(metabodata2_F_PF_subset[, 'F_PF_13_013'], na.rm = TRUE)
totalabun_F_PF_14_014 <- sum(metabodata2_F_PF_subset[, 'F_PF_14_014'], na.rm = TRUE)
totalabun_F_PF_15_015 <- sum(metabodata2_F_PF_subset[, 'F_PF_15_015'], na.rm = TRUE)
totalabun_F_PF_13_013
totalabun_F_PF_14_014
totalabun_F_PF_15_015

head(metabodata2_F_PF_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_PF_subset)

normsubset_F_PF <- metabodata2_F_PF_subset %>%
  mutate(normF_PF_13_013 = F_PF_13_013/totalabun_F_PF_13_013, normF_PF_14_014 = F_PF_14_014/totalabun_F_PF_14_014, normF_PF_15_015 = F_PF_15_015/totalabun_F_PF_15_015)

normsubset_F_PF
summary(normsubset_F_PF)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_PF, file ="data/metabodros/food/F_PF.csv")

str(normsubset_F_PF)

no_na_normsubset_F_PF <- normsubset_F_PF %>%
  select(F_PF_13_013, F_PF_14_014, F_PF_15_015)%>%
  na.omit()
no_na_normsubset_F_PF

no_na_normsubset_F_PF %>% summarize(mean_abun_F_PF = mean(F_PF_13_013),
                                        min_abun_F_PF = min(F_PF_13_013),
                                        max_abun_F_PF = max(F_PF_13_013),
                                        number_of_observations = n()
)

new1 <- read_csv("data/metabodros/food/F_PF.csv")
new1

# ------
# ------ PAC
# F_PAC
# The next line will convert F_PAC_16_016 from character to numeric data type
metabodata2$F_PAC_16_016 <- as.numeric(metabodata2$F_PAC_16_016)
metabodata2$F_PAC_17_017 <- as.numeric(metabodata2$F_PAC_17_017)
metabodata2$F_PAC_18_018 <- as.numeric(metabodata2$F_PAC_18_018)
class(metabodata2$F_PAC_16_016)
class(metabodata2$F_PAC_17_017)
class(metabodata2$F_PAC_18_018)

metabodata2 %>% select("BinBase name",F_PAC_16_016,F_PAC_17_017,F_PAC_18_018)
metabodata2_F_PAC_subset <- metabodata2 %>%
  select("BinBase name",F_PAC_16_016,F_PAC_17_017,F_PAC_18_018)

str(metabodata2_F_PAC_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_PAC_16_016 <- sum(metabodata2_F_PAC_subset[, 'F_PAC_16_016'], na.rm = TRUE)
totalabun_F_PAC_17_017 <- sum(metabodata2_F_PAC_subset[, 'F_PAC_17_017'], na.rm = TRUE)
totalabun_F_PAC_18_018 <- sum(metabodata2_F_PAC_subset[, 'F_PAC_18_018'], na.rm = TRUE)
totalabun_F_PAC_16_016
totalabun_F_PAC_17_017
totalabun_F_PAC_18_018

head(metabodata2_F_PAC_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_PAC_subset)

normsubset_F_PAC <- metabodata2_F_PAC_subset %>%
  mutate(normF_PAC_16_016 = F_PAC_16_016/totalabun_F_PAC_16_016, normF_PAC_17_017 = F_PAC_17_017/totalabun_F_PAC_17_017, normF_PAC_18_018 = F_PAC_18_018/totalabun_F_PAC_18_018)

normsubset_F_PAC
summary(normsubset_F_PAC)

# For Larvae, save this as L_SF_907.csv
# For Food, save this as F_PAC.csv
write_csv(normsubset_F_PAC, file ="data/metabodros/food/F_PAC.csv")

str(normsubset_F_PAC)

no_na_normsubset_F_PAC <- normsubset_F_PAC %>%
  select(F_PAC_16_016, F_PAC_17_017, F_PAC_18_018)%>%
  na.omit()
no_na_normsubset_F_PAC

no_na_normsubset_F_PAC %>% summarize(mean_abun_F_PAC = mean(F_PAC_16_016),
                                     min_abun_F_PAC = min(F_PAC_16_016),
                                     max_abun_F_PAC = max(F_PAC_16_016),
                                     number_of_observations = n()
)

new2 <- read_csv("data/metabodros/food/F_PAC.csv")
new2

# ------
# F_PAT_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_PAT_19_019  <- as.numeric(metabodata2$F_PAT_19_019)
metabodata2$F_PAT_20_020  <- as.numeric(metabodata2$F_PAT_20_020)
metabodata2$F_PAT_21_021  <- as.numeric(metabodata2$F_PAT_21_021)
class(metabodata2$F_PAT_19_019)
class(metabodata2$F_PAT_20_020)
class(metabodata2$F_PAT_21_021)

metabodata2 %>% select("BinBase name",F_PAT_19_019,F_PAT_20_020,F_PAT_21_021)
metabodata2_F_PAT_subset <- metabodata2 %>%
  select("BinBase name",F_PAT_19_019,F_PAT_20_020,F_PAT_21_021)

str(metabodata2_F_PAT_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_PAT_19_019 <- sum(metabodata2_F_PAT_subset[, 'F_PAT_19_019'], na.rm = TRUE)
totalabun_F_PAT_20_020 <- sum(metabodata2_F_PAT_subset[, 'F_PAT_20_020'], na.rm = TRUE)
totalabun_F_PAT_21_021 <- sum(metabodata2_F_PAT_subset[, 'F_PAT_21_021'], na.rm = TRUE)
totalabun_F_PAT_19_019
totalabun_F_PAT_20_020
totalabun_F_PAT_21_021

head(metabodata2_F_PAT_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_PAT_subset)

normsubset_F_PAT <- metabodata2_F_PAT_subset %>%
  mutate(normF_PAT_19_019 = F_PAT_19_019/totalabun_F_PAT_19_019, normF_PAT_20_020 = F_PAT_20_020/totalabun_F_PAT_20_020, normF_PAT_21_021 = F_PAT_21_021/totalabun_F_PAT_21_021)

normsubset_F_PAT
summary(normsubset_F_PAT)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_PAT, file ="data/metabodros/food/F_PAT.csv")

str(normsubset_F_PAT)

no_na_normsubset_F_PAT <- normsubset_F_PAT %>%
  select(F_PAT_19_019, F_PAT_20_020, F_PAT_21_021)%>%
  na.omit()
no_na_normsubset_F_PAT

no_na_normsubset_F_PAT %>% summarize(mean_abun_F_PAT = mean(F_PAT_19_019),
                                     min_abun_F_PAT = min(F_PAT_19_019),
                                     max_abun_F_PAT = max(F_PAT_19_019),
                                     number_of_observations = n()
)

new3 <- read_csv("data/metabodros/food/F_PAT.csv")
new3

# ------
# F_PACT_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_PACT_22_022  <- as.numeric(metabodata2$F_PACT_22_022)
metabodata2$F_PACT_23_023  <- as.numeric(metabodata2$F_PACT_23_023)
metabodata2$F_PACT_24_024  <- as.numeric(metabodata2$F_PACT_24_024)
class(metabodata2$F_PACT_22_022)
class(metabodata2$F_PACT_23_023)
class(metabodata2$F_PACT_24_024)

metabodata2 %>% select("BinBase name",F_PACT_22_022,F_PACT_23_023,F_PACT_24_024)
metabodata2_F_PACT_subset <- metabodata2 %>%
  select("BinBase name",F_PACT_22_022,F_PACT_23_023,F_PACT_24_024)

str(metabodata2_F_PACT_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_PACT_22_022 <- sum(metabodata2_F_PACT_subset[, 'F_PACT_22_022'], na.rm = TRUE)
totalabun_F_PACT_23_023 <- sum(metabodata2_F_PACT_subset[, 'F_PACT_23_023'], na.rm = TRUE)
totalabun_F_PACT_24_024 <- sum(metabodata2_F_PACT_subset[, 'F_PACT_24_024'], na.rm = TRUE)
totalabun_F_PACT_22_022
totalabun_F_PACT_23_023
totalabun_F_PACT_24_024

head(metabodata2_F_PACT_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_PACT_subset)

normsubset_F_PACT <- metabodata2_F_PACT_subset %>%
  mutate(normF_PACT_22_022 = F_PACT_22_022/totalabun_F_PACT_22_022, normF_PACT_23_023 = F_PACT_23_023/totalabun_F_PACT_23_023, normF_PACT_24_024 = F_PACT_24_024/totalabun_F_PACT_24_024)

normsubset_F_PACT
summary(normsubset_F_PACT)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_PACT, file ="data/metabodros/food/F_PACT.csv")

str(normsubset_F_PACT)

no_na_normsubset_F_PACT <- normsubset_F_PACT %>%
  select(F_PACT_22_022, F_PACT_23_023, F_PACT_24_024)%>%
  na.omit()
no_na_normsubset_F_PACT

no_na_normsubset_F_PACT %>% summarize(mean_abun_F_PACT = mean(F_PACT_22_022),
                                      min_abun_F_PACT = min(F_PACT_22_022),
                                      max_abun_F_PACT = max(F_PACT_22_022),
                                      number_of_observations = n()
)

new4 <- read_csv("data/metabodros/food/F_PACT.csv")
new4

# ------
# F_SACT_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_SACT_1_001  <- as.numeric(metabodata2$F_SACT_1_001)
metabodata2$F_SACT_2_002  <- as.numeric(metabodata2$F_SACT_2_002)
metabodata2$F_SACT_3_003  <- as.numeric(metabodata2$F_SACT_3_003)
class(metabodata2$F_SACT_1_001)
class(metabodata2$F_SACT_2_002)
class(metabodata2$F_SACT_3_003)

metabodata2 %>% select("BinBase name",F_SACT_1_001,F_SACT_2_002,F_SACT_3_003)
metabodata2_F_SACT_subset <- metabodata2 %>%
  select("BinBase name",F_SACT_1_001,F_SACT_2_002,F_SACT_3_003)

str(metabodata2_F_SACT_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_SACT_1_001 <- sum(metabodata2_F_SACT_subset[, 'F_SACT_1_001'], na.rm = TRUE)
totalabun_F_SACT_2_002 <- sum(metabodata2_F_SACT_subset[, 'F_SACT_2_002'], na.rm = TRUE)
totalabun_F_SACT_3_003 <- sum(metabodata2_F_SACT_subset[, 'F_SACT_3_003'], na.rm = TRUE)
totalabun_F_SACT_1_001
totalabun_F_SACT_2_002
totalabun_F_SACT_3_003

head(metabodata2_F_SACT_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_SACT_subset)

normsubset_F_SACT <- metabodata2_F_SACT_subset %>%
  mutate(normF_SACT_1_001 = F_SACT_1_001/totalabun_F_SACT_1_001, normF_SACT_2_002 = F_SACT_2_002/totalabun_F_SACT_2_002, normF_SACT_3_003 = F_SACT_3_003/totalabun_F_SACT_3_003)

normsubset_F_SACT
summary(normsubset_F_SACT)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_SACT, file ="data/metabodros/food/F_SACT.csv")

str(normsubset_F_SACT)

no_na_normsubset_F_SACT <- normsubset_F_SACT %>%
  select(F_SACT_1_001, F_SACT_2_002, F_SACT_3_003)%>%
  na.omit()
no_na_normsubset_F_SACT

no_na_normsubset_F_SACT %>% summarize(mean_abun_F_SACT = mean(F_SACT_1_001),
                                      min_abun_F_SACT = min(F_SACT_1_001),
                                      max_abun_F_SACT = max(F_SACT_1_001),
                                      number_of_observations = n()
)

new5 <- read_csv("data/metabodros/food/F_SACT.csv")
new5

# ------
# F_SF_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_SF_10_010  <- as.numeric(metabodata2$F_SF_10_010)
metabodata2$F_SF_11_011  <- as.numeric(metabodata2$F_SF_11_011)
metabodata2$F_SF_12_012  <- as.numeric(metabodata2$F_SF_12_012)
class(metabodata2$F_SF_10_010)
class(metabodata2$F_SF_11_011)
class(metabodata2$F_SF_12_012)

metabodata2 %>% select("BinBase name",F_SF_10_010,F_SF_11_011,F_SF_12_012)
metabodata2_F_SF_subset <- metabodata2 %>%
  select("BinBase name",F_SF_10_010,F_SF_11_011,F_SF_12_012)

str(metabodata2_F_SF_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_SF_10_010 <- sum(metabodata2_F_SF_subset[, 'F_SF_10_010'], na.rm = TRUE)
totalabun_F_SF_11_011 <- sum(metabodata2_F_SF_subset[, 'F_SF_11_011'], na.rm = TRUE)
totalabun_F_SF_12_012 <- sum(metabodata2_F_SF_subset[, 'F_SF_12_012'], na.rm = TRUE)
totalabun_F_SF_10_010
totalabun_F_SF_11_011
totalabun_F_SF_12_012

head(metabodata2_F_SF_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_SF_subset)

normsubset_F_SF <- metabodata2_F_SF_subset %>%
  mutate(normF_SF_10_010 = F_SF_10_010/totalabun_F_SF_10_010, normF_SF_11_011 = F_SF_11_011/totalabun_F_SF_11_011, normF_SF_12_012 = F_SF_12_012/totalabun_F_SF_12_012)

normsubset_F_SF
summary(normsubset_F_SF)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_SF, file ="data/metabodros/food/F_SF.csv")

str(normsubset_F_SF)

no_na_normsubset_F_SF <- normsubset_F_SF %>%
  select(F_SF_10_010, F_SF_11_011, F_SF_12_012)%>%
  na.omit()
no_na_normsubset_F_SF

no_na_normsubset_F_SF %>% summarize(mean_abun_F_SF = mean(F_SF_10_010),
                                    min_abun_F_SF = min(F_SF_10_010),
                                    max_abun_F_SF = max(F_SF_10_010),
                                    number_of_observations = n()
)

new6 <- read_csv("data/metabodros/food/F_SF.csv")
new6

# ------
# F_SAT_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_SAT_4_004  <- as.numeric(metabodata2$F_SAT_4_004)
metabodata2$F_SAT_5_005  <- as.numeric(metabodata2$F_SAT_5_005)
metabodata2$F_SAT_6_006  <- as.numeric(metabodata2$F_SAT_6_006)
class(metabodata2$F_SAT_4_004)
class(metabodata2$F_SAT_5_005)
class(metabodata2$F_SAT_6_006)

metabodata2 %>% select("BinBase name",F_SAT_4_004,F_SAT_5_005,F_SAT_6_006)
metabodata2_F_SAT_subset <- metabodata2 %>%
  select("BinBase name",F_SAT_4_004,F_SAT_5_005,F_SAT_6_006)

str(metabodata2_F_SAT_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_SAT_4_004 <- sum(metabodata2_F_SAT_subset[, 'F_SAT_4_004'], na.rm = TRUE)
totalabun_F_SAT_5_005 <- sum(metabodata2_F_SAT_subset[, 'F_SAT_5_005'], na.rm = TRUE)
totalabun_F_SAT_6_006 <- sum(metabodata2_F_SAT_subset[, 'F_SAT_6_006'], na.rm = TRUE)
totalabun_F_SAT_4_004
totalabun_F_SAT_5_005
totalabun_F_SAT_6_006

head(metabodata2_F_SAT_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_SAT_subset)

normsubset_F_SAT <- metabodata2_F_SAT_subset %>%
  mutate(normF_SAT_4_004 = F_SAT_4_004/totalabun_F_SAT_4_004, normF_SAT_5_005 = F_SAT_5_005/totalabun_F_SAT_5_005, normF_SAT_6_006 = F_SAT_6_006/totalabun_F_SAT_6_006)

normsubset_F_SAT
summary(normsubset_F_SAT)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_SAT, file ="data/metabodros/food/F_SAT.csv")

str(normsubset_F_SAT)

no_na_normsubset_F_SAT <- normsubset_F_SAT %>%
  select(F_SAT_4_004, F_SAT_5_005, F_SAT_6_006)%>%
  na.omit()
no_na_normsubset_F_SAT

no_na_normsubset_F_SAT %>% summarize(mean_abun_F_SAT = mean(F_SAT_4_004),
                                     min_abun_F_SAT = min(F_SAT_4_004),
                                     max_abun_F_SAT = max(F_SAT_4_004),
                                     number_of_observations = n()
)

new7 <- read_csv("data/metabodros/food/F_SAT.csv")
new7

# ------
# F_SAC_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata2$F_SAC_7_007  <- as.numeric(metabodata2$F_SAC_7_007)
metabodata2$F_SAC_8_008  <- as.numeric(metabodata2$F_SAC_8_008)
metabodata2$F_SAC_9_009  <- as.numeric(metabodata2$F_SAC_9_009)
class(metabodata2$F_SAC_7_007)
class(metabodata2$F_SAC_8_008)
class(metabodata2$F_SAC_9_009)

metabodata2 %>% select("BinBase name",F_SAC_7_007,F_SAC_8_008,F_SAC_9_009)
metabodata2_F_SAC_subset <- metabodata2 %>%
  select("BinBase name",F_SAC_7_007,F_SAC_8_008,F_SAC_9_009)

str(metabodata2_F_SAC_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_F_SAC_7_007 <- sum(metabodata2_F_SAC_subset[, 'F_SAC_7_007'], na.rm = TRUE)
totalabun_F_SAC_8_008 <- sum(metabodata2_F_SAC_subset[, 'F_SAC_8_008'], na.rm = TRUE)
totalabun_F_SAC_9_009 <- sum(metabodata2_F_SAC_subset[, 'F_SAC_9_009'], na.rm = TRUE)
totalabun_F_SAC_7_007
totalabun_F_SAC_8_008
totalabun_F_SAC_9_009

head(metabodata2_F_SAC_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata2_F_SAC_subset)

normsubset_F_SAC <- metabodata2_F_SAC_subset %>%
  mutate(normF_SAC_7_007 = F_SAC_7_007/totalabun_F_SAC_7_007, normF_SAC_8_008 = F_SAC_8_008/totalabun_F_SAC_8_008, normF_SAC_9_009 = F_SAC_9_009/totalabun_F_SAC_9_009)

normsubset_F_SAC
summary(normsubset_F_SAC)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_F_SAC, file ="data/metabodros/food/F_SAC.csv")

str(normsubset_F_SAC)

no_na_normsubset_F_SAC <- normsubset_F_SAC %>%
  select(F_SAC_7_007, F_SAC_8_008, F_SAC_9_009)%>%
  na.omit()
no_na_normsubset_F_SAC

no_na_normsubset_F_SAC %>% summarize(mean_abun_F_SAC = mean(F_SAC_7_007),
                                     min_abun_F_SAC = min(F_SAC_7_007),
                                     max_abun_F_SAC = max(F_SAC_7_007),
                                     number_of_observations = n()
)

new8 <- read_csv("data/metabodros/food/F_SAC.csv")
new8
