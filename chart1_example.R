library("dplyr")
library("ggplot2")
library("plotly")

SPL_df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

SPL_df <- SPL_df %>% mutate(date = as.Date(paste0(CheckoutYear, '-', CheckoutMonth,'-01'),'%Y-%m-%d'))

SPL_df$date <- as.Date(SPL_df$date, format = "%m-%d-%Y")

avg_checkout <- SPL_df %>%
  group_by(date) %>%
  summarize(avgCheckouts = mean(Checkouts))

average <- ggplot(data = avg_checkout) +
  geom_line(aes(x = date, y = avgCheckouts, color = 'orange')) + 
  geom_point(aes(x = date, y = avgCheckouts, color = 'orange')) +
  labs(title = "Monthly checkout of non-fiction books",
       x = "Date",
       y= "Average checkout of non-fiction books") 
average
