# cars example (based on classical dataset from the 1920ies)
cars

# analysisstopping distance versus speed
plot(dist ~ speed, cars)

# fit linear model
lm1 <- lm(dist ~ speed, cars)
summary(lm1)

# inspect
par(mfrow = c(2,2))
plot(lm1)
par(mfrow = c(1,1))
# -- some indications of heterogeneity

# refit with log-log linear model
lm2 <- lm(log(dist) ~ log(speed), cars)
summary(lm2)

# inspect
par(mfrow = c(2,2))
plot(lm2)
par(mfrow = c(1,1))
# looks great

# plot the predictions of the two models
plot(dist ~ speed, cars)
lines(predict(lm1) ~ cars$speed, lty = 2)
lines(exp(predict(lm2)) ~ cars$speed, col = 2)

