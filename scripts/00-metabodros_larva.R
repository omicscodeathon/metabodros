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

# ------ PAT, 440, 748, 907
# ------
# L_PAT_440
# The next line will convert L1_PAT_440 from character to numeric data type
metabodata1$L1_PAT_440  <- as.numeric(metabodata1$L1_PAT_440)
class(metabodata1$L1_PAT_440)

metabodata1 %>% select("BinBase name",L1_PAT_440,L2_PAT_440,L3_PAT_440)
metabodata1_L_PAT_440_subset <- metabodata1 %>%
  select("BinBase name",L1_PAT_440,L2_PAT_440,L3_PAT_440)

str(metabodata1_L_PAT_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAT_440 )
totalabun_L1_PAT_440 <- sum(metabodata1_L_PAT_440_subset[, 'L1_PAT_440'], na.rm = TRUE)
totalabun_L2_PAT_440 <- sum(metabodata1_L_PAT_440_subset[, 'L2_PAT_440'], na.rm = TRUE)
totalabun_L3_PAT_440 <- sum(metabodata1_L_PAT_440_subset[, 'L3_PAT_440'], na.rm = TRUE)
totalabun_L1_PAT_440
totalabun_L2_PAT_440
totalabun_L3_PAT_440

head(metabodata1_L_PAT_440_subset)
# The next line will convert L1_PAT_440 from character to numeric data type

str(metabodata1_L_PAT_440_subset)

normsubset_L_PAT_440 <- metabodata1_L_PAT_440_subset %>%
  mutate(normL1_PAT_440 = L1_PAT_440/totalabun_L1_PAT_440, normL2_PAT_440 = L2_PAT_440/totalabun_L2_PAT_440, normL3_PAT_440 = L3_PAT_440/totalabun_L3_PAT_440)

normsubset_L_PAT_440
summary(normsubset_L_PAT_440)

# For Larvae, save this as L_PAT_440.csv
write_csv(normsubset_L_PAT_440, file ="data/metabodros/L_PAT_440.csv")

str(normsubset_L_PAT_440)

no_na_normsubset_L_PAT_440 <- normsubset_L_PAT_440 %>%
  select(L1_PAT_440, L2_PAT_440, L3_PAT_440)%>%
  na.omit()
no_na_normsubset_L_PAT_440

no_na_normsubset_L_PAT_440 %>% summarize(mean_abun_L1_PAT_440 = mean(L1_PAT_440),
                                         min_abun_L1_PAT_440 = min(L1_PAT_440),
                                         max_abun_L1_PAT_440 = max(L1_PAT_440),
                                         number_of_observations = n()
)

new1 <- read_csv("data/metabodros/L_PAT_440.csv")
new1

# ------
# The next line will convert L1_PAT_748 from character to numeric data type
metabodata1$L1_PAT_748  <- as.numeric(metabodata1$L1_PAT_748)
class(metabodata1$L1_PAT_748)

metabodata1 %>% select("BinBase name",L1_PAT_748,L2_PAT_748,L3_PAT_748)
metabodata1_L_PAT_748_subset <- metabodata1 %>%
  select("BinBase name",L1_PAT_748,L2_PAT_748,L3_PAT_748)

str(metabodata1_L_PAT_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAT_748 )
totalabun_L1_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L1_PAT_748'], na.rm = TRUE)
totalabun_L2_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L2_PAT_748'], na.rm = TRUE)
totalabun_L3_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L3_PAT_748'], na.rm = TRUE)
totalabun_L1_PAT_748
totalabun_L2_PAT_748
totalabun_L3_PAT_748

head(metabodata1_L_PAT_748_subset)
# The next line will convert L1_PAT_748 from character to numeric data type

str(metabodata1_L_PAT_748_subset)

normsubset_L_PAT_748 <- metabodata1_L_PAT_748_subset %>%
  mutate(normL1_PAT_748 = L1_PAT_748/totalabun_L1_PAT_748, normL2_PAT_748 = L2_PAT_748/totalabun_L2_PAT_748, normL3_PAT_748 = L3_PAT_748/totalabun_L3_PAT_748)

normsubset_L_PAT_748
summary(normsubset_L_PAT_748)

# For Larvae, save this as L_PAT_748.csv
write_csv(normsubset_L_PAT_748, file ="data/metabodros/L_PAT_748.csv")

str(normsubset_L_PAT_748)

no_na_normsubset_L_PAT_748 <- normsubset_L_PAT_748 %>%
  select(L1_PAT_748, L2_PAT_748, L3_PAT_748)%>%
  na.omit()
no_na_normsubset_L_PAT_748

no_na_normsubset_L_PAT_748 %>% summarize(mean_abun_L1_PAT_748 = mean(L1_PAT_748),
                                         min_abun_L1_PAT_748 = min(L1_PAT_748),
                                         max_abun_L1_PAT_748 = max(L1_PAT_748),
                                         number_of_observations = n()
)

new2 <- read_csv("data/metabodros/L_PAT_748.csv")
new2

# ------
# L_PAT_907
# The next line will convert L1_PAT_907 from character to numeric data type
metabodata1$L1_PAT_907  <- as.numeric(metabodata1$L1_PAT_907)
class(metabodata1$L1_PAT_907)

metabodata1 %>% select("BinBase name",L1_PAT_907,L2_PAT_907,L3_PAT_907)
metabodata1_L_PAT_907_subset <- metabodata1 %>%
  select("BinBase name",L1_PAT_907,L2_PAT_907,L3_PAT_907)

str(metabodata1_L_PAT_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAT_907 )
totalabun_L1_PAT_907 <- sum(metabodata1_L_PAT_907_subset[, 'L1_PAT_907'], na.rm = TRUE)
totalabun_L2_PAT_907 <- sum(metabodata1_L_PAT_907_subset[, 'L2_PAT_907'], na.rm = TRUE)
totalabun_L3_PAT_907 <- sum(metabodata1_L_PAT_907_subset[, 'L3_PAT_907'], na.rm = TRUE)
totalabun_L1_PAT_907
totalabun_L2_PAT_907
totalabun_L3_PAT_907

head(metabodata1_L_PAT_907_subset)
# The next line will convert L1_PAT_907 from character to numeric data type

str(metabodata1_L_PAT_907_subset)

normsubset_L_PAT_907 <- metabodata1_L_PAT_907_subset %>%
  mutate(normL1_PAT_907 = L1_PAT_907/totalabun_L1_PAT_907, normL2_PAT_907 = L2_PAT_907/totalabun_L2_PAT_907, normL3_PAT_907 = L3_PAT_907/totalabun_L3_PAT_907)

normsubset_L_PAT_907
summary(normsubset_L_PAT_907)

# For Larvae, save this as L_PAT_907.csv
write_csv(normsubset_L_PAT_907, file ="data/metabodros/L_PAT_907.csv")

str(normsubset_L_PAT_907)


no_na_normsubset_L_PAT_907 <- normsubset_L_PAT_907 %>%
  select(L1_PAT_907, L2_PAT_907, L3_PAT_907)%>%
  na.omit()
no_na_normsubset_L_PAT_907

no_na_normsubset_L_PAT_907 %>% summarize(mean_abun_L1_PAT_907 = mean(L1_PAT_907),
                                         min_abun_L1_PAT_907 = min(L1_PAT_907),
                                         max_abun_L1_PAT_907 = max(L1_PAT_907),
                                         number_of_observations = n()
)

new3 <- read_csv("data/metabodros/L_PAT_907.csv")
new3
# ------ SAT, 440, 748, 907
# ------
# L_SAT_440
# The next line will convert L1_SAT_440 from character to numeric data type
metabodata1$L1_SAT_440  <- as.numeric(metabodata1$L1_SAT_440)
class(metabodata1$L1_SAT_440)

metabodata1 %>% select("BinBase name",L1_SAT_440,L2_SAT_440,L3_SAT_440)
metabodata1_L_SAT_440_subset <- metabodata1 %>%
  select("BinBase name",L1_SAT_440,L2_SAT_440,L3_SAT_440)

str(metabodata1_L_SAT_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAT_440 )
totalabun_L1_SAT_440 <- sum(metabodata1_L_SAT_440_subset[, 'L1_SAT_440'], na.rm = TRUE)
totalabun_L2_SAT_440 <- sum(metabodata1_L_SAT_440_subset[, 'L2_SAT_440'], na.rm = TRUE)
totalabun_L3_SAT_440 <- sum(metabodata1_L_SAT_440_subset[, 'L3_SAT_440'], na.rm = TRUE)
totalabun_L1_SAT_440
totalabun_L2_SAT_440
totalabun_L3_SAT_440

head(metabodata1_L_SAT_440_subset)
# The next line will convert L1_SAT_440 from character to numeric data type

str(metabodata1_L_SAT_440_subset)

normsubset_L_SAT_440 <- metabodata1_L_SAT_440_subset %>%
  mutate(normL1_SAT_440 = L1_SAT_440/totalabun_L1_SAT_440, normL2_SAT_440 = L2_SAT_440/totalabun_L2_SAT_440, normL3_SAT_440 = L3_SAT_440/totalabun_L3_SAT_440)

normsubset_L_SAT_440
summary(normsubset_L_SAT_440)

# For Larvae, save this as L_SAT_440.csv
write_csv(normsubset_L_SAT_440, file ="data/metabodros/L_SAT_440.csv")

str(normsubset_L_SAT_440)

no_na_normsubset_L_SAT_440 <- normsubset_L_SAT_440 %>%
  select(L1_SAT_440, L2_SAT_440, L3_SAT_440)%>%
  na.omit()
no_na_normsubset_L_SAT_440

no_na_normsubset_L_SAT_440 %>% summarize(mean_abun_L1_SAT_440 = mean(L1_SAT_440),
                                         min_abun_L1_SAT_440 = min(L1_SAT_440),
                                         max_abun_L1_SAT_440 = max(L1_SAT_440),
                                         number_of_observations = n()
)

new4 <- read_csv("data/metabodros/L_SAT_440.csv")
new4

# ------
# L_SAT_748
# The next line will convert L1_SAT_748 from character to numeric data type
metabodata1$L1_SAT_748  <- as.numeric(metabodata1$L1_SAT_748)
class(metabodata1$L1_SAT_748)

metabodata1 %>% select("BinBase name",L1_SAT_748,L2_SAT_748,L3_SAT_748)
metabodata1_L_SAT_748_subset <- metabodata1 %>%
  select("BinBase name",L1_SAT_748,L2_SAT_748,L3_SAT_748)

str(metabodata1_L_SAT_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAT_748 )
totalabun_L1_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L1_SAT_748'], na.rm = TRUE)
totalabun_L2_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L2_SAT_748'], na.rm = TRUE)
totalabun_L3_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L3_SAT_748'], na.rm = TRUE)
totalabun_L1_SAT_748
totalabun_L2_SAT_748
totalabun_L3_SAT_748

head(metabodata1_L_SAT_748_subset)
# The next line will convert L1_SAT_748 from character to numeric data type

str(metabodata1_L_SAT_748_subset)

normsubset_L_SAT_748 <- metabodata1_L_SAT_748_subset %>%
  mutate(normL1_SAT_748 = L1_SAT_748/totalabun_L1_SAT_748, normL2_SAT_748 = L2_SAT_748/totalabun_L2_SAT_748, normL3_SAT_748 = L3_SAT_748/totalabun_L3_SAT_748)

normsubset_L_SAT_748
summary(normsubset_L_SAT_748)

# For Larvae, save this as L_SAT_748.csv
write_csv(normsubset_L_SAT_748, file ="data/metabodros/L_SAT_748.csv")

str(normsubset_L_SAT_748)

no_na_normsubset_L_SAT_748 <- normsubset_L_SAT_748 %>%
  select(L1_SAT_748, L2_SAT_748, L3_SAT_748)%>%
  na.omit()
no_na_normsubset_L_SAT_748

no_na_normsubset_L_SAT_748 %>% summarize(mean_abun_L1_SAT_748 = mean(L1_SAT_748),
                                         min_abun_L1_SAT_748 = min(L1_SAT_748),
                                         max_abun_L1_SAT_748 = max(L1_SAT_748),
                                         number_of_observations = n()
)

new5 <- read_csv("data/metabodros/L_SAT_748.csv")
new5

# ------
# L_SAT_907
# The next line will convert L1_SAT_907 from character to numeric data type
metabodata1$L1_SAT_907  <- as.numeric(metabodata1$L1_SAT_907)
class(metabodata1$L1_SAT_907)

metabodata1 %>% select("BinBase name",L1_SAT_907,L2_SAT_907,L3_SAT_907)
metabodata1_L_SAT_907_subset <- metabodata1 %>%
  select("BinBase name",L1_SAT_907,L2_SAT_907,L3_SAT_907)

str(metabodata1_L_SAT_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAT_907 )
totalabun_L1_SAT_907 <- sum(metabodata1_L_SAT_907_subset[, 'L1_SAT_907'], na.rm = TRUE)
totalabun_L2_SAT_907 <- sum(metabodata1_L_SAT_907_subset[, 'L2_SAT_907'], na.rm = TRUE)
totalabun_L3_SAT_907 <- sum(metabodata1_L_SAT_907_subset[, 'L3_SAT_907'], na.rm = TRUE)
totalabun_L1_SAT_907
totalabun_L2_SAT_907
totalabun_L3_SAT_907

head(metabodata1_L_SAT_907_subset)
# The next line will convert L1_SAT_907 from character to numeric data type

str(metabodata1_L_SAT_907_subset)

normsubset_L_SAT_907 <- metabodata1_L_SAT_907_subset %>%
  mutate(normL1_SAT_907 = L1_SAT_907/totalabun_L1_SAT_907, normL2_SAT_907 = L2_SAT_907/totalabun_L2_SAT_907, normL3_SAT_907 = L3_SAT_907/totalabun_L3_SAT_907)

normsubset_L_SAT_907
summary(normsubset_L_SAT_907)

# For Larvae, save this as L_SAT_907.csv
write_csv(normsubset_L_SAT_907, file ="data/metabodros/L_SAT_907.csv")

str(normsubset_L_SAT_907)

no_na_normsubset_L_SAT_907 <- normsubset_L_SAT_907 %>%
  select(L1_SAT_907, L2_SAT_907, L3_SAT_907)%>%
  na.omit()
no_na_normsubset_L_SAT_907

no_na_normsubset_L_SAT_907 %>% summarize(mean_abun_L1_SAT_907 = mean(L1_SAT_907),
                                         min_abun_L1_SAT_907 = min(L1_SAT_907),
                                         max_abun_L1_SAT_907 = max(L1_SAT_907),
                                         number_of_observations = n()
)

new6 <- read_csv("data/metabodros/L_SAT_907.csv")
new6

# ------
# L_PAC_440
# The next line will convert L1_PAC_440 from character to numeric data type
metabodata1$L1_PAC_440  <- as.numeric(metabodata1$L1_PAC_440)
metabodata1$L2_PAC_440  <- as.numeric(metabodata1$L2_PAC_440)
metabodata1$L3_PAC_440  <- as.numeric(metabodata1$L3_PAC_440)
class(metabodata1$L1_PAC_440)
class(metabodata1$L2_PAC_440)
class(metabodata1$L3_PAC_440)

metabodata1 %>% select("BinBase name",L1_PAC_440,L2_PAC_440,L3_PAC_440)
metabodata1_L_PAC_440_subset <- metabodata1 %>%
  select("BinBase name",L1_PAC_440,L2_PAC_440,L3_PAC_440)

str(metabodata1_L_PAC_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAC_440 )
totalabun_L1_PAC_440 <- sum(metabodata1_L_PAC_440_subset[, 'L1_PAC_440'], na.rm = TRUE)
totalabun_L2_PAC_440 <- sum(metabodata1_L_PAC_440_subset[, 'L2_PAC_440'], na.rm = TRUE)
totalabun_L3_PAC_440 <- sum(metabodata1_L_PAC_440_subset[, 'L3_PAC_440'], na.rm = TRUE)
totalabun_L1_PAC_440
totalabun_L2_PAC_440
totalabun_L3_PAC_440

head(metabodata1_L_PAC_440_subset)
# The next line will convert L1_PAC_440 from character to numeric data type

str(metabodata1_L_PAC_440_subset)

normsubset_L_PAC_440 <- metabodata1_L_PAC_440_subset %>%
  mutate(normL1_PAC_440 = L1_PAC_440/totalabun_L1_PAC_440, normL2_PAC_440 = L2_PAC_440/totalabun_L2_PAC_440, normL3_PAC_440 = L3_PAC_440/totalabun_L3_PAC_440)

normsubset_L_PAC_440
summary(normsubset_L_PAC_440)

# For Larvae, save this as L_PAC_440.csv
write_csv(normsubset_L_PAC_440, file ="data/metabodros/L_PAC_440.csv")

str(normsubset_L_PAC_440)

no_na_normsubset_L_PAC_440 <- normsubset_L_PAC_440 %>%
  select(L1_PAC_440, L2_PAC_440, L3_PAC_440)%>%
  na.omit()
no_na_normsubset_L_PAC_440

no_na_normsubset_L_PAC_440 %>% summarize(mean_abun_L1_PAC_440 = mean(L1_PAC_440),
                                         min_abun_L1_PAC_440 = min(L1_PAC_440),
                                         max_abun_L1_PAC_440 = max(L1_PAC_440),
                                         number_of_observations = n()
)

new7 <- read_csv("data/metabodros/L_PAC_440.csv")
new7

# ------
# L_PAC_748
# The next line will convert L1_PAC_748 from character to numeric data type
metabodata1$L1_PAC_748  <- as.numeric(metabodata1$L1_PAC_748)
class(metabodata1$L1_PAC_748)

metabodata1 %>% select("BinBase name",L1_PAC_748,L2_PAC_748,L3_PAC_748)
metabodata1_L_PAC_748_subset <- metabodata1 %>%
  select("BinBase name",L1_PAC_748,L2_PAC_748,L3_PAC_748)

str(metabodata1_L_PAC_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAC_748 )
totalabun_L1_PAC_748 <- sum(metabodata1_L_PAC_748_subset[, 'L1_PAC_748'], na.rm = TRUE)
totalabun_L2_PAC_748 <- sum(metabodata1_L_PAC_748_subset[, 'L2_PAC_748'], na.rm = TRUE)
totalabun_L3_PAC_748 <- sum(metabodata1_L_PAC_748_subset[, 'L3_PAC_748'], na.rm = TRUE)
totalabun_L1_PAC_748
totalabun_L2_PAC_748
totalabun_L3_PAC_748

head(metabodata1_L_PAC_748_subset)
# The next line will convert L1_PAC_748 from character to numeric data type

str(metabodata1_L_PAC_748_subset)

normsubset_L_PAC_748 <- metabodata1_L_PAC_748_subset %>%
  mutate(normL1_PAC_748 = L1_PAC_748/totalabun_L1_PAC_748, normL2_PAC_748 = L2_PAC_748/totalabun_L2_PAC_748, normL3_PAC_748 = L3_PAC_748/totalabun_L3_PAC_748)

normsubset_L_PAC_748
summary(normsubset_L_PAC_748)

# For Larvae, save this as L_PAC_748.csv
write_csv(normsubset_L_PAC_748, file ="data/metabodros/L_PAC_748.csv")

str(normsubset_L_PAC_748)

no_na_normsubset_L_PAC_748 <- normsubset_L_PAC_748 %>%
  select(L1_PAC_748, L2_PAC_748, L3_PAC_748)%>%
  na.omit()
no_na_normsubset_L_PAC_748

no_na_normsubset_L_PAC_748 %>% summarize(mean_abun_L1_PAC_748 = mean(L1_PAC_748),
                                         min_abun_L1_PAC_748 = min(L1_PAC_748),
                                         max_abun_L1_PAC_748 = max(L1_PAC_748),
                                         number_of_observations = n()
)

new8 <- read_csv("data/metabodros/L_PAC_748.csv")
new8

# ------
# L_PAC_907
# The next line will convert L1_PAC_907 from character to numeric data type
metabodata1$L1_PAC_907  <- as.numeric(metabodata1$L1_PAC_907)
class(metabodata1$L1_PAC_907)

metabodata1 %>% select("BinBase name",L1_PAC_907,L2_PAC_907,L3_PAC_907)
metabodata1_L_PAC_907_subset <- metabodata1 %>%
  select("BinBase name",L1_PAC_907,L2_PAC_907,L3_PAC_907)

str(metabodata1_L_PAC_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAC_907 )
totalabun_L1_PAC_907 <- sum(metabodata1_L_PAC_907_subset[, 'L1_PAC_907'], na.rm = TRUE)
totalabun_L2_PAC_907 <- sum(metabodata1_L_PAC_907_subset[, 'L2_PAC_907'], na.rm = TRUE)
totalabun_L3_PAC_907 <- sum(metabodata1_L_PAC_907_subset[, 'L3_PAC_907'], na.rm = TRUE)
totalabun_L1_PAC_907
totalabun_L2_PAC_907
totalabun_L3_PAC_907

head(metabodata1_L_PAC_907_subset)
# The next line will convert L1_PAC_907 from character to numeric data type

str(metabodata1_L_PAC_907_subset)

normsubset_L_PAC_907 <- metabodata1_L_PAC_907_subset %>%
  mutate(normL1_PAC_907 = L1_PAC_907/totalabun_L1_PAC_907, normL2_PAC_907 = L2_PAC_907/totalabun_L2_PAC_907, normL3_PAC_907 = L3_PAC_907/totalabun_L3_PAC_907)

normsubset_L_PAC_907
summary(normsubset_L_PAC_907)

# For Larvae, save this as L_PAC_907.csv
write_csv(normsubset_L_PAC_907, file ="data/metabodros/L_PAC_907.csv")

str(normsubset_L_PAC_907)

no_na_normsubset_L_PAC_907 <- normsubset_L_PAC_907 %>%
  select(L1_PAC_907, L2_PAC_907, L3_PAC_907)%>%
  na.omit()
no_na_normsubset_L_PAC_907

no_na_normsubset_L_PAC_907 %>% summarize(mean_abun_L1_PAC_907 = mean(L1_PAC_907),
                                         min_abun_L1_PAC_907 = min(L1_PAC_907),
                                         max_abun_L1_PAC_907 = max(L1_PAC_907),
                                         number_of_observations = n()
)

new9 <- read_csv("data/metabodros/L_PAC_907.csv")
new9

# ------
# L_SAC_440
# The next line will convert L1_SAC_440 from character to numeric data type
metabodata1$L1_SAC_440  <- as.numeric(metabodata1$L1_SAC_440)
metabodata1$L2_SAC_440  <- as.numeric(metabodata1$L2_SAC_440)
metabodata1$L3_SAC_440  <- as.numeric(metabodata1$L3_SAC_440)
class(metabodata1$L1_SAC_440)
class(metabodata1$L2_SAC_440)
class(metabodata1$L3_SAC_440)

metabodata1 %>% select("BinBase name",L1_SAC_440,L2_SAC_440,L3_SAC_440)
metabodata1_L_SAC_440_subset <- metabodata1 %>%
  select("BinBase name",L1_SAC_440,L2_SAC_440,L3_SAC_440)

str(metabodata1_L_SAC_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAC_440 )
totalabun_L1_SAC_440 <- sum(metabodata1_L_SAC_440_subset[, 'L1_SAC_440'], na.rm = TRUE)
totalabun_L2_SAC_440 <- sum(metabodata1_L_SAC_440_subset[, 'L2_SAC_440'], na.rm = TRUE)
totalabun_L3_SAC_440 <- sum(metabodata1_L_SAC_440_subset[, 'L3_SAC_440'], na.rm = TRUE)
totalabun_L1_SAC_440
totalabun_L2_SAC_440
totalabun_L3_SAC_440

head(metabodata1_L_SAC_440_subset)
# The next line will convert L1_SAC_440 from character to numeric data type

str(metabodata1_L_SAC_440_subset)

normsubset_L_SAC_440 <- metabodata1_L_SAC_440_subset %>%
  mutate(normL1_SAC_440 = L1_SAC_440/totalabun_L1_SAC_440, normL2_SAC_440 = L2_SAC_440/totalabun_L2_SAC_440, normL3_SAC_440 = L3_SAC_440/totalabun_L3_SAC_440)

normsubset_L_SAC_440
summary(normsubset_L_SAC_440)

# For Larvae, save this as L_SAC_440.csv
write_csv(normsubset_L_SAC_440, file ="data/metabodros/L_SAC_440.csv")

str(normsubset_L_SAC_440)

no_na_normsubset_L_SAC_440 <- normsubset_L_SAC_440 %>%
  select(L1_SAC_440, L2_SAC_440, L3_SAC_440)%>%
  na.omit()
no_na_normsubset_L_SAC_440

no_na_normsubset_L_SAC_440 %>% summarize(mean_abun_L1_SAC_440 = mean(L1_SAC_440),
                                         min_abun_L1_SAC_440 = min(L1_SAC_440),
                                         max_abun_L1_SAC_440 = max(L1_SAC_440),
                                         number_of_observations = n()
)

new10 <- read_csv("data/metabodros/L_SAC_440.csv")
new10

# ------
# L_SAC_748
# The next line will convert L1_SAC_748 from character to numeric data type
metabodata1$L1_SAC_748  <- as.numeric(metabodata1$L1_SAC_748)
metabodata1$L2_SAC_748  <- as.numeric(metabodata1$L2_SAC_748)
metabodata1$L3_SAC_748  <- as.numeric(metabodata1$L3_SAC_748)
class(metabodata1$L1_SAC_748)
class(metabodata1$L2_SAC_748)
class(metabodata1$L3_SAC_748)

metabodata1 %>% select("BinBase name",L1_SAC_748,L2_SAC_748,L3_SAC_748)
metabodata1_L_SAC_748_subset <- metabodata1 %>%
  select("BinBase name",L1_SAC_748,L2_SAC_748,L3_SAC_748)

str(metabodata1_L_SAC_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAC_748 )
totalabun_L1_SAC_748 <- sum(metabodata1_L_SAC_748_subset[, 'L1_SAC_748'], na.rm = TRUE)
totalabun_L2_SAC_748 <- sum(metabodata1_L_SAC_748_subset[, 'L2_SAC_748'], na.rm = TRUE)
totalabun_L3_SAC_748 <- sum(metabodata1_L_SAC_748_subset[, 'L3_SAC_748'], na.rm = TRUE)
totalabun_L1_SAC_748
totalabun_L2_SAC_748
totalabun_L3_SAC_748

head(metabodata1_L_SAC_748_subset)
# The next line will convert L1_SAC_748 from character to numeric data type

str(metabodata1_L_SAC_748_subset)

normsubset_L_SAC_748 <- metabodata1_L_SAC_748_subset %>%
  mutate(normL1_SAC_748 = L1_SAC_748/totalabun_L1_SAC_748, normL2_SAC_748 = L2_SAC_748/totalabun_L2_SAC_748, normL3_SAC_748 = L3_SAC_748/totalabun_L3_SAC_748)

normsubset_L_SAC_748
summary(normsubset_L_SAC_748)

# For Larvae, save this as L_SAC_748.csv
write_csv(normsubset_L_SAC_748, file ="data/metabodros/L_SAC_748.csv")

str(normsubset_L_SAC_748)

no_na_normsubset_L_SAC_748 <- normsubset_L_SAC_748 %>%
  select(L1_SAC_748, L2_SAC_748, L3_SAC_748)%>%
  na.omit()
no_na_normsubset_L_SAC_748

no_na_normsubset_L_SAC_748 %>% summarize(mean_abun_L1_SAC_748 = mean(L1_SAC_748),
                                         min_abun_L1_SAC_748 = min(L1_SAC_748),
                                         max_abun_L1_SAC_748 = max(L1_SAC_748),
                                         number_of_observations = n()
)

new11 <- read_csv("data/metabodros/L_SAC_748.csv")
new11

# ------
# L_SAC_907
# The next line will convert L1_SAC_907 from character to numeric data type
metabodata1$L1_SAC_907  <- as.numeric(metabodata1$L1_SAC_907)
metabodata1$L2_SAC_907  <- as.numeric(metabodata1$L2_SAC_907)
metabodata1$L3_SAC_907  <- as.numeric(metabodata1$L3_SAC_907)
class(metabodata1$L1_SAC_907)
class(metabodata1$L2_SAC_907)
class(metabodata1$L3_SAC_907)

metabodata1 %>% select("BinBase name",L1_SAC_907,L2_SAC_907,L3_SAC_907)
metabodata1_L_SAC_907_subset <- metabodata1 %>%
  select("BinBase name",L1_SAC_907,L2_SAC_907,L3_SAC_907)

str(metabodata1_L_SAC_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAC_907 )
totalabun_L1_SAC_907 <- sum(metabodata1_L_SAC_907_subset[, 'L1_SAC_907'], na.rm = TRUE)
totalabun_L2_SAC_907 <- sum(metabodata1_L_SAC_907_subset[, 'L2_SAC_907'], na.rm = TRUE)
totalabun_L3_SAC_907 <- sum(metabodata1_L_SAC_907_subset[, 'L3_SAC_907'], na.rm = TRUE)
totalabun_L1_SAC_907
totalabun_L2_SAC_907
totalabun_L3_SAC_907

head(metabodata1_L_SAC_907_subset)
# The next line will convert L1_SAC_907 from character to numeric data type

str(metabodata1_L_SAC_907_subset)

normsubset_L_SAC_907 <- metabodata1_L_SAC_907_subset %>%
  mutate(normL1_SAC_907 = L1_SAC_907/totalabun_L1_SAC_907, normL2_SAC_907 = L2_SAC_907/totalabun_L2_SAC_907, normL3_SAC_907 = L3_SAC_907/totalabun_L3_SAC_907)

normsubset_L_SAC_907
summary(normsubset_L_SAC_907)

# For Larvae, save this as L_SAC_907.csv
write_csv(normsubset_L_SAC_907, file ="data/metabodros/L_SAC_907.csv")

str(normsubset_L_SAC_907)

no_na_normsubset_L_SAC_907 <- normsubset_L_SAC_907 %>%
  select(L1_SAC_907, L2_SAC_907, L3_SAC_907)%>%
  na.omit()
no_na_normsubset_L_SAC_907

no_na_normsubset_L_SAC_907 %>% summarize(mean_abun_L1_SAC_907 = mean(L1_SAC_907),
                                         min_abun_L1_SAC_907 = min(L1_SAC_907),
                                         max_abun_L1_SAC_907 = max(L1_SAC_907),
                                         number_of_observations = n()
)

new12 <- read_csv("data/metabodros/L_SAC_907.csv")
new12

# ------
# L_PF_440
# The next line will convert L1_PF_440 from character to numeric data type
metabodata1$L1_PF_440  <- as.numeric(metabodata1$L1_PF_440)
metabodata1$L2_PF_440  <- as.numeric(metabodata1$L2_PF_440)
metabodata1$L3_PF_440  <- as.numeric(metabodata1$L3_PF_440)
class(metabodata1$L1_PF_440)
class(metabodata1$L2_PF_440)
class(metabodata1$L3_PF_440)

metabodata1 %>% select("BinBase name",L1_PF_440,L2_PF_440,L3_PF_440)
metabodata1_L_PF_440_subset <- metabodata1 %>%
  select("BinBase name",L1_PF_440,L2_PF_440,L3_PF_440)

str(metabodata1_L_PF_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PF_440 )
totalabun_L1_PF_440 <- sum(metabodata1_L_PF_440_subset[, 'L1_PF_440'], na.rm = TRUE)
totalabun_L2_PF_440 <- sum(metabodata1_L_PF_440_subset[, 'L2_PF_440'], na.rm = TRUE)
totalabun_L3_PF_440 <- sum(metabodata1_L_PF_440_subset[, 'L3_PF_440'], na.rm = TRUE)
totalabun_L1_PF_440
totalabun_L2_PF_440
totalabun_L3_PF_440

head(metabodata1_L_PF_440_subset)
# The next line will convert L1_PF_440 from character to numeric data type

str(metabodata1_L_PF_440_subset)

normsubset_L_PF_440 <- metabodata1_L_PF_440_subset %>%
  mutate(normL1_PF_440 = L1_PF_440/totalabun_L1_PF_440, normL2_PF_440 = L2_PF_440/totalabun_L2_PF_440, normL3_PF_440 = L3_PF_440/totalabun_L3_PF_440)

normsubset_L_PF_440
summary(normsubset_L_PF_440)

# For Larvae, save this as L_PF_440.csv
write_csv(normsubset_L_PF_440, file ="data/metabodros/L_PF_440.csv")

str(normsubset_L_PF_440)

no_na_normsubset_L_PF_440 <- normsubset_L_PF_440 %>%
  select(L1_PF_440, L2_PF_440, L3_PF_440)%>%
  na.omit()
no_na_normsubset_L_PF_440

no_na_normsubset_L_PF_440 %>% summarize(mean_abun_L1_PF_440 = mean(L1_PF_440),
                                        min_abun_L1_PF_440 = min(L1_PF_440),
                                        max_abun_L1_PF_440 = max(L1_PF_440),
                                        number_of_observations = n()
)

new13 <- read_csv("data/metabodros/L_PF_440.csv")
new13

# ------
# L_PF_748
# The next line will convert L1_PF_748 from character to numeric data type
metabodata1$L1_PF_748  <- as.numeric(metabodata1$L1_PF_748)
metabodata1$L2_PF_748  <- as.numeric(metabodata1$L2_PF_748)
metabodata1$L3_PF_748  <- as.numeric(metabodata1$L3_PF_748)
class(metabodata1$L1_PF_748)
class(metabodata1$L2_PF_748)
class(metabodata1$L3_PF_748)

metabodata1 %>% select("BinBase name",L1_PF_748,L2_PF_748,L3_PF_748)
metabodata1_L_PF_748_subset <- metabodata1 %>%
  select("BinBase name",L1_PF_748,L2_PF_748,L3_PF_748)

str(metabodata1_L_PF_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PF_748 )
totalabun_L1_PF_748 <- sum(metabodata1_L_PF_748_subset[, 'L1_PF_748'], na.rm = TRUE)
totalabun_L2_PF_748 <- sum(metabodata1_L_PF_748_subset[, 'L2_PF_748'], na.rm = TRUE)
totalabun_L3_PF_748 <- sum(metabodata1_L_PF_748_subset[, 'L3_PF_748'], na.rm = TRUE)
totalabun_L1_PF_748
totalabun_L2_PF_748
totalabun_L3_PF_748

head(metabodata1_L_PF_748_subset)
# The next line will convert L1_PF_748 from character to numeric data type

str(metabodata1_L_PF_748_subset)

normsubset_L_PF_748 <- metabodata1_L_PF_748_subset %>%
  mutate(normL1_PF_748 = L1_PF_748/totalabun_L1_PF_748, normL2_PF_748 = L2_PF_748/totalabun_L2_PF_748, normL3_PF_748 = L3_PF_748/totalabun_L3_PF_748)

normsubset_L_PF_748
summary(normsubset_L_PF_748)

# For Larvae, save this as L_PF_748.csv
write_csv(normsubset_L_PF_748, file ="data/metabodros/L_PF_748.csv")

str(normsubset_L_PF_748)

no_na_normsubset_L_PF_748 <- normsubset_L_PF_748 %>%
  select(L1_PF_748, L2_PF_748, L3_PF_748)%>%
  na.omit()
no_na_normsubset_L_PF_748

no_na_normsubset_L_PF_748 %>% summarize(mean_abun_L1_PF_748 = mean(L1_PF_748),
                                        min_abun_L1_PF_748 = min(L1_PF_748),
                                        max_abun_L1_PF_748 = max(L1_PF_748),
                                        number_of_observations = n()
)

new14 <- read_csv("data/metabodros/L_PF_748.csv")
new14

# ------
# L_PF_907
# The next line will convert L1_PF_907 from character to numeric data type
metabodata1$L1_PF_907  <- as.numeric(metabodata1$L1_PF_907)
metabodata1$L2_PF_907  <- as.numeric(metabodata1$L2_PF_907)
metabodata1$L3_PF_907  <- as.numeric(metabodata1$L3_PF_907)
class(metabodata1$L1_PF_907)
class(metabodata1$L2_PF_907)
class(metabodata1$L3_PF_907)

metabodata1 %>% select("BinBase name",L1_PF_907,L2_PF_907,L3_PF_907)
metabodata1_L_PF_907_subset <- metabodata1 %>%
  select("BinBase name",L1_PF_907,L2_PF_907,L3_PF_907)

str(metabodata1_L_PF_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PF_907 )
totalabun_L1_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L1_PF_907'], na.rm = TRUE)
totalabun_L2_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L2_PF_907'], na.rm = TRUE)
totalabun_L3_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L3_PF_907'], na.rm = TRUE)
totalabun_L1_PF_907
totalabun_L2_PF_907
totalabun_L3_PF_907

head(metabodata1_L_PF_907_subset)
# The next line will convert L1_PF_907 from character to numeric data type

str(metabodata1_L_PF_907_subset)

normsubset_L_PF_907 <- metabodata1_L_PF_907_subset %>%
  mutate(normL1_PF_907 = L1_PF_907/totalabun_L1_PF_907, normL2_PF_907 = L2_PF_907/totalabun_L2_PF_907, normL3_PF_907 = L3_PF_907/totalabun_L3_PF_907)

normsubset_L_PF_907
summary(normsubset_L_PF_907)

# For Larvae, save this as L_PF_907.csv
write_csv(normsubset_L_PF_907, file ="data/metabodros/L_PF_907.csv")

str(normsubset_L_PF_907)

no_na_normsubset_L_PF_907 <- normsubset_L_PF_907 %>%
  select(L1_PF_907, L2_PF_907, L3_PF_907)%>%
  na.omit()
no_na_normsubset_L_PF_907

no_na_normsubset_L_PF_907 %>% summarize(mean_abun_L1_PF_907 = mean(L1_PF_907),
                                        min_abun_L1_PF_907 = min(L1_PF_907),
                                        max_abun_L1_PF_907 = max(L1_PF_907),
                                        number_of_observations = n()
)

new15 <- read_csv("data/metabodros/L_PF_907.csv")
new15

# ------
# L_SF_440
# The next line will convert L1_SF_440 from character to numeric data type
metabodata1$L1_SF_440  <- as.numeric(metabodata1$L1_SF_440)
metabodata1$L2_SF_440  <- as.numeric(metabodata1$L2_SF_440)
metabodata1$L3_SF_440  <- as.numeric(metabodata1$L3_SF_440)
class(metabodata1$L1_SF_440)
class(metabodata1$L2_SF_440)
class(metabodata1$L3_SF_440)

metabodata1 %>% select("BinBase name",L1_SF_440,L2_SF_440,L3_SF_440)
metabodata1_L_SF_440_subset <- metabodata1 %>%
  select("BinBase name",L1_SF_440,L2_SF_440,L3_SF_440)

str(metabodata1_L_SF_440_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_440 )
totalabun_L1_SF_440 <- sum(metabodata1_L_SF_440_subset[, 'L1_SF_440'], na.rm = TRUE)
totalabun_L2_SF_440 <- sum(metabodata1_L_SF_440_subset[, 'L2_SF_440'], na.rm = TRUE)
totalabun_L3_SF_440 <- sum(metabodata1_L_SF_440_subset[, 'L3_SF_440'], na.rm = TRUE)
totalabun_L1_SF_440
totalabun_L2_SF_440
totalabun_L3_SF_440

head(metabodata1_L_SF_440_subset)
# The next line will convert L1_SF_440 from character to numeric data type

str(metabodata1_L_SF_440_subset)

normsubset_L_SF_440 <- metabodata1_L_SF_440_subset %>%
  mutate(normL1_SF_440 = L1_SF_440/totalabun_L1_SF_440, normL2_SF_440 = L2_SF_440/totalabun_L2_SF_440, normL3_SF_440 = L3_SF_440/totalabun_L3_SF_440)

normsubset_L_SF_440
summary(normsubset_L_SF_440)

# For Larvae, save this as L_SF_440.csv
write_csv(normsubset_L_SF_440, file ="data/metabodros/L_SF_440.csv")

str(normsubset_L_SF_440)

no_na_normsubset_L_SF_440 <- normsubset_L_SF_440 %>%
  select(L1_SF_440, L2_SF_440, L3_SF_440)%>%
  na.omit()
no_na_normsubset_L_SF_440

no_na_normsubset_L_SF_440 %>% summarize(mean_abun_L1_SF_440 = mean(L1_SF_440),
                                        min_abun_L1_SF_440 = min(L1_SF_440),
                                        max_abun_L1_SF_440 = max(L1_SF_440),
                                        number_of_observations = n()
)

new16 <- read_csv("data/metabodros/L_SF_440.csv")
new16

# ------
# L_SF_748
# The next line will convert L1_SF_748 from character to numeric data type
metabodata1$L1_SF_748  <- as.numeric(metabodata1$L1_SF_748)
metabodata1$L2_SF_748  <- as.numeric(metabodata1$L2_SF_748)
metabodata1$L3_SF_748  <- as.numeric(metabodata1$L3_SF_748)
class(metabodata1$L1_SF_748)
class(metabodata1$L2_SF_748)
class(metabodata1$L3_SF_748)

metabodata1 %>% select("BinBase name",L1_SF_748,L2_SF_748,L3_SF_748)
metabodata1_L_SF_748_subset <- metabodata1 %>%
  select("BinBase name",L1_SF_748,L2_SF_748,L3_SF_748)

str(metabodata1_L_SF_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_748 )
totalabun_L1_SF_748 <- sum(metabodata1_L_SF_748_subset[, 'L1_SF_748'], na.rm = TRUE)
totalabun_L2_SF_748 <- sum(metabodata1_L_SF_748_subset[, 'L2_SF_748'], na.rm = TRUE)
totalabun_L3_SF_748 <- sum(metabodata1_L_SF_748_subset[, 'L3_SF_748'], na.rm = TRUE)
totalabun_L1_SF_748
totalabun_L2_SF_748
totalabun_L3_SF_748

head(metabodata1_L_SF_748_subset)
# The next line will convert L1_SF_748 from character to numeric data type

str(metabodata1_L_SF_748_subset)

normsubset_L_SF_748 <- metabodata1_L_SF_748_subset %>%
  mutate(normL1_SF_748 = L1_SF_748/totalabun_L1_SF_748, normL2_SF_748 = L2_SF_748/totalabun_L2_SF_748, normL3_SF_748 = L3_SF_748/totalabun_L3_SF_748)

normsubset_L_SF_748
summary(normsubset_L_SF_748)

# For Larvae, save this as L_SF_748.csv
write_csv(normsubset_L_SF_748, file ="data/metabodros/L_SF_748.csv")

str(normsubset_L_SF_748)

no_na_normsubset_L_SF_748 <- normsubset_L_SF_748 %>%
  select(L1_SF_748, L2_SF_748, L3_SF_748)%>%
  na.omit()
no_na_normsubset_L_SF_748

no_na_normsubset_L_SF_748 %>% summarize(mean_abun_L1_SF_748 = mean(L1_SF_748),
                                        min_abun_L1_SF_748 = min(L1_SF_748),
                                        max_abun_L1_SF_748 = max(L1_SF_748),
                                        number_of_observations = n()
)

new17 <- read_csv("data/metabodros/L_SF_748.csv")
new17

# ------
# L_SF_907
# The next line will convert L1_SF_907 from character to numeric data type
metabodata1$L1_SF_907  <- as.numeric(metabodata1$L1_SF_907)
metabodata1$L2_SF_907  <- as.numeric(metabodata1$L2_SF_907)
metabodata1$L3_SF_907  <- as.numeric(metabodata1$L3_SF_907)
class(metabodata1$L1_SF_907)
class(metabodata1$L2_SF_907)
class(metabodata1$L3_SF_907)

metabodata1 %>% select("BinBase name",L1_SF_907,L2_SF_907,L3_SF_907)
metabodata1_L_SF_907_subset <- metabodata1 %>%
  select("BinBase name",L1_SF_907,L2_SF_907,L3_SF_907)

str(metabodata1_L_SF_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_L1_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L1_SF_907'], na.rm = TRUE)
totalabun_L2_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L2_SF_907'], na.rm = TRUE)
totalabun_L3_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L3_SF_907'], na.rm = TRUE)
totalabun_L1_SF_907
totalabun_L2_SF_907
totalabun_L3_SF_907

head(metabodata1_L_SF_907_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata1_L_SF_907_subset)

normsubset_L_SF_907 <- metabodata1_L_SF_907_subset %>%
  mutate(normL1_SF_907 = L1_SF_907/totalabun_L1_SF_907, normL2_SF_907 = L2_SF_907/totalabun_L2_SF_907, normL3_SF_907 = L3_SF_907/totalabun_L3_SF_907)

normsubset_L_SF_907
summary(normsubset_L_SF_907)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_L_SF_907, file ="data/metabodros/L_SF_907.csv")

str(normsubset_L_SF_907)

no_na_normsubset_L_SF_907 <- normsubset_L_SF_907 %>%
  select(L1_SF_907, L2_SF_907, L3_SF_907)%>%
  na.omit()
no_na_normsubset_L_SF_907

no_na_normsubset_L_SF_907 %>% summarize(mean_abun_L1_SF_907 = mean(L1_SF_907),
                                        min_abun_L1_SF_907 = min(L1_SF_907),
                                        max_abun_L1_SF_907 = max(L1_SF_907),
                                        number_of_observations = n()
)

new18 <- read_csv("data/metabodros/L_SF_907.csv")
new18

# ------ FOOD
# F_PF
# The next line will convert F_PF 1,2,3  from character to numeric data type
metabodata2$F1_PF_907  <- as.numeric(metabodata2$F1_PF_907)
metabodata2$F2_PF_907  <- as.numeric(metabodata2$F2_PF_907)
metabodata2$F3_PF_907  <- as.numeric(metabodata2$F3_PF_907)
class(metabodata1$F1_SF_907)
class(metabodata1$F2_SF_907)
class(metabodata1$F3_SF_907)

metabodata1 %>% select("BinBase name",L1_SF_907,L2_SF_907,L3_SF_907)
metabodata1_L_SF_907_subset <- metabodata1 %>%
  select("BinBase name",L1_SF_907,L2_SF_907,L3_SF_907)

str(metabodata1_L_SF_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SF_907 )
totalabun_L1_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L1_SF_907'], na.rm = TRUE)
totalabun_L2_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L2_SF_907'], na.rm = TRUE)
totalabun_L3_SF_907 <- sum(metabodata1_L_SF_907_subset[, 'L3_SF_907'], na.rm = TRUE)
totalabun_L1_SF_907
totalabun_L2_SF_907
totalabun_L3_SF_907

head(metabodata1_L_SF_907_subset)
# The next line will convert L1_SF_907 from character to numeric data type

str(metabodata1_L_SF_907_subset)

normsubset_L_SF_907 <- metabodata1_L_SF_907_subset %>%
  mutate(normL1_SF_907 = L1_SF_907/totalabun_L1_SF_907, normL2_SF_907 = L2_SF_907/totalabun_L2_SF_907, normL3_SF_907 = L3_SF_907/totalabun_L3_SF_907)

normsubset_L_SF_907
summary(normsubset_L_SF_907)

# For Larvae, save this as L_SF_907.csv
write_csv(normsubset_L_SF_907, file ="data/metabodros/L_SF_907.csv")

str(normsubset_L_SF_907)

no_na_normsubset_L_SF_907 <- normsubset_L_SF_907 %>%
  select(L1_SF_907, L2_SF_907, L3_SF_907)%>%
  na.omit()
no_na_normsubset_L_SF_907

no_na_normsubset_L_SF_907 %>% summarize(mean_abun_L1_SF_907 = mean(L1_SF_907),
                                        min_abun_L1_SF_907 = min(L1_SF_907),
                                        max_abun_L1_SF_907 = max(L1_SF_907),
                                        number_of_observations = n()
)

new18 <- read_csv("data/metabodros/L_SF_907.csv")
new18
# Unused
# ------
new <- read_csv("data/metabodros/L_PAT_748.csv")
new



# Unused lines:
#drop_na(name_of_the_column)
#    mean(na.rm = TRUE)
# normsubset_L_PAT_748$L1_PAT_748 <- as.numeric(normsubset_PAT_748$L1_PAT_748)

#filtered <- metabodata1_subset %>%
#  select("BinBase name",L1_PAT_748) %>%
#  filter(L1_PAT_748<25000)

#filtered

# What is the data type for L1_PAT_748 ?


# How can we select rows 105 to 200?


# How can we determine the mean, the median, the standard deviation?
#selected_pat_748 %>% select("L1_PAT_748") %>% filter(!L1_PAT_748 >= 0)

#selected_pat_748 %>% select("L1_PAT_748") %>% filter(L1_PAT_748 > 0)

#selected_pat_748 %>% select("L1_PAT_748") %>% filter(L1_PAT_748 > 0 & L1_PAT_748 < 10) %>% mean()

#na.omit(select_pat_748) %>% mean()

