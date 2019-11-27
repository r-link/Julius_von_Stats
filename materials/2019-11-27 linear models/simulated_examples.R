# define x variable
x <- 1:100

# example 1: true relationship linear ------
# conditional mean values
yhat1 <- 12 + 0.3 * x
# simulated response variable
y1 <- rnorm(n = 100, mean = yhat1, sd = 3)

# plot of relationship
plot(y1 ~ x)
lines(yhat1 ~ x)

# fit linear model
lm1 <- lm(y1 ~ x)

# inspect model summary  
summary(lm1)

# add predictions to plot
abline(lm1, col = 2)

# model inspection plots
par(mfrow = c(2, 2))
plot(lm1)
par(mfrow = c(1, 1))


# example 2: true relationship nonlinear ------
# conditional mean values (from parabola)
yhat2 <- (0.1 * (x - 50))^2
# simulated response variable
y2 <- rnorm(n = 100, mean = yhat2, sd = 3)

# plot of relationship
plot(y2 ~ x)
lines(yhat2 ~ x)

# fit linear model
lm2 <- lm(y2 ~ x)

# inspect model summary  
summary(lm2)

# add predictions to plot
abline(lm2, col = 2)

# model inspection plots
par(mfrow = c(2, 2))
plot(lm2)
par(mfrow = c(1, 1))


# example 3: inhomogeneous error variance -------
# new response with same mean as in first example, but
# lognormal errors
y3 <- exp(rnorm(n = 100, mean = log(yhat1), sd = 0.4))

# plot of relationship
plot(y3 ~ x)
lines(yhat1 ~ x)

# fit linear model
lm3 <- lm(y3 ~ x)

# inspect model summary  
summary(lm3)

# add predictions to plot
abline(lm3, col = 2)

# model inspection plots
par(mfrow = c(2, 2))
plot(lm3)
par(mfrow = c(1, 1))


# example 4: autocorrelated residuals -------
# simulate AR1 autocorrelated residuals
res <- vector(length = 100)
res[1] <- rnorm(n = 1, mean = 0, sd = 1)
for(i in 2:100) res[i] <- 0.9 * res[i-1] + rnorm(n = 1, mean = 0, sd = 1)

# get response
y4 <- yhat1  + res


# plot of relationship
plot(y4 ~ x)
lines(y4 ~ x)
lines(yhat1 ~ x)

# fit linear model
lm4 <- lm(y4 ~ x)

# inspect model summary  
summary(lm4)

# add predictions to plot
abline(lm4, col = 2)

# model inspection plots
par(mfrow = c(2, 2))
plot(lm4)
par(mfrow = c(1, 1))


# example 5: presence of outliers -------
# take y1 and add some outliers
y5 <- ifelse(test = runif(n = 100) < 0.9,
             yes  = yhat1 + rnorm(100, 0, 3),
             no   = yhat1 + rnorm(100, 0, 15))

# plot of relationship
plot(y5 ~ x)
lines(yhat1 ~ x)

# fit linear model
lm5 <- lm(y5 ~ x)

# inspect model summary  
summary(lm5)

# add predictions to plot
abline(lm5, col = 2)

# model inspection plots
par(mfrow = c(2, 2))
plot(lm5)
par(mfrow = c(1, 1))

