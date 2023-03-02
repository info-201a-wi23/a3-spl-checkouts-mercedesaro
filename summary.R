
library("dplyr")
library("scales")
library("ggplot2")
library("tidyverse")

SPL_df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

SPL_df <- SPL_df %>% mutate(date = as.Date(paste0(CheckoutYear, '-', CheckoutMonth,'-01'),'%Y-%m-%d'))

SPL_df$date <- as.Date(SPL_df$date, format = "%m-%d-%Y")

## Total number of books checked out in 2017

books_checked_out_2017 <- SPL_df %>%
  filter(CheckoutYear == "2017") %>%
  nrow()

##Total number of books checked out in 2023

books_checked_out_2023 <- SPL_df %>%
  filter(CheckoutYear == "2023")%>%
  nrow()

#which month had the highest checkouts 

MostMonthCheckouts <- SPL_df %>% 
  group_by(CheckoutMonth) %>%
  summarize(checkoutmonthtotal = sum(Checkouts, na.rm = T)) %>%
  filter(checkoutmonthtotal == max(checkoutmonthtotal)) %>%
  mutate(Month_name = month.name[CheckoutMonth])


##most checked out book ever

most_checked_out_book <- SPL_df %>%
  filter(Checkouts == max(Checkouts))
  
most_checked_book <- most_checked_out_book$Title

  
##least checked out book

least_checked_out_book <- SPL_df %>%
  filter(Checkouts == min(Checkouts)) 

least_checked_book <- nrow(least_checked_out_book)


data_description = list(books_checked_out_2017, books_checked_out_2023, least_checked_book)
names(data_description) <- c("books_checked_out_2017", "books_checked_out_2023", "least_checked_book")

