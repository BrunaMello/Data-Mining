# EXERCISES: Multiple Linear Regression Exercises

# You can copy the following lines to R to load the data:

D <- data.frame(
  x1=c(0.58, 0.86, 0.29, 0.20, 0.56, 0.28, 0.08, 0.41, 0.22, 0.35,
       0.59, 0.22, 0.26, 0.12, 0.65, 0.70, 0.30, 0.70, 0.39, 0.72,
       0.45, 0.81, 0.04, 0.20, 0.95),
  x2=c(0.71, 0.13, 0.79, 0.20, 0.56, 0.92, 0.01, 0.60, 0.70, 0.73,
       0.13, 0.96, 0.27, 0.21, 0.88, 0.30, 0.15, 0.09, 0.17, 0.25,
       0.30, 0.32, 0.82, 0.98, 0.00),
  y=c(1.45, 1.93, 0.81, 0.61, 1.55, 0.95, 0.45, 1.14, 0.74, 0.98,
      1.41, 0.81, 0.89, 0.68, 1.39, 1.53, 0.91, 1.49, 1.38, 1.73,
      1.11, 1.68, 0.66, 0.69, 1.98)
)

# a) Calculate the parameter estimates (β0, β1, β2 and σ2), in addition find the usual 95% confidence intervals for β0, β1, and β2.

lm.fit <- lm(y ~ x1 + x2, data = D)

summary(lm.fit)

confint(lm.fit)

# b) Still using confidence level α = 0.05 reduce the model if appropriate.

lm.fit <- lm(y ~ x1, data = D)

summary(lm.fit)


# c) Carry out a residual analysis to check that the model assumptions are fulfilled.

par(mfrow=c(1,2))
qqnorm(lm.fit$residuals, pch=19)
qqline(lm.fit$residuals)
plot(lm.fit$fitted.values, lm.fit$residuals, pch=19, xlab = "Fitted values", ylab = "Residual values")

# d) Make a plot of the fitted line and 95% confidence and prediction intervals of the line for x1 ϵ [0, 1] (it is assumed that the model was reduced above).

newx1 <- seq(0,1, by=0.01)
prediction <- predict(lm.fit, newdata = data.frame(x1=newx1), interval = "prediction")
confidence <- predict(lm.fit, newdata = data.frame(x1=newx1), interval = "confidence")
plot(newx1, prediction[ , "fit"], type = "l", ylim=c(0.1, 2.4), xlab ="x1", ylab = "prediction")
lines(newx1, confidence[ , "lwr"], col = "green", lty=2)
lines(newx1, confidence[ , "upr"], col = "green", lty=2)
lines(newx1, prediction[ , "lwr"], col = "red", lty=2)
lines(newx1, prediction[ , "upr"], col = "red", lty=2)
legend("topleft", c("Prediction", "Confidence Band", "Prediction Band"), lty = c(1,2,2), col = c(1,3,2), cex = 0.7)


