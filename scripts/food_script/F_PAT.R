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