# Load tidyverse
library(tidyverse)

# Import CSV of final numbers
raw <- read_csv('BOEProductivity.csv')
raw <- as_tibble(raw)

# Modify for plotting
calls <- raw
calls$InboundCalls <- calls$InboundCalls %>% replace_na(0)


# Plot Inbound Calls
ggplot(calls, aes(x=Day, y=InboundCalls)) +
  theme_classic() +
  geom_bar(stat="identity", fill="steelblue") +
  geom_label(label = "Election Day", x = 18.45, y = 220,
             label.padding = unit(0.25, "lines"), # Rectangle size around label
             label.r = unit(0, "lines"),
             label.size = 0.35,
             color = "white",
             fill="grey",
             inherit.aes = TRUE)
  
