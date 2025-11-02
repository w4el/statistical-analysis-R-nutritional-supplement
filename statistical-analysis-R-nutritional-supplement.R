

set.seed(123) # Ensure reproducibility
# Generate mouse weights before treatment
mouse_weights_before <- rnorm(n = 200, mean = 20, sd = sqrt(2))
# Generate mouse weights after treatment
mouse_weights_after <- rnorm(n = 200, mean = 21, sd = sqrt(2.5))

set.seed(123) # Ensure reproducibility
# Generate rat weights before treatment
rat_weights_before <- rweibull(n = 200, shape = 10, scale = 20)
# Generate rat weights after treatment
rat_weights_after <- rweibull(n = 200, shape = 9, scale = 21)

# Install and load ggplot2
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Prepare data for plotting
library(dplyr)
mouse_data <- data.frame(weight = c(mouse_weights_before, mouse_weights_after),
                         time = factor(rep(c("Before", "After"), each = 200)),
                         species = "Mouse")
rat_data <- data.frame(weight = c(rat_weights_before, rat_weights_after),
                       time = factor(rep(c("Before", "After"), each = 200)),
                       species = "Rat")
combined_data <- rbind(mouse_data, rat_data)

# Density plots
ggplot(combined_data, aes(x = weight, fill = time)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~species, scales = "free") +
  theme_minimal() +
  labs(title = "Density Plot of Weights Before and After Treatment", x = "Weight", y = "Density")

# Boxplots
ggplot(combined_data, aes(x = time, y = weight, fill = time)) +
  geom_boxplot() +
  facet_wrap(~species, scales = "free") +
  theme_minimal() +
  labs(title = "Boxplot of Weights Before and After Treatment", x = "", y = "Weight")
















# Assuming the 'mouse_weights_before', 'mouse_weights_after', 
# 'rat_weights_before', and 'rat_weights_after' are available from Task 1

# Combine the 'before' and 'after' treatment weights for mice and rats
combined_mice_weights <- c(mouse_weights_before, mouse_weights_after)
combined_rats_weights <- c(rat_weights_before, rat_weights_after)

# QQ plot for mice
qqnorm(combined_mice_weights)
qqline(combined_mice_weights)

# QQ plot for rats
qqnorm(combined_rats_weights)
qqline(combined_rats_weights)

# Shapiro-Wilk normality test for mice
shapiro_test_mice <- shapiro.test(combined_mice_weights)

# Shapiro-Wilk normality test for rats
shapiro_test_rats <- shapiro.test(combined_rats_weights)

# Output the results of the Shapiro-Wilk test
print(shapiro_test_mice)













# Paired t-test for mice
t_test_mice <- t.test(mouse_weights_before, mouse_weights_after, paired = TRUE)
# Output the results of the paired t-test
print(t_test_mice)


# Wilcoxon signed-rank test for rats
wilcox_test_rats <- wilcox.test(rat_weights_before, rat_weights_after, paired = TRUE)
# Output the results of the Wilcoxon signed-rank test
print(wilcox_test_rats)















install.packages("fitdistrplus")
library(fitdistrplus)

# Fit Weibull distribution
fit_weibull <- fitdist(rat_weights_after, "weibull")
# Fit lognormal distribution
fit_lognormal <- fitdist(rat_weights_after, "lnorm")
# Fit Gamma distribution
fit_gamma <- fitdist(rat_weights_after, "gamma")

# Compare the models
fit_models <- list(fit_weibull, fit_lognormal, fit_gamma)
descdist(rat_weights_after, boot = 1000)
cdfcomp(fit_models, legendtext = c("Weibull", "Lognormal", "Gamma"), plotstyle = "ggplot")
qqcomp(fit_models, legendtext = c("Weibull", "Lognormal", "Gamma"), plotstyle = "ggplot")
ppcomp(fit_models, legendtext = c("Weibull", "Lognormal", "Gamma"), plotstyle = "ggplot")



































