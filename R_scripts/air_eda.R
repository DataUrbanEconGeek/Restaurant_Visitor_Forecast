library(dplyr)
library(zoo)
library(xts)
library(ggplot2)
library(forecast)

str(air_combined)
summary(air_combined)
names(air_combined)
head(air_combined)

hist(air_combined$reserve_visitors)
hist(air_combined$visitors)
plot(air_combined$reserve_visitors, air_combined$visitors)

plot(air_combined$air_genre_name)
plot(air_combined$air_area_name)
plot(air_combined$day_of_week)
plot(as.factor(air_combined$holiday_flg))

weekdays <- as.character(unique(air_combined$day_of_week))

for(i in 1:length(weekdays)){
        temp <- subset(air_combined, air_combined$day_of_week == weekdays[i])
        assign(weekdays[i], temp)
}

length(unique(air_combined$air_store_id))
rest1 <- subset(air_visit_data, air_store_id == "air_877f79706adbfb06")

rest1 <- rest1 %>% select(visit_date, visitors) %>%
        group_by(visit_date) %>% summarise(total_visits = sum(visitors))

ts1 <- xts(rest1$total_visits, order.by = rest1$visit_date)
plot.xts(ts1)
plot.xts(diff(ts1))

ggAcf(ts1)



