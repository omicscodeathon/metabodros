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
