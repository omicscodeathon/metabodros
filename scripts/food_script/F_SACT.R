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