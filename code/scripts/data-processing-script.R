credit_data <- read.csv("data/Credit.csv")

# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit_data)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit_data$Balance)

# mean centering & standardization
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "data/scaled-credit.csv")

