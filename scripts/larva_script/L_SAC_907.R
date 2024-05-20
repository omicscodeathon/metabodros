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