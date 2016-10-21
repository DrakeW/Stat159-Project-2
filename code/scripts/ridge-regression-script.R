library(glmnet)

# read in data
train_data <- read.csv("data/train-data.csv")
test_data <- read.csv("data/test-data.csv")
full_data <- read.csv("data/scaled-credit.csv")

### TRAIN ###
train_x <- as.matrix(train_data)[,c(-1,-13)]
train_y <- train_data$Balance
grid <- 10^seq(10, -2, length = 100)
set.seed(100)
ridge.mod <- cv.glmnet(train_x, train_y, intercept = FALSE, standardize = FALSE, lambda = grid, alpha = 0)

# save plot
png("images/ridge-models-plot.png")
plot(ridge.mod, main = "Ridge Models Plot")
dev.off()

# model selection
min_lambda <- ridge.mod$lambda.min
best_fit <- glmnet(train_x, train_y, intercept = FALSE, standardize = FALSE, lambda = min_lambda, alpha = 0)
save(best_fit, file = "data/betst-ridge-model.RData")

### TEST ###
test_x <- as.matrix(test_data)[,c(-1,-13)]
target_y <- test_data$Balance
# test set prediction -- MSE
ridge.pred <- predict(best_fit, newx = test_x)
test_mse <- mean((ridge.pred - target_y)^2)

### FULL DATASET ###
full_x <- as.matrix(full_data)[,c(-1,-13)]
full_y <- full_data$Balance

official_fit <- glmnet(full_x, full_y, intercept = FALSE, standardize = FALSE, lambda = min_lambda, alpha = 0)
official_coef <- coef(official_fit)

# save RData
save(ridge.mod, min_lambda, test_mse, official_coef, file = "data/ridge-models.RData")

