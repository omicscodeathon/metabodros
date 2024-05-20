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
