library(readr)
mal<- read.csv("C:/Users/USER/OneDrive/Desktop/Fourth Year 1st Sem and Second semester/2nd Semester/Biostatistics/Biostatistics/New folder/week2_malaria_followup_person_time.csv")

## Commulative Incidence/ Incidence Proportion or risk
mal%>%
  summarise(
    children_at_risk= n(),
    new_cases=sum(new_malaria_episode==1),
    risk=new_cases/children_at_risk,
    risk_percent= 100*risk
  )

### Incidence Rate
mal%>%
  summarise(
    new_cases=sum(new_malaria_episode==1),
    total_person_months= sum(person_months),
    rate_per_1000_child_months =
      new_cases/total_person_months*1000
  )

### Incidence rate by bed net use
mal%>%
  group_by(bednet_use)%>%
  summarise(
    n= n(),
    new_cases=sum(new_malaria_episode==1),
    total_person_months =sum(person_months),
    risk_percent= 100*new_cases/ n,
    rate_per_1000 = new_cases/total_person_months* 1000,
    .groups="drop"
  )
