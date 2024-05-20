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