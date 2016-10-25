library(pls)

# read in data
train_data <- read.csv("../../data/train-data.csv")
test_data <- read.csv("../../data/test-data.csv")
full_data <- read.csv("../../data/scaled-credit.csv")

### TRAIN ###
set.seed(100)
plsr.fit <- plsr(Balance~., data = train_data[,-1], validation = "CV")

# save plot
png("../../images/plsr-models-plot.png")
validationplot(plsr.fit, val.type = "MSEP")
dev.off()

# model selection
best_comp_num <- which(plsr.fit$validation$PRESS == min(plsr.fit$validation$PRESS))

### TEST ###
target_y <- test_data$Balance
# test set prediction -- MSE
plsr.pred <- predict(plsr.fit, test_data[,c(-1, -13)], ncomp = best_comp_num)
plsr_test_mse <- mean((plsr.pred - target_y)^2)

### FULL DATASET ###
official_fit <- plsr(Balance~., data = full_data[,-1], ncomp = best_comp_num)
plsr_official_coef <- coef(official_fit)

# save RData
save(plsr.fit, best_comp_num, plsr_test_mse, plsr_official_coef, file = "../../data/regressions/plsr-models.RData")