data = read.csv("/home/MED/starkeseb/cohort_analysis.csv", sep=",")
data_for_os = read.csv("~/mbro_local/data/DKTK/outcome.csv", sep=";")[c("ID_Radiomics", "OS", "OStime")]

data = merge(data, data_for_os)

names = colnames(data)


# Mann-Whitney-U test for continuous variables
wilcox.test(data$GTVtu_from_mask ~ data$cohort, paired=FALSE, alternative="two.sided", na.action=na.omit)
#wilcox.test(data$LRCtime ~ data$cohort, paired=FALSE, alternative="two.sided", na.action=na.omit)
wilcox.test(data$Age ~ data$cohort, paired=FALSE, alternative="two.sided", na.action=na.omit)

# for the follow up time we only consider the patients that are alive
patients_alive = data[data$OS == 1,]
#summary(patients_alive)

patients_alive_train = patients_alive[patients_alive$cohort == "training",]
summary(patients_alive_train$LRCtime)
patients_alive_test = patients_alive[patients_alive$cohort == "test",]
summary(patients_alive_test$LRCtime)

wilcox.test(patients_alive$LRCtime ~ patients_alive$cohort, paired=FALSE, alternative="two.sided", na.action=na.omit)
# Chi-squared test for categorical variables
# gender
tab = table(data$cohort, data$Gender)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value


# T
tab = table(data$cohort, data$T)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value

# N
tab = table(data$cohort, data$N)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value

# UICC
tab = table(data$cohort, data$UICC2010)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value

# site
tab = table(data$cohort, data$site)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value


# p16
tab = table(data$cohort, data$p16)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value


# grading
tab = table(data$cohort, data$Grading)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value

# LRC
tab = table(data$cohort, data$LRC)
barplot(prop.table(tab, 1), beside=TRUE, legend.text=TRUE)
chisq.test(tab)$p.value

