library(readr)
malaria_week1<- read_csv("C:/Users/USER/OneDrive/Desktop/Fourth Year 1st Sem and Second semester/2nd Semester/Biostatistics/Biostatistics/New folder/ghana_malaria_survey_week1 (1).csv")
head(malaria_week1)

## The number of observations in the dataset
Observations<- nrow(malaria_week1)
Observations

## The number of variables in the dataset
variables<- length(malaria_week1)

## Variable types
class(malaria_week1$region)
class(malaria_week1$id)
class(malaria_week1$district)
class(malaria_week1$age_months)
class(malaria_week1$sex)
class(malaria_week1$fever)
class(malaria_week1$rdt_result)
class(malaria_week1$bednet_use)
class(malaria_week1$month)

## Checking for missing values
sum(is.na(malaria_week1))
rowSums(is.na(malaria_week1))
colSums(is.na(malaria_week1))
## Hence there is no missing values in the dataset.

## Frequency and percentage of sex.
count<-table(malaria_week1$sex)

data.frame(
  count= count,
  Percentage=round(100*prop.table(count),1)
)

## Frequency and percentage of fever.
count1<-table(malaria_week1$fever)
data.frame(
  count=count1,
  Percentage= round(100*prop.table(count1),1)
)

####  Frequency and percentage of RDT result.
count2<-table(malaria_week1$rdt_result)
data.frame(
  count=count2,
  percentage= round(100* prop.table(count2),1)
)

##  Two-way table of bed net use by RDT result.
tab1<- addmargins(table(malaria_week1$bednet_use,malaria_week1$rdt_result))
tab1

###Two-way table of fever by RDT result.
tab2<- addmargins(table(malaria_week1$fever, malaria_week1$rdt_result))
tab2
