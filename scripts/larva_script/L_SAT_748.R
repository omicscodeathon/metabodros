# ------
# L_SAT_748
# The next line will convert L1_SAT_748 from character to numeric data type
metabodata1$L1_SAT_748  <- as.numeric(metabodata1$L1_SAT_748)
class(metabodata1$L1_SAT_748)

metabodata1 %>% select("BinBase name",L1_SAT_748,L2_SAT_748,L3_SAT_748)
metabodata1_L_SAT_748_subset <- metabodata1 %>%
  select("BinBase name",L1_SAT_748,L2_SAT_748,L3_SAT_748)

str(metabodata1_L_SAT_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_SAT_748 )
totalabun_L1_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L1_SAT_748'], na.rm = TRUE)
totalabun_L2_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L2_SAT_748'], na.rm = TRUE)
totalabun_L3_SAT_748 <- sum(metabodata1_L_SAT_748_subset[, 'L3_SAT_748'], na.rm = TRUE)
totalabun_L1_SAT_748
totalabun_L2_SAT_748
totalabun_L3_SAT_748

head(metabodata1_L_SAT_748_subset)
# The next line will convert L1_SAT_748 from character to numeric data type

str(metabodata1_L_SAT_748_subset)

normsubset_L_SAT_748 <- metabodata1_L_SAT_748_subset %>%
  mutate(normL1_SAT_748 = L1_SAT_748/totalabun_L1_SAT_748, normL2_SAT_748 = L2_SAT_748/totalabun_L2_SAT_748, normL3_SAT_748 = L3_SAT_748/totalabun_L3_SAT_748)

normsubset_L_SAT_748
summary(normsubset_L_SAT_748)

# For Larvae, save this as L_SAT_748.csv
write_csv(normsubset_L_SAT_748, file ="data/metabodros/L_SAT_748.csv")

str(normsubset_L_SAT_748)

no_na_normsubset_L_SAT_748 <- normsubset_L_SAT_748 %>%
  select(L1_SAT_748, L2_SAT_748, L3_SAT_748)%>%
  na.omit()
no_na_normsubset_L_SAT_748

no_na_normsubset_L_SAT_748 %>% summarize(mean_abun_L1_SAT_748 = mean(L1_SAT_748),
                                         min_abun_L1_SAT_748 = min(L1_SAT_748),
                                         max_abun_L1_SAT_748 = max(L1_SAT_748),
                                         number_of_observations = n()
)

new5 <- read_csv("data/metabodros/L_SAT_748.csv")
new5

