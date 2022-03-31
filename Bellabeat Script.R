head(dailyActivity_merged)
colnames(dailyActivity_merged)

head(dailyCalories_merged)
colnames(dailyCalories_merged)

head(dailyIntensities_merged)
colnames(dailyIntensities_merged)

head(dailySteps_merged)
colnames(dailySteps_merged)

head(heartrate_seconds_merged)
colnames(heartrate_seconds_merged)

head(minuteMETsNarrow_merged)
colnames(minuteMETsNarrow_merged)

head(sleepDay_merged)
colnames(sleepDay_merged)

head(weightLogInfo_merged)
colnames(weightLogInfo_merged)

n_distinct(dailyActivity_merged$Id)
n_distinct(dailyCalories_merged$Id)
n_distinct(dailyIntensities_merged$Id)
n_distinct(dailySteps_merged$Id)
n_distinct(heartrate_seconds_merged$Id)
n_distinct(minuteMETsNarrow_merged$Id)
n_distinct(sleepDay_merged$Id)
n_distinct(weightLogInfo_merged$Id)

summary(dailyActivity_merged)
summary(sleepDay_merged)

dailyActivity_merged %>%
  select(TotalSteps, TotalDistance, SedentaryMinutes) %>%
  summary()

sleepDay_merged %>%
  select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>%
  summary()

ggplot(dailyActivity_merged, aes(x=TotalSteps, y=SedentaryMinutes, color=SedentaryMinutes)) + geom_point() + 
  stat_smooth(method = lm)+
  labs(title = "Relationship Between Steps Taken In A Day & Sedentary Minutes")

ggplot(dailyActivity_merged, aes(x=VeryActiveMinutes, y=Calories, color=Calories)) + geom_point() +
  stat_smooth(method = lm)+
  labs(title = "Relationship Between Very Active Minutes & Calories Burned") +
  scale_color_gradient(low = "steelblue", high = "Orange")

ggplot(dailyActivity_merged, aes(x=TotalSteps, y=Calories, color=Calories)) + geom_point() +
  stat_smooth(method = lm)+
  labs(title = "Relationship Between Total Steps & Calories Burned") +
  scale_color_gradient(low = "steelblue", high = "Orange")

ggplot(dailyActivity_merged, aes(x=TotalDistance, y=Calories, color=Calories)) + geom_point() +
  stat_smooth(method = lm)+
  labs(title = "Relationship Between Total Distance & Calories Burned") +
  scale_color_gradient(low = "steelblue", high = "Orange")

ggplot(sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed, color=TotalTimeInBed)) + geom_point() +
  stat_smooth(method = lm)+
  labs(title = "Relationship Between Minutes Asleep & Time In Bed")


