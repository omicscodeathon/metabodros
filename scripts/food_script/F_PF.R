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