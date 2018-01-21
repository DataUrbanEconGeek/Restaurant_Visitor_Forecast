library(dplyr)

air_combined <- air_reserve %>% 
                inner_join(air_store_info, by = "air_store_id") %>%
                mutate(visit_date = as.character(
                        as.Date(visit_datetime, format = "%Y-%m-%d")
                        )
                       ) %>%
                inner_join(air_visit_data, 
                           by = c("air_store_id", 
                                  "visit_date" = "visit_date")
                           ) %>%
                inner_join(date_info, by = c("visit_date" = "calendar_date"))


air_visit_data$visit_date <- as.Date(air_visit_data$visit_date)