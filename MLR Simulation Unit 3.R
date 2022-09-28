# MLR SIMULATION

D <- data.frame(
     y=c(9.29,12.67,12.42,0.38,20.77,9.52,2.38,7.46),
     x1=c(1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00),
     x2=c(4.00,12.00,16.00,8.00,32.00,24.00,20.00,28.00)
)

# a) Plot the observed values of y as a function of x1 and x2. Does it seem reasonable that either x1 or x2 can describe the variation in y?

par(mfrow=c(1,2))
plot(D$x1, D$y, xlab = "X1", ylab = "Y")
plot(D$x2, D$y, xlab = "X2", ylab = "Y")


# b) Estimate the parameters for the two models Yi = β0 + β1x1,i + єi,  єi~N(0,σ2) And Yi = β0 + β1x2,i + єi,  єi~N(0,σ2) and report the 95% confidence intervals for the parameters. Are any of the parameters significantly different from zero on a 95% confidence level?

lm.fit1 <- lm(y ~ x1, data = D)
lm.fit2 <- lm(y ~ x2, data = D)

confint(lm.fit1)

confint(lm.fit2)