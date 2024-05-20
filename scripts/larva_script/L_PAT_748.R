# ------
# The next line will convert L1_PAT_748 from character to numeric data type
metabodata1$L1_PAT_748  <- as.numeric(metabodata1$L1_PAT_748)
class(metabodata1$L1_PAT_748)

metabodata1 %>% select("BinBase name",L1_PAT_748,L2_PAT_748,L3_PAT_748)
metabodata1_L_PAT_748_subset <- metabodata1 %>%
  select("BinBase name",L1_PAT_748,L2_PAT_748,L3_PAT_748)

str(metabodata1_L_PAT_748_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PAT_748 )
totalabun_L1_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L1_PAT_748'], na.rm = TRUE)
totalabun_L2_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L2_PAT_748'], na.rm = TRUE)
totalabun_L3_PAT_748 <- sum(metabodata1_L_PAT_748_subset[, 'L3_PAT_748'], na.rm = TRUE)
totalabun_L1_PAT_748
totalabun_L2_PAT_748
totalabun_L3_PAT_748

head(metabodata1_L_PAT_748_subset)
# The next line will convert L1_PAT_748 from character to numeric data type

str(metabodata1_L_PAT_748_subset)

normsubset_L_PAT_748 <- metabodata1_L_PAT_748_subset %>%
  mutate(normL1_PAT_748 = L1_PAT_748/totalabun_L1_PAT_748, normL2_PAT_748 = L2_PAT_748/totalabun_L2_PAT_748, normL3_PAT_748 = L3_PAT_748/totalabun_L3_PAT_748)

normsubset_L_PAT_748
summary(normsubset_L_PAT_748)

# For Larvae, save this as L_PAT_748.csv
write_csv(normsubset_L_PAT_748, file ="data/metabodros/L_PAT_748.csv")

str(normsubset_L_PAT_748)

no_na_normsubset_L_PAT_748 <- normsubset_L_PAT_748 %>%
  select(L1_PAT_748, L2_PAT_748, L3_PAT_748)%>%
  na.omit()
no_na_normsubset_L_PAT_748

no_na_normsubset_L_PAT_748 %>% summarize(mean_abun_L1_PAT_748 = mean(L1_PAT_748),
                                         min_abun_L1_PAT_748 = min(L1_PAT_748),
                                         max_abun_L1_PAT_748 = max(L1_PAT_748),
                                         number_of_observations = n()
)

new2 <- read_csv("data/metabodros/L_PAT_748.csv")
new2