credit_data <- read.csv("data/scaled-credit.csv")

set.seed(100)
train_set_indices <- sample(1:400, 300)
test_set_indices <- -1 * train_set_indices

train_set <- credit_data[train_set_indices,][,-1]
test_set <- credit_data[test_set_indices,][,-1]

write.csv(train_set, file = "data/train-data.csv")
write.csv(test_set, file = "data/test-data.csv")
