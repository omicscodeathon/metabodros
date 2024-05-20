# ------
# L_PF_907
# The next line will convert L1_PF_907 from character to numeric data type
metabodata1$L1_PF_907  <- as.numeric(metabodata1$L1_PF_907)
metabodata1$L2_PF_907  <- as.numeric(metabodata1$L2_PF_907)
metabodata1$L3_PF_907  <- as.numeric(metabodata1$L3_PF_907)
class(metabodata1$L1_PF_907)
class(metabodata1$L2_PF_907)
class(metabodata1$L3_PF_907)

metabodata1 %>% select("BinBase name",L1_PF_907,L2_PF_907,L3_PF_907)
metabodata1_L_PF_907_subset <- metabodata1 %>%
  select("BinBase name",L1_PF_907,L2_PF_907,L3_PF_907)

str(metabodata1_L_PF_907_subset)
# Normalization of zymostenol 130/(TOTAL Abundances of all the metabolites for this
# replicate L1_PF_907 )
totalabun_L1_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L1_PF_907'], na.rm = TRUE)
totalabun_L2_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L2_PF_907'], na.rm = TRUE)
totalabun_L3_PF_907 <- sum(metabodata1_L_PF_907_subset[, 'L3_PF_907'], na.rm = TRUE)
totalabun_L1_PF_907
totalabun_L2_PF_907
totalabun_L3_PF_907

head(metabodata1_L_PF_907_subset)
# The next line will convert L1_PF_907 from character to numeric data type

str(metabodata1_L_PF_907_subset)

normsubset_L_PF_907 <- metabodata1_L_PF_907_subset %>%
  mutate(normL1_PF_907 = L1_PF_907/totalabun_L1_PF_907, normL2_PF_907 = L2_PF_907/totalabun_L2_PF_907, normL3_PF_907 = L3_PF_907/totalabun_L3_PF_907)

normsubset_L_PF_907
summary(normsubset_L_PF_907)

# For Larvae, save this as L_PF_907.csv
write_csv(normsubset_L_PF_907, file ="data/metabodros/L_PF_907.csv")

str(normsubset_L_PF_907)

no_na_normsubset_L_PF_907 <- normsubset_L_PF_907 %>%
  select(L1_PF_907, L2_PF_907, L3_PF_907)%>%
  na.omit()
no_na_normsubset_L_PF_907

no_na_normsubset_L_PF_907 %>% summarize(mean_abun_L1_PF_907 = mean(L1_PF_907),
                                         min_abun_L1_PF_907 = min(L1_PF_907),
                                         max_abun_L1_PF_907 = max(L1_PF_907),
                                         number_of_observations = n()
)

new15 <- read_csv("data/metabodros/L_PF_907.csv")
new15