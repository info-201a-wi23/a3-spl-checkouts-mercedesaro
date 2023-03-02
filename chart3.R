library("dplyr")
library("ggplot2")

SPL_df <- read.csv("~/Desktop/info201/a3-spl-checkouts-mercedesaro/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

SPL_df <- SPL_df %>% mutate(date = as.Date(paste0(CheckoutYear, '-', CheckoutMonth,'-01'),'%Y-%m-%d'))

SPL_df$date <- as.Date(SPL_df$date, format = "%m-%d-%Y")

material_type <- SPL_df %>%
  group_by(MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts))%>%
  filter(MaterialType %in% c("AUDIOBOOK" , "BOOK", "EBOOK", "SOUNDDISC"))

pie_chart <- ggplot(material_type, aes(x="", y = total_checkouts, fill = MaterialType)) +
  geom_bar(stat="identity", width=1) +
  coord_polar(theta = "y") +
  labs(title = "Total Checkouts by Material Type (2017-2023)", fill = "Material Type") +
  theme_void()
pie_chart

