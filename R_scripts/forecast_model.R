library(forecast)

train <- subset(air_visit_data, visit_date < "2017-04-01")
test <- subset(air_visit_data, visit_date >= "2017-04-01")

rest_ids <- unique(air_combined$air_store_id)

time_series <- list()

for(i in 1:length(rest_ids)){
        temp <- subset(train, air_store_id == rest_ids[i])
        temp2 <- temp %>% select(visit_date, visitors) %>%
                group_by(visit_date) %>% summarise(total_visits = sum(visitors))
        xts_obj <- xts(temp2$total_visits, order.by = temp2$visit_date)
        time_series[[i]] <- xts_obj
}

ar_mod1 <- Arima(time_series[[1]], order = c(1, 1, 1))
autoplot(forecast(ar_mod1, h = 30))

plot.xts(time_series[[2]])
plot.xts(diff(time_series[[2]]))
ggAcf(time_series[[2]])