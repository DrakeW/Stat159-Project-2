library(pls)

# read in data
train_data <- read.csv("data/train-data.csv")
test_data <- read.csv("data/test-data.csv")
full_data <- read.csv("data/scaled-credit.csv")

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
official_fit <- pcr(Balance~., data = full_data[,-1], ncomp = best_comp_num)
pcr_official_coef <- coef(official_fit)

# save RData
save(pcr.fit, best_comp_num, pcr_test_mse, pcr_official_coef, file = "data/regressions/pcr-models.RData")

