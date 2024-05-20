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

new5 <- read_csv("data/metabodros/food/F_SF.csv")
new5