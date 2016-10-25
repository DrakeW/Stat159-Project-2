# read in data
train_data <- read.csv("data/train-data.csv")
test_data <- read.csv("data/test-data.csv")
full_data <- read.csv("data/scaled-credit.csv")

#load in RData for regression functions 
load("data/regression-functions.Rdata")

# train model based on train data
ols.mod <- lm(Balance~., data = train_data[,-1])
# predict on test set
target_y <- test_data$Balance
ols.pred <- predict(ols.mod, test_data[,c(-1,-13)])
ols_mse <- mean((ols.pred - target_y)^2)

# fit model with full data
ols_official_fit <- lm(Balance~., data = full_data[,-1])
ols_coeff <- coef(ols_official_fit)

#investigate the models fit 
ols_summary <- data.frame(residual_sum_squares(ols_official_fit), total_sum_squares(ols_official_fit), r_squared(ols_official_fit), residual_std_error(ols_official_fit), f_statistic(ols_official_fit))
rownames(ols_summary) <- "OLS"
colnames(ols_summary) <- c("RSS", "TSS", "R Squared", "Residual Std. Error", "F Stat")

save(ols.mod, ols_mse, ols_official_fit, ols_coeff, ols_summary, file = "data/regressions/ols-model.RData")
