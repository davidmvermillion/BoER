# Load tidyverse
library(tidyverse)

# Import CSV of final numbers
raw <- read_csv('BOEProductivity.csv')
raw <- as_tibble(raw)

# Modify for plotting
calls <- raw
calls$InboundCalls <- calls$InboundCalls %>% replace_na(0)
calls %>%
  mutate(highlight_flag = ifelse(Day == "20", T, F))

# Plot Inbound Calls
ggplot(calls, aes(x=Day, y=InboundCalls)) +
  theme_classic() +
  geom_bar(stat="identity", fill="steelblue") +
  geom_label(label = "Election Day", x = 18.2, y = 220,
             label.padding = unit(0.25, "lines"), # Rectangle size around label
             label.r = unit(0, "lines"),
             label.size = 0.35,
             color = "white",
             fill="grey",
             inherit.aes = TRUE) +
  labs(y = "Received \n Calls",
       title = "Call Volume By Workday", x = "Workday") +
  theme(axis.title.y = element_text(angle = 0, vjust = 0, color = "grey55"),
        axis.title.x = element_text(hjust = 0.05, color = "grey55"),
        plot.title = element_text(hjust = 0.5, color = "grey55", size = 30),
        axis.line = element_line(color = "grey80"),
        axis.ticks = element_line(color = "grey80"),
        axis.text = element_text(color = "grey55"))
  

----
ggplot(calls, aes(x=Day, y=InboundCalls)) +
  theme_classic() +
  geom_bar(stat="identity", fill="steelblue") +
  geom_label(label = "Election Day", x = 18.2, y = 220,
             label.padding = unit(0.25, "lines"), # Rectangle size around label
             label.r = unit(0, "lines"),
             label.size = 0.35,
             color = "white",
             fill="grey",
             inherit.aes = TRUE) +
  labs(y = "Received \n Calls",
       title = "Call Volume By Workday", x = "Workday") +
  theme(axis.title.y = element_text(angle = 0, vjust = 0, color = "grey55"),
        axis.title.x = element_text(hjust = 0.05, color = "grey55"),
        plot.title = element_text(hjust = 0.5, color = "grey55", size = 30),
        axis.line = element_line(color = "grey80"),
        axis.ticks = element_line(color = "grey80"),
        axis.text = element_text(color = "grey55"))
