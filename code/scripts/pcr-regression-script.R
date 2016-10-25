library(pls)

# read in data
train_data <- read.csv("data/train-data.csv")
test_data <- read.csv("data/test-data.csv")
full_data <- read.csv("data/scaled-credit.csv")

#load in RData for regression functions 
load("data/regression-functions.Rdata")

### TRAIN ###
set.seed(100)
pcr.fit <- pcr(Balance~., data = train_data[,-1], validation = "CV")

# save plot
png("images/pcr-models-plot.png")
validationplot(pcr.fit, val.type = "MSEP")
dev.off()

# model selection
best_comp_num <- which(pcr.fit$validation$PRESS == min(pcr.fit$validation$PRESS))

### TEST ###
target_y <- test_data$Balance
# test set prediction -- MSE
pcr.pred <- predict(pcr.fit, test_data[,c(-1, -13)], ncomp = best_comp_num)
pcr_test_mse <- mean((pcr.pred - target_y)^2)

### FULL DATASET ###
pcr_official_fit <- pcr(Balance~., data = full_data[,-1], ncomp = best_comp_num)
pcr_official_coef <- coef(pcr_official_fit)

#investigate the models fit
pcr_summary <- data.frame(residual_sum_squares(pcr_official_fit), total_sum_squares(pcr_official_fit), r_squared(pcr_official_fit), residual_std_error(pcr_official_fit), f_statistic(pcr_official_fit))
rownames(pcr_summary) <- "PCR"
colnames(pcr_summary) <- c("RSS", "TSS", "R Squared", "Residual Std. Error", "F Stat")

# save RData
save(pcr.fit, best_comp_num, pcr_test_mse, pcr_official_coef, pcr_summary, file = "data/regressions/pcr-models.RData")

