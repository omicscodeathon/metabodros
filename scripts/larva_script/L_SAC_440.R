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