library(readr)
prev<- read.csv("C:/Users/USER/OneDrive/Desktop/Fourth Year 1st Sem and Second semester/2nd Semester/Biostatistics/Biostatistics/New folder/week2_cross_sectional_prevalence.csv")
##Install once ifneeded
install.packages(c("tidyverse","janitor","epiR"))
library(tidyverse)
library(janitor)
library(epiR)

glimpse(prev)
summary(prev)
head(prev)

# Checkfrequencyofcategoricalvariables
table(prev$sex)
table(prev$age_group)
table(prev$hypertension)

### Overall Prevalence
prev%>%
  summarise(
    n =n(),
    cases= sum(hypertension==1),
    prevalence=cases/n,
    prevalence_percent= 100 *prevalence
  )

## The prevalence of hypertension was 25%,meaning that 25 out of every 100 screened adults had
## hypertension.

#### Prevalence by Sex
prev%>%
  group_by(sex)%>%
  summarise(
    n =n(),
    cases= sum(hypertension==1),
    prevalence_percent= 100 *cases/n,
    .groups ="drop"
  )


## Prevalence by Age group
prev%>%
  group_by(age_group)%>%
  summarise(
    n =n(),
    cases= sum(hypertension==1),
    prevalence_percent= 100 *cases/n,
    .groups ="drop"
  )

#### Bar chart 
prev%>%
  group_by(age_group)%>%
  summarise(prevalence_percent =100*mean(hypertension== 1))%>%
  ggplot(aes(x= age_group,y=prevalence_percent))+
  geom_col()+
  labs(x="Age group",
       y="Hypertensionprevalence(%)",
       title="Prevalenceofhypertensionbyage group")
