library(tidyverse)
stackoverflow_file <- "https://raw.githubusercontent.com/datavizpyr/data/master/SO_data_2019/StackOverflow_survey_filtered_subsampled_2019.csv"
# load stackover flow results
survey_results <- read_csv(stackoverflow_file)

survey_results %>% select(CompTotal, Education)
df <- survey_results %>%
  filter(Education !="Less than bachelor's")%>%
  group_by(Education) %>%
  summarize(ave_salary = mean(CompTotal))
df_max <- df  %>%
  mutate(max_salary=ifelse(ave_salary==max(ave_salary), "1", "0"))
df_max %>%
  ggplot(aes(x = Education, y = ave_salary, fill=max_salary)) +
  geom_col(width=0.5)+
  scale_fill_manual( values = c( "1"="red", "0"="darkgray" ), guide = FALSE )+
  labs(title="Highlighting a Bar in Barplot in ggplt2")


# Pulled from here to test: https://datavizpyr.com/how-to-highlight-a-bar-in-barplot-in-r/
