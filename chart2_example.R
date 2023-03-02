library("dplyr")
library("ggplot2")

SPL_df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

SPL_df <- SPL_df %>% mutate(date = as.Date(paste0(CheckoutYear, '-', CheckoutMonth,'-01'),'%Y-%m-%d'))

SPL_df$date <- as.Date(SPL_df$date, format = "%m-%d-%Y")

usage_summary <- SPL_df %>%
  group_by(UsageClass, date) %>%
  summarize(total_checkouts = sum(Checkouts), .groups = "drop")

usage_summary_plot <- ggplot(usage_summary, aes(x=date, y = total_checkouts, color = UsageClass)) +
  geom_line() +
  labs(title = "Monthly Physical vs. Digital", x = "Month", y = "# of Checkouts") 

usage_summary_plot

