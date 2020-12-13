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
  geom_bar(stat="identity", fill="steelblue") +
  theme_classic()
