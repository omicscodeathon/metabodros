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